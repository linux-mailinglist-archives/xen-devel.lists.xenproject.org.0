Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285667B0232
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608888.947679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS8L-00041q-4Q; Wed, 27 Sep 2023 10:51:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608888.947679; Wed, 27 Sep 2023 10:51:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS8L-0003zF-0L; Wed, 27 Sep 2023 10:51:09 +0000
Received: by outflank-mailman (input) for mailman id 608888;
 Wed, 27 Sep 2023 10:51:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlS8K-0003z9-4s
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:51:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be924684-5d23-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 12:51:01 +0200 (CEST)
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 06:50:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6769.namprd03.prod.outlook.com (2603:10b6:510:120::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.33; Wed, 27 Sep
 2023 10:50:54 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 10:50:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: be924684-5d23-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695811861;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Gr4dRfudEqPJua9kqOETZi67xgl59qH7LcW4XEccck4=;
  b=EQ0ejURRzw2G6sFbbtqLwT5DcaxxspYlFNNovQOvSRkH1Cky/VwpbBQW
   2nLHkid6TttnropIH3z9XjTBSQagJ2OkqYf9SNHhPPewO7uUCFnPSjKyT
   rCy/guRK/GCtejlJqrDRUZxINPBuYBuhT4FaZfh2WNScwV+OKqHKixIXo
   o=;
X-CSE-ConnectionGUID: vYcIOSQZQ6WsQpdu8+l/pQ==
X-CSE-MsgGUID: gjYCoj4bTvKEvkbUmk7Tbw==
X-IronPort-RemoteIP: 104.47.57.168
X-IronPort-MID: 123199452
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:izpV76nkArMSR0qn0vB7mNbo5gxPJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWD3SM/vcYmv0Kth3a4/l/E8HscPcx95gTAts/y8zFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqga5gCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eIpIxEqVSmxvryJ24ujRvQ8xcBkNPC+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iea9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmgAdNDSODinhJsqFKR90cUCkEcaUWYjOe6gHO7WI1jI
 VNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9S2+Z97qShSO/P24SN2BqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMS706
 yCHqm45nbp7sCIQ/6Cy/FSCjzfyoJHMF1cx/l+OADLj6R5lbom4YYDu8ULc8ftLMIeeSB+Go
 WQAnM+dqusJCPlhiRCwfQnEJ5nxj97tDdEWqQQH80UJn9h1x0OeQA==
IronPort-HdrOrdr: A9a23:2mP7Qq/ZyVsWUZJuw/tuk+G7db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVEqKQodcLG7SdG9qBbnmaKdjrNhW4tKMDOW3FdAT7sSiLcKoQeQYREWn9Q1vc
 gPAssOauEcFWIbsS+T2njELz9K+qj/zEnHv5a4855Yd3AXV0gs1XYMNi+rVmlNACVWD5swE5
 SRouJBujqbYHwSKv+2A3EUNtKz1OEiwPjdACIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH5zr/LiYDw9jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8Rry5uiwvqu3H0idmrD
 D1mWZtAy1P0QKYQoj1m2ql5+DY6kdZ15Y28y7SvZPhyfaJNA7SRfAxyr6xSSGpmnbIjOsMr5
 6j4Fjpyaa/LSmw7hgVtOK4Ii2C0HDE1kYfrQ==
X-Talos-CUID: 9a23:IBUWom08OOV2mk9Br6zNHLxfBPEuU1rm9UXpfXCjMH5lVe3WTRiIwfYx
X-Talos-MUID: 9a23:7GCr6wuqrrlh8jxpfc2nizNTH8Bqv66SFmMgj5YMhsyHahB6JGLI
X-IronPort-AV: E=Sophos;i="6.03,179,1694750400"; 
   d="scan'208";a="123199452"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UW9mO5XMH7w9nfi/9lDj8bFtiaJnFFLrDw99F23MJnqbhw8Yi/GMPnB8j6+wIKDU8uh0wr1KKk5lHprKSR6m9wy4BGluxVddWAeT96+3O07c6I3mt+XRjwzX5D80O5pYzukkBQPVoZWAjouOmM6ey9/q/nQnoGFwwo93AKvlbnYtGcOvPqiRilG/S0hTaKXW/BzlSd8K5154awweNMaXNeLhVZiQX2F7zaUVKKkcFTHbhzP8JKYFKpH+4fho8QiDGw3mlm95o+1VIyiAbNVY0499e5OgL4DMrz74GT6gZDKqnnfI/e5u7Nv7yvIJvJpY0E1Eqr1twPCeZ/nndoFfIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fo9y/+R5j+0LjcclKqUAIb8lI9z3H+akWTGADDUbCIc=;
 b=cRhmYwzXMGFJF0Fv1XH/G5okU9Z6qMN4L8hyDaH1apJUto5r27GJxPyAcflv435NgcMZvCUyXu6pHg6EMn2IrkMv+0nTKniHHezOkWOI7ay/Ua6CqsoUaZCUxgErJhOW9oUb9a6XrDuddaCjYLxTByDR0/Z1Dtib64zP7fSqJ6TX9yfAff8DFP60jN8rXK1H3msBD/Un0aihr+PMHY18a4F2P6TjnV5lzOAiNYlb+cVvWolk2iWtK7ZUCGR7Dp9od7t1Z1yXTMedqao9BNJ6erxjXf3C5oEzdptiSYL+I1Y0HCxxwa6qe44pIskWxnFFU1aD307DRM9b6nF/U+rL/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fo9y/+R5j+0LjcclKqUAIb8lI9z3H+akWTGADDUbCIc=;
 b=E+1B7SBIwi2ac/AAcOIFBQowgIujVGQIdTCLzV2bbq1FB4H/2WA7KyDdzWfIHoKaB47Mlg9yzZWmtUtWjhjB6HBqOfWW+eqb9edlRfXYtq9KRd4oo9Mc5MFWSzJgyAxYbLMovPyyhTjIz8B5AYkBukmKcMcfhlBvlmOoUGS9GZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 12:50:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/8] domain: GADDR based shared guest area
 registration alternative - teardown
Message-ID: <ZRQJCPNvwMs_VO9B@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
 <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
 <4e1e0b28-bb0b-03f9-d62e-dd04846dd2e4@suse.com>
 <ZRQHA0u5wPXkuILV@MacBookPdeRoger>
 <e0080de0-d64d-8b38-40e3-5bd779651ee6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0080de0-d64d-8b38-40e3-5bd779651ee6@suse.com>
X-ClientProxiedBy: LO4P265CA0277.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ae69c35-7d0e-4f57-080e-08dbbf479f07
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cuHSgTzZEchkLBWFqb63QAkhDiLbVudm3/DxJycYiz39XY0G1W1HheLKWqS9YdGf7vqN9IsBn7Jzm//CGM7liEjDj2/4UJZNB98J4JT17v0C+CjrkqbE7v0Iunfh9c6QR0JiGkKeZ+if8yJgmsj1HXNVDBcp9JvuCbuI8BeBMRqq2m1GH8/vcLTS2aqKURX6jZpFkMBt2EXt4JcReeFQj99jP+EKSSIByai2o6/MdnTye7WHEP3ajisRb2MxB/rWbRYxHr+dSzZQrvxkXd5d65xnTqVo4/MupFb7BkoFFVwTHRNeW5PrBtE38RD354PPLmCB4ABKiDt4NGYfbK+kU8YO5b+1PhfMxVMQOlUfmIiyYsBrlHVm26PTRAwfIU3ZtZn7Oc9GFZ+NEQ7yoLSnHin8NEIixlPvhnT9E9y2ZYFn62oCFY046hsTeSiOiPZZX3B5E3XCtZocMwym9UIkDVtLgBOeKNP+BQeoqDIJTPsRi8Q25H195xxXKLRk6JuT0FUYWprGd3mxBnLZhpFLkR4WOXhba9lm0UgKSPpzygYr/WKxVMFLvz+TePBLFN7d
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(1800799009)(186009)(83380400001)(6506007)(6666004)(53546011)(478600001)(6486002)(26005)(38100700002)(82960400001)(85182001)(8936002)(6916009)(316002)(66476007)(6512007)(5660300002)(41300700001)(86362001)(9686003)(54906003)(8676002)(4326008)(2906002)(33716001)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHQ2MkYrUDBGUmp6UzZSNkxXWStJRHJkK05RV0NrbDVSaCtvd3o2aGFJRDBn?=
 =?utf-8?B?QUxpZDlZanZTRm9kS3RRbzVqVVlCODlFY0JqUkIwRkpjYU1obmpHY245em5W?=
 =?utf-8?B?VUlaeTIxaUhyT2hKVFJzTTE1VHAxNGU3cXFVZ2hrUVBnVStmK3krYy9La0ox?=
 =?utf-8?B?czJrckdWbElaUTNLUlR1Ykd5ZWx3Yk13dWJjRTh2d3RmdVVyTDRMV3gxb0RR?=
 =?utf-8?B?TzRQcndldUxOeEVhUnNjT0FVZ0RWblQ3c08zRFVwQk1Yd1BmMGJaWlh3ZEJC?=
 =?utf-8?B?WDFnQ2lDMUpEOEVzSTRkNm56VlprLzZEMXpsK2xrMERUZzkwZG9DUXZSY0hy?=
 =?utf-8?B?MjBKMnBxLzl5MDNESTFsQlFEdnJFR3ExSE5yWWdlWitON2wvZm5VVENGY0Ew?=
 =?utf-8?B?Q01FajQ3QXZtTmRIMEZFMVJ2QTRmMzdXSUt5bGpVQVZwWkxHa3VJWmhhdmN4?=
 =?utf-8?B?UTJoSGcrNEsxQzhRU2l4Qk1DNXZyYllmMEtvWWU2YVE5TjZyb2hUYXVmL0lo?=
 =?utf-8?B?MEtYeVkvZm5mbFRvNTlaUk5ncGFYSXg0MDFJZG9EWGM1enZEaWE2Z0pVZFVR?=
 =?utf-8?B?S0lkMmNwNGd6R0NNOEJGdEJHV29BOEM4UDQ4UGU1RHlFRXp0anBpbHdhbzBO?=
 =?utf-8?B?VFh3U2xBZmJGMDNTRE4vOUNXUnNvcWIzNlpXOXdEVEdYY1MvVjBIS2hQSnpC?=
 =?utf-8?B?L1Z4TmNpT3FDUk1JMUFBU3hCTkFXRVRPYkoyelVCTEYxd2RUSGowVnlqMjcv?=
 =?utf-8?B?bWtkVWdsVDZwbWhYSlNmckV4cmcrcWtiOFlCSU5Kb21ueng1cUQ4bTQxL3pI?=
 =?utf-8?B?K25MdkdCYmFBWHpoZ2RCOEtNcXZmVUVkaEJWdU5qSWx4SlhubmpLSnhDRnpt?=
 =?utf-8?B?OGJEK2IrY2NTM1F5YTNaYU9zQkc5MDI0dGpBek9aeHJsVWhVREg4RHh5OFFF?=
 =?utf-8?B?UDJDUWdCbUpldTFuN2liayt1OU9LdkFCMTNjTnNWV2M2Z2EwbHRwZjdHQWdD?=
 =?utf-8?B?U2ZwY2tHaXUwVWdGWDYydnBQMkRiOXlleURlWlJhMVFMWWVkaHBXN3p0dUoz?=
 =?utf-8?B?bHJ3SWtPVVAxWkZOWDVxSFVMdHlHbjRscmV5WE5Fb3BLaUxqZTZSenF2eGE5?=
 =?utf-8?B?dmUwQmFYazJZL3pNbmI5M0RLdmZtaTVGRTBKcUwvRHJOTXlaVDFaUFNlb2dL?=
 =?utf-8?B?MU5aWkpFQWZYM0hFV29BaXl5U29JL09DWDRKNk9YNE4wM2tpS3JHQzBldDZX?=
 =?utf-8?B?Y0puQjBXZ3JkSThuOThpdVpTc0V3Wmh3TjFWaUZ3bWluaGpRNFFqamFoNEhx?=
 =?utf-8?B?THowQTRncm9nZk4yemNXelpIUnpFMms0eXN1NjJzallVbGUyK2pMSEdqK00z?=
 =?utf-8?B?QXhVUnZHYjhnNmVDVFdzUXUycDVGTWRZTm45eUNmNkdHZTdCcWpVY1VEZlFV?=
 =?utf-8?B?Q1E1cUwwSjhpbGdmOE0yK3MrL1EvZjdWSXhTZ242K21hTlY5M0FVMGw5WlVv?=
 =?utf-8?B?VlphNWJTdm9UbkF4dWlMRkhsYUFpVWxPaXJ6MGYvNkFDbUlXYlhNdWRrdTIx?=
 =?utf-8?B?SEFoa1NQbmcvWGRGdGhzcjdyUkZlT01wNWVuNS9DUWpJTXpTQ1FqWTFsUjJW?=
 =?utf-8?B?OXRmVTJoTUk0U3lEdlMvRWYzNC9LT2dOcEo0UmxieExpcHFxWG1WTU85L2Fk?=
 =?utf-8?B?c28vWW1HUWdTWHZSQjlaQWw5a0VWVXpTSkN3SGswRk9FYVhha3RWRHZRa21P?=
 =?utf-8?B?cGE2eHNIdU1kOGE5V0tEcGZZeGtoVFdvMWhOVmZncitKdUxnMGZZR1FIUmx5?=
 =?utf-8?B?MTNSK2o3QnIvSHdsUGV0cml5RXJHWkgrMmY1dURCZ0EvdXFoZmQxejNEMzk5?=
 =?utf-8?B?c3ZCTEZHWFdPRlI5MU8za3JQR1VRQzFuZ2pHVUVkVXRtNGdkRk4wbjdlYS9z?=
 =?utf-8?B?eVRUTFZOZktMSW8rb21NS0JZMGtWNGZjT21OaEVBSjRBRDlNT1NRWjFtY1d6?=
 =?utf-8?B?ZlYzaHpmUVJoSGI4M2wyMTFaYXBHRVFtNm1QT2FLSGlPZmgxeUFTVHM3L29L?=
 =?utf-8?B?STMxTnNTaTU4dW5GUWtyYWc1aEpnOTkvcXZsYlhxSXViUDZuR3NyakJmUFFZ?=
 =?utf-8?B?aDBWekdNTHBEcGY2eWs1RkY5Y0w2UDQyTnN4TnUxa25MOVM5bllCQUFkVFRR?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iyXW8jZc+AbDb9V5FTraVlUJTDM5tgvW8GWGOEVZ+vOgQ19DNudFNqisvHWn/suHIEarCSRuNtks7jl1aHZXz5dh+Vpp31gaFbraaN+SN57QLH7W/X23KdJxjQqajtFXRsNQ0QOXHhB0MQUQDssuc6bmAk+eykeuoWsGUT9kGRZc1dAysjq0PqmIlbR++Jare4N8jOE4fwS9c1FizSWgGHcVK7/jWei6TVDgwsw3phHF03h4Fr2NJbNN/LMfpjJHBmZ0RgjHVmtXxBUfHLwBQ4o/doz37w9z40wojhbYG1jsIj4LELBn+fGegyyiswizIPyuWTb6iNuMf2oxwph3cyqGfY+P9VvYdEQ+iYEnC5jCQ31NNTqbaqxgBHqWBv7JHa08vi18Jg1qT1T5NM2uNw+Pw2Pv+u3hcE5aIVDjU9UP9blkplM8yRY6VrpouUAaHIAN7E5tcF79ayoxc7LSRe+oVxLdveQL+gABnfPfOrBabz5/MnF08d9eYN89EyQTjibRKjPzXiRdUwd96qoYh9dhRYDFNQ47nWDpBT6JR3kSIGucgeX/hqCha3DWWxNROiaGtm3aRNwBl8lFhB+T/4hjtAqV5k14oEQ1mjIbikx6U0jUeSG0GFbSSpA8Yt9INZlVE1xjLV5S8snVy/BFwNnI6XQSCqdhNCxgylu+zuqpUj6Ys1Uew7S68Rjwu6R+DOOkMUt4fUFm6Cwf8L/7VHm81MaUcNCOPpyMLb/zyf7I3lw7ESegp0Ed/o3rcThTeeupec3ent57G/Dl/uumU9rBVN+fU7G09X0RNR0MOAZXIbAUFZ13rZfcXPZYPnxvyY38z8KF92jlJV5hniiKDY9AQcd+J+RUXCyMCDNotfk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae69c35-7d0e-4f57-080e-08dbbf479f07
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:50:53.7075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyfOgAlLLs0fhZhyM0hIqgSvtGtB4NY8tMZn21+DYTn9VYcPf0XQ+u6C0aQ70gjj6AoxwcZqZDbUNO0Gd/0i2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6769

On Wed, Sep 27, 2023 at 12:46:07PM +0200, Jan Beulich wrote:
> On 27.09.2023 12:42, Roger Pau Monné wrote:
> > On Wed, Sep 27, 2023 at 11:55:19AM +0200, Jan Beulich wrote:
> >> On 27.09.2023 10:51, Roger Pau Monné wrote:
> >>> On Wed, May 03, 2023 at 05:54:47PM +0200, Jan Beulich wrote:
> >>>> +{
> >>>> +    struct domain *d = v->domain;
> >>>> +
> >>>> +    if ( v != current )
> >>>> +        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
> >>>
> >>> Isn't this racy?
> >>
> >> It is, yes.
> >>
> >>>  What guarantees that the vcpu won't be kicked just
> >>> after the check has been performed?
> >>
> >> Nothing. This check isn't any better than assertions towards an ordinary
> >> spinlock being held. I assume you realize that we've got a number of such
> >> assertions elsewhere already.
> > 
> > Right, but different from spinlock assertions, the code here could be
> > made safe just by pausing the vCPU?
> 
> That's what the assertion is checking (see also the comment ahead of the
> function). It's just that the assertions cannot be made more strict, at
> least from all I can tell.

But the assertion might no longer be true by the time the code
afterwards is executed.  Why not wrap the code in a pair of
vcpu_{,un}pause() calls?

Thanks, Roger.

