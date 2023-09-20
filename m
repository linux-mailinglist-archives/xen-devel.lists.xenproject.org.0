Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8307A760D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605302.942904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisk6-0005ic-97; Wed, 20 Sep 2023 08:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605302.942904; Wed, 20 Sep 2023 08:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisk6-0005fU-66; Wed, 20 Sep 2023 08:39:30 +0000
Received: by outflank-mailman (input) for mailman id 605302;
 Wed, 20 Sep 2023 08:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qisk4-0005e8-M5
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:39:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3355228a-5791-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 10:39:25 +0200 (CEST)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 04:39:22 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6326.namprd03.prod.outlook.com (2603:10b6:a03:390::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 08:39:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:39:13 +0000
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
X-Inumbo-ID: 3355228a-5791-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695199165;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=1BRW4VuYePBwiJIDzbK4U8+0+aphNdsQpbvRrESzcaU=;
  b=DGi9urfjIHrLhkuwMUI4sH25clolPQ+NhOJN2q3bNuA20zZEWJB00U2b
   250LPxu2urJbS8Xnnt5lYkG5ioynGNoUUoxZWLtV+DwhVz2LutZZP6zOz
   ivW69qxZuzRdeKmWnzk8sqkSN7UVnlttxDr6MzvdeCx6PurlSP1ZPSUFZ
   E=;
X-CSE-ConnectionGUID: p/4uQM4rQ7SVLKcUQGc/Mg==
X-CSE-MsgGUID: ocnJm4pWTdKc10O/l19a/A==
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 123054172
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IiGxpKNUOlvBp3DvrR0SlsFynXyQoLVcMsEvi/4bfWQNrUpx0WcDm
 DQWWzuHOa6KY2X9KY9/bY+xoE8GucWHn4IwQAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5ARmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v4wXXx30
 KACEW82UDSgjN+P77n8b+Y506zPLOGzVG8ekldJ6GmDSNoDGtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxvzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCn027OWwnmTtIQ6E7a+1Ps2mGKvyk8YUUUxEl/i8PD+oxvrMz5YA
 wlOksY0loAM80isQsj4TgePineOtR4BWPJdC+Q/rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqG6rqLpCmufygUKWMPbzUNSwct6tzv5oo0i3rnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjprDQxMx5w7Xdnm49Q4/b4mgD6Sq9Fza4PBoPIufCF6bs
 xAsgNOC5eoDCZWMki2lQ+gXGrytofGfP1X0nlpHD5QnsTO39BaLZYlN5BluKUEvNdwLEQIFe
 2fWsAJVoZNWZ32jaPctZ5rrU5hzi6/9Cd7iS/bYKMJUZYR8fxOG+ycoYlOM22fqkw4nlqRX1
 YqnTPtAxE0yUcxPpAdajc9EuVP37kjSHV/ueK0=
IronPort-HdrOrdr: A9a23:maYS1qvF+7C2B/LU9GcnRgGY7skDWdV00zEX/kB9WHVpm6uj5q
 KTdZUgpHzJYVMqM03I9urgBED+ewK7yXcY2+Ys1M6ZLXHbUTKTXfpfBOjZowEIeReOjNK1vJ
 0IG8JD4bbLY2SS4/yX3OFte+xQueVuKc2T9ILjJg9WID2DlslbnmNE4hzxKDwQeDV7
X-Talos-CUID: =?us-ascii?q?9a23=3AOZMiyGmp9OjIpt8fxaWrl0mMfpDXOWWakGrpBhO?=
 =?us-ascii?q?iMDlSdpm2QmKp16gjtsU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Avqx16w+2FRO1UpoY+AeJjjCQf8Bj5YarVFgyrZk?=
 =?us-ascii?q?lsJDcEmt0YmaUyx3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="123054172"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtnJUeqw4pHMl+cWip2Kb20YPXuKlgit47rVRTowJKOlKXMUecEs9rLixsl3pzy5pyr42atKa7Nh01+SHEWj9vXMc+fPt0X02X9tQWTyXJ5OSFYCdY/LXcskSq/r/qOVFm20Gs7fyOeNd7qFlJrOI5vv7mIYl5Xk+khtBRtuAxnM0KwPy9sUZFNRq+vTBjoN8YZMkph+8DLD10+wDQcsa7WQL4SBmEu0+Z8cD2sB9l0LSpZ411D8TgyFnlrXtBnxvQh02+1IgeJEQnE8lWMNNccojQxPZ1cFwz48J4oE6qX4K5VXEqHhSnHsBX42Qj6w9R0BdZ/xsWUz+dSK6p2Rpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j22sGOJzmYFfaFHf0BAuMPnSwOdzz8XnncNM1sZxYLg=;
 b=Vgl0/hpXYZhF62NG1qYiGb3vLsdDHnwYV2YFXStaqx8xEhWxEfNpMwes+A6940rPCYTS0vExvd1Qz1XRW7oe7Q4FkLOZz+PZ2pNdQUHRavfkRNmAj0shK4E/IpxYBfDSa7TaSU0p6jR8LHJiBFlXHuQK2dvNCEvZ+dyjQj2KOp7u7EDZ4KdVx6KPsek975u+UZoyvBnysCVYQoE6WYw3PNF/7TLGcAsIqJGqkTZBCFBLdunCYTfMOo5Fq/fLDlbSZVDm+bPF4tXbUCXOaXN83OdcU/BFO9G1PFirzX+rPOKblvvXgKC/4WE6a4O0TqWzM3lW4k3LuRlE38DVKcI3hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j22sGOJzmYFfaFHf0BAuMPnSwOdzz8XnncNM1sZxYLg=;
 b=DzdC/0uDZahWUEQhjAsA/IgM/c46TMNdmiC8pzkpMA2KRTmSovMERbFKdJTvNo7XXkyEtRx8Q0K15gv8PQVGsyy+e/UljbE+lhCHipQvZ/v/jqSv/4P4xYtngRqfAzXdUjm2ELOVF/DI5algBmlTPLRKfsChqHWvKsDcuGX9+mQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 10:39:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v9 04/16] vpci: add hooks for PCI device assign/de-assign
Message-ID: <ZQqvrDGH6Qxxgrjp@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-5-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO2P265CA0041.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::29) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7395119c-094a-4a79-5497-08dbb9b51166
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9bbFmmFEMNMyfdiSjbE3ne2woMsRkWwuhzovX7kMM1SQRTQwQ/HGiObKIDq31SewTiFEr9UXW0seO9dyvXIkmsVMDlagV/gSdnmKtpYnIOfugovePTkvq4DgXLutp+HxgxUmnKm8rlnwchvlxmhCYjwvhTP34rDOycSaivOWfydNO9/0yMbvTpa0P3sx0lFsz9pMoZy1/KxI++22UQEn+zGtR8Fg4GCL4NjbsJ75elCmZtM+PlAje2RyhKtsCLUJwXHj5UyqUl67ptwdWMFRlANzHmDKAF8J14Q09HhQH23k2YDEY05pcHtnElyyO6OPtHL5iXvVglEKdTcp8Zfl40Yzf72abLW3ljA6RuTLEFVSBvhwUedkJbZEjvl/q+5xlyowlS64fiSthBYJ7HvdG9USBRQw3Tgr9lpZ8yf8bpSDOaLMVuUd4qnj+8YjulYgDounA6zdaEDsPOTZkARAa68boipXz6AryzVepk+Rg5YaJ9vv0oNvHI2KJHVMkeHiC4YJl1t05qCM6OeVVKK9UNgWV97Np64ARpwhCdYiVo2sT5ZGLRsmkjBC2ntu4fN/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(136003)(376002)(366004)(39860400002)(186009)(1800799009)(451199024)(38100700002)(6666004)(6506007)(6486002)(86362001)(82960400001)(85182001)(2906002)(26005)(6512007)(9686003)(83380400001)(478600001)(5660300002)(8936002)(6916009)(4326008)(8676002)(41300700001)(33716001)(316002)(7416002)(66556008)(54906003)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0h1Q0F2WU9BczByNlR6ckZMMlBoSmJaYzIvRkxEcUVjUXJWZ2JCblRseTFk?=
 =?utf-8?B?c1psSVVmb2NiRlhEajIwcGoyNEtEQUpJZDhJSWlyL1dZbFRlQ1IvZjMvT05P?=
 =?utf-8?B?MkE3YzFxSUxuNU5FUC9wRmZCSlVDc0lqMVh1Nm1nS1RvWk9EdklhSklKVXpq?=
 =?utf-8?B?Z3l5OFdiam9CM0R0VVU3MEI4a0tIMldsQ08yTUd5UldnT2syVGFFUFlkSVNn?=
 =?utf-8?B?Yjg0dWx3aEVad0JoMEUybjFBS0hQcm5JQjB1QjFrT0J2Z0pwbFhVTzlGcWxZ?=
 =?utf-8?B?MURlRlE1ZU80cDhjNVVSczNhYzVPcGtOeUZlZmlGNnpGZHQraGlyR0RNTHZy?=
 =?utf-8?B?azIzTXh3MUVhNEVkTEdiUGQrMlZ2YlRISVN4RVl2QTRlTXY4bFlWOS9aNHo4?=
 =?utf-8?B?QTRIaGw1bVFGczVFTUVpOWJxODlyNUR3MHdxL1Q3T01ndVVCOEZkZTlROGRF?=
 =?utf-8?B?ZlZ3MUpldUtGcHJSQ0dabnlrcUtQQkRCcEVzU2VNbnFrcTZBVk05VU9CVzF5?=
 =?utf-8?B?ZThSem5zdGxZTXpGaGVHNlBNSlNiU240VmVIOFNqRER5Y0RQKytSRDRPN3R1?=
 =?utf-8?B?Risvb3h4NDZmWTlLeGlabXdIU3NZcmdidHZKZGZTK0dGZUVaRlBiMFYyRjRO?=
 =?utf-8?B?a3JHbVR2KzAwaDRmb3p1R1h6L3NnL3QvQjBEUVk2RmVxZ1I1dG13blIrRXNu?=
 =?utf-8?B?dFE1Q1FvQ2RWbGNyOGJwTjFwMzlucGFyb1FVdnYxWnlYYTI1U0dVUWxLbnJr?=
 =?utf-8?B?WVg4cmd3WGI0WUJRNVFmbW9RaFJXbThaZXBKbFFGV1pzZU02S3NZWFoxT1ZP?=
 =?utf-8?B?NG5aREwxalpsRVFIUEVNbU9sMFVlYmJWaUkvY3NlU3lDYmE0L210QWYrSjUy?=
 =?utf-8?B?Mk1tN2szYU9lQ20rSHE4V01WNmtMNlUwekFSa2FZbk9VaS91M0lFQ09WNzds?=
 =?utf-8?B?TW1oWHlTcUJjamZydzlhLzJGSkllZUJPUGVWQnFlclpkclVIc0xrN1RGMktO?=
 =?utf-8?B?SFZiRlNnWkVnZEFNNFFHeElOdC9WaVc1STRHeDRwUjkzQkhyY2JZblhZYXo0?=
 =?utf-8?B?ckpZdlIyRE12dkkxWFFZbWxSV3dJV0V2eWRKVENrM0FsQTAwbk5OWitzZUdR?=
 =?utf-8?B?MkxWTWZCMWFiZnltckU5eVgxTVc3SlUwZFErdk1HTzVHdjdyYlBnMmVFTjUx?=
 =?utf-8?B?T1pMU3k1dWczNU16cWVDc01lU3ZoZGloZ2JiaFZCOTA2Q1VLSFNWYjRvcXRP?=
 =?utf-8?B?ZjNXYyt6YWNIMkNPMUp1OFcyeE9oNHdRWXMvTklzREZBbVhvcFNKMWJZU1Mx?=
 =?utf-8?B?MFcza1RnbTAyZlpVL1l0UGtmdEJtRWNYZDhLSkhaZnc5MlpGQ3FwWWdUN1J3?=
 =?utf-8?B?Q0djY1dnYVNxcnpmWkxoRWxqR3E1dGJ6ZnU5THcybmREVXNFdXdlSmJnbWlR?=
 =?utf-8?B?dTNjT0JuWnpUNVkyOEFWQ01CY1RMdE9FR3VITXVZR2dQVlpJbVgzMXR4NXMv?=
 =?utf-8?B?eGNIOThmdUVndS9DdUxVbjlVRmRaOFVsK2ZaZG5GQmdRRTJZN0YycnVNQWcz?=
 =?utf-8?B?T3lhWVR1eEFRcDNqb0ZEQXo4QUhlQzdFcVc4T2xWOVZORG5lcnQ4NExTZlhn?=
 =?utf-8?B?YmJ5U1doNHdnaS9Pem1kUUZ1SXpTbHMvcW5rNjAwMHJ1K3FkV0xHTWVwaDlR?=
 =?utf-8?B?bHE2b1dZZjg3Yit2bDA0MDUxS0RWM3Z4Nmsvd0l1Rktmc3pTMExHU1g2YW0z?=
 =?utf-8?B?djkybE5VZUoxN0hNOWpNM2xraUR4RFlBYnRIZDhLYWZsQTRsMjBwQnVzUDVh?=
 =?utf-8?B?djdqMWhBSjA3TCtPVUhSZ1UrYXZKMkxxeEcwMWx0UmJQWG9iQnVrd2lhK0dz?=
 =?utf-8?B?MjFqUVNITG0vRHJNcElCM1ltSXdSL2dDNk5GeFdqd1N5SUlhcmVGTjVlWndX?=
 =?utf-8?B?TWtBVHhpTXM5YnJlY1VGUjZHSmNmbXk1TDlqSEFacnp1VWtOSFhtaHVMZ2dq?=
 =?utf-8?B?MGlPQUIvbDBhazM3TnAzNk1vbEF3SVhaanFrMC93TVBoQkJPbDVEeWxpUXNH?=
 =?utf-8?B?SXRXK2tBdGxvWG5XcXRYSGZ4RGQwTXdITUd5bkgzaDYwZFhqRTdlcHZkRHBa?=
 =?utf-8?Q?kEUzfurmRepe6Ljf5QXOKO9Ds?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qwoIeG62CRlNXUnaMbVn2PFJ1/hwM4RWRwv2390wishUeyKImpCV9k8eYAP1PPwcBg0fRIxRDI2jY2PsREBss/Yz+h53ou9S0bv/Sx2Ta6T8acfjo2apQWYCTIp6m+LZhhpLSxFKhSQt2eXXGtPxh/TK/LeYy+f+rOIPe4gVszTI9PWnRqJ8j0mrUbBPxt5inh+0BfOBOq7MKr9Td/+Kt8B4Q2mhA+5z++oh5FSoiMD+0Dc5ntGZ9kbFfcLPepw/Q8s6hMyR2Hnan4ULmRH3QTGFQVTUaCBUe7oHBMIdOPRC3syc0DEYnipkPdPGY+4FhxLxmbMRIFd3XSu4B26IW8iBlQ42vYYS30xFFgi9Hn/FCWX+V0lfteQsUFtoRr2XIz8YVi4lY4Bvs5p4lxRFrfikMf/I3EXhXPFaVR4VhfwMwkT+a8HO4cakYv+5TbtIFBJKzvI6LyR0GnDszAi3W2wV4QLdyVFYd9FPbS9z/z400ykUmTOKU4ACqGMlrMrTJ7tRQj15vpTMf09+DYJIr09jWrx7zZEs1dBZQGbuTf5El9afMdpjG91MhkIMoFYwq1oM3IwgJKHAUQrBeh+uV77a/wjNehuii+OIhhiRR3UdMpeRd969tyPpJlcmiJdMiR9B0RH1txuRRqbS/SPhfYzzXGUUkPA+PIcA8RyR10G9/dt2IzqhqaSbk6KAJGdp45ndjHmPXmMumyVLOA/pAsb6zrNQhJkqEglSyephwakozlAhApoh4yuccKV6G5E5e8BIjOt+Br/FDw87ylPMdrW2e6aeWxzCaJzyfIX+egUVX/OyWLwXFCDUSOWvB95dnDhsW3AEGz/tpuT5ATPsT2FEJ8a0vLVNj5ynbmrmlLmFIQcHsC4yecWQJzkdTrYcBis5Osw1I8/v0gFE00JMdw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7395119c-094a-4a79-5497-08dbb9b51166
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:39:13.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQN+uTzjlrgpSYxDdnRkFqPj90e2qxNb+NtQ/kNjm1DV8KMGNyDjxVmtNy1NQx886mzDlPiSzw/2Lwwl/BQ6DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6326

On Tue, Aug 29, 2023 at 11:19:43PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a PCI device gets assigned/de-assigned we need to
> initialize/de-initialize vPCI state for the device.
> 
> Also, rename vpci_add_handlers() to vpci_assign_device() and
> vpci_remove_device() to vpci_deassign_device() to better reflect role
> of the functions.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
> Since v9:
> - removed previous  vpci_[de]assign_device function and renamed
>   existing handlers
> - dropped attempts to handle errors in assign_device() function
> - do not call vpci_assign_device for dom_io
> - use d instead of pdev->domain
> - use IS_ENABLED macro
> Since v8:
> - removed vpci_deassign_device
> Since v6:
> - do not pass struct domain to vpci_{assign|deassign}_device as
>   pdev->domain can be used
> - do not leave the device assigned (pdev->domain == new domain) in case
>   vpci_assign_device fails: try to de-assign and if this also fails, then
>   crash the domain
> Since v5:
> - do not split code into run_vpci_init
> - do not check for is_system_domain in vpci_{de}assign_device
> - do not use vpci_remove_device_handlers_locked and re-allocate
>   pdev->vpci completely
> - make vpci_deassign_device void
> Since v4:
>  - de-assign vPCI from the previous domain on device assignment
>  - do not remove handlers in vpci_assign_device as those must not
>    exist at that point
> Since v3:
>  - remove toolstack roll-back description from the commit message
>    as error are to be handled with proper cleanup in Xen itself
>  - remove __must_check
>  - remove redundant rc check while assigning devices
>  - fix redundant CONFIG_HAS_VPCI check for CONFIG_HAS_VPCI_GUEST_SUPPORT
>  - use REGISTER_VPCI_INIT machinery to run required steps on device
>    init/assign: add run_vpci_init helper
> Since v2:
> - define CONFIG_HAS_VPCI_GUEST_SUPPORT so dead code is not compiled
>   for x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - extended the commit message
> ---
>  xen/drivers/Kconfig           |  4 ++++
>  xen/drivers/passthrough/pci.c | 31 +++++++++++++++++++++++++++----
>  xen/drivers/vpci/header.c     |  2 +-
>  xen/drivers/vpci/vpci.c       |  6 +++---
>  xen/include/xen/vpci.h        | 10 +++++-----
>  5 files changed, 40 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
> index db94393f47..780490cf8e 100644
> --- a/xen/drivers/Kconfig
> +++ b/xen/drivers/Kconfig
> @@ -15,4 +15,8 @@ source "drivers/video/Kconfig"
>  config HAS_VPCI
>  	bool
>  
> +config HAS_VPCI_GUEST_SUPPORT
> +	bool
> +	depends on HAS_VPCI
> +
>  endmenu
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 4f18293900..64281f2d5e 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -757,7 +757,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>           * For devices not discovered by Xen during boot, add vPCI handlers
>           * when Dom0 first informs Xen about such devices.
>           */
> -        ret = vpci_add_handlers(pdev);
> +        ret = vpci_assign_device(pdev);
>          if ( ret )
>          {
>              printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> @@ -771,7 +771,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>          if ( ret )
>          {
>              write_lock(&hardware_domain->pci_lock);
> -            vpci_remove_device(pdev);
> +            vpci_deassign_device(pdev);
>              list_del(&pdev->domain_list);
>              write_unlock(&hardware_domain->pci_lock);
>              pdev->domain = NULL;
> @@ -819,7 +819,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> -            vpci_remove_device(pdev);
> +            vpci_deassign_device(pdev);
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
> @@ -877,6 +877,13 @@ static int deassign_device(struct domain *d, uint16_t seg, uint8_t bus,
>              goto out;
>      }
>  
> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
> +    {
> +        write_lock(&d->pci_lock);
> +        vpci_deassign_device(pdev);
> +        write_unlock(&d->pci_lock);
> +    }

I'm confused by this one, shouldn't the code rely on has_vpci()
instead?  (which is already checked for in vpci_deassign_device()).

If you have a system without CONFIG_HAS_VPCI_GUEST_SUPPORT but vPCI is
used by dom0 you likely still need the hooks in {,de}assign_device()
so that vPCI status is properly handled for dom0 as the devices get
deassigned to dom0 and assigned to a guest? (and maybe moved back to
dom0 at a later point).

> +
>      devfn = pdev->devfn;
>      ret = iommu_call(hd->platform_ops, reassign_device, d, target, devfn,
>                       pci_to_dev(pdev));
> @@ -1147,7 +1154,7 @@ static void __hwdom_init setup_one_hwdom_device(const struct setup_hwdom *ctxt,
>                PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn) );
>  
>      write_lock(&ctxt->d->pci_lock);
> -    err = vpci_add_handlers(pdev);
> +    err = vpci_assign_device(pdev);
>      write_unlock(&ctxt->d->pci_lock);
>      if ( err )
>          printk(XENLOG_ERR "setup of vPCI for d%d failed: %d\n",
> @@ -1481,6 +1488,13 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>      if ( pdev->broken && d != hardware_domain && d != dom_io )
>          goto done;
>  
> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) )
> +    {
> +        write_lock(&pdev->domain->pci_lock);
> +        vpci_deassign_device(pdev);
> +        write_unlock(&pdev->domain->pci_lock);
> +    }
> +
>      rc = pdev_msix_assign(d, pdev);
>      if ( rc )
>          goto done;
> @@ -1506,6 +1520,15 @@ static int assign_device(struct domain *d, u16 seg, u8 bus, u8 devfn, u32 flag)
>          rc = iommu_call(hd->platform_ops, assign_device, d, devfn,
>                          pci_to_dev(pdev), flag);
>      }
> +    if ( rc )
> +        goto done;

rc can't be != 0 here, as the increment statement in the for loop
above will zero rc at each iteration.

> +
> +    if ( IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) && d != dom_io)
> +    {
> +        write_lock(&d->pci_lock);
> +        rc = vpci_assign_device(pdev);
> +        write_unlock(&d->pci_lock);
> +    }

Why do you need the extra d != dom_io check here?  has_vpci() will
fail for dom_io, no need to special case it here.

Thanks, Roger.

