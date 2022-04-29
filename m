Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D515514643
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317153.536353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNXU-0006kx-3b; Fri, 29 Apr 2022 10:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317153.536353; Fri, 29 Apr 2022 10:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNXU-0006ik-0O; Fri, 29 Apr 2022 10:07:52 +0000
Received: by outflank-mailman (input) for mailman id 317153;
 Fri, 29 Apr 2022 10:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IHQo=VH=citrix.com=prvs=11116ec15=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nkNXS-0006ib-9y
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:07:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36e57bb3-c7a4-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 12:07:46 +0200 (CEST)
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 06:07:45 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN2PR03MB2174.namprd03.prod.outlook.com (2603:10b6:804:c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 10:07:37 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 10:07:37 +0000
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
X-Inumbo-ID: 36e57bb3-c7a4-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651226867;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=e0Fl6XZ8kgXcYYnk3gslwDNK2cN/ST6N0U+WIjjJTaU=;
  b=ABKY2KGhCB6dGkM4FVCZqmF/3tHIFkqWjmODe5Zt9NqeIi4wf7pk2pAq
   U/Pv3xe0pDOe/+Bgeri0AGpOroF7F5aSPyf4e4QqPaHXb5tDp2fQT0qiZ
   jvDBIcS4YNJe2uzIQ792nawCxFWQ1sTrYCL+XLoSq+pFWnQf6XWaTUvhh
   I=;
X-IronPort-RemoteIP: 104.47.58.176
X-IronPort-MID: 70625210
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xBkFeq1K4JF3OvFZkvbD5fxwkn2cJEfYwER7XKvMYLTBsI5bpzAGz
 GcdWWyGM62NNzSke94lbo2x/B4A7MWAn4I1Tws4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tIy0IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0VkMeoU140Y5fXs8kabThVOnp1OopZreqvzXiX6aR/zmXgWl61mrBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyVu7e03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianLWcF8gvNzUYxy1rOi1xN6L3fCdzqXobXHMdqtXbfo
 22TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqFeU3G0IThoNSUG8v+K6m2a5QdtUL
 0FS8S0rxYAw+1asVcLVRACjrTiPuRt0c8FLD+Qw5QWJy6zVywWUHG4JSnhGctNOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgc/iTQsSAIE55zpptE1hxeWF9J7Svfq0JvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztp6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:ItGFHKBiZEvPQ27lHeg/sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dNMEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfXHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+06VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qY5+FNuAxem0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,298,1647316800"; 
   d="scan'208";a="70625210"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWkxp4r+XIPhg6iXX2Tm3a6t4pdEe9VzUyiemzHUeBIwcrnrVlC7E6pgU9pojWTFlos6kzAlTbeqh1g8K9Ov8afrNJV8kayYeVYq08AK5sTkQKK6q5LW0ucgg96fpLuTDuHFM+New2jCmacIkRfe4yu2T+v99jKslXH2VkQU6kJxIRJfArHwCLI6Pc9nKp5bqgJ1wk+cta3AMB/OtMFrjULHZmgh52P7yCR1aJU5cov/PbKsx4YBWOfW5FUcqZVb6SdAkn3cKZqbeQ7+7uQdHwy7JArf8HUsBAuepsiGex0n/wggFKBweIZYs/bvdz0taMp0wJPWasx+2z7RDOUjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2H+bL2KcMUVVnQEklaMinDUUpUYPRANCBMMCDnBRL4=;
 b=DwE6/q5oAz+xJ6hLdqWGy9lbyNmUOtlSotJq0b+asJXYXwNQytNG/ZOZl8P1ULSNzWU6sSf8oy5ezcACySb6BZDIaTGSTXGzpJkleMmzaj2Za7FPkQMGE9ujYZJmq/YoDDfCAyFtGbB2l/LEvW9pCmPnqkw8/BxaVyZ+FTSP1jWEDGHEAcJFWXcDM9h7audhzMdg/wlNrbpg+eWWI1Ssd/qoiCk2dYLAr/uSd0y23p55Yy8QfOnUAXx0+1beCgTtHPubAquclXmSp9iBj4oqTRtpw03aecoPIHHj308cnnZxbVojhG9LQRVhx0/DzbNghcVcoNlXciYnNqu1Yw3jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2H+bL2KcMUVVnQEklaMinDUUpUYPRANCBMMCDnBRL4=;
 b=bRpDFji3oGVNwNISVuRG/ClC6rCi5ZvPGeGuFuRi0hyUW6SzSzslE3XpD/AUNNnXbaMcFiSZsb2dLavmdvKTUY6VbgEhEtMoloAQpW3bmG7/fPRZxG/NZXebbZbZySol1P41yOkaR/hnLnS65z3G2RWMvkcPBnZ3FQrnEOCqoFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 29 Apr 2022 12:07:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: x86/PV: (lack of) MTRR exposure
Message-ID: <Ymu45ZVA2Mwmu40q@Air-de-Roger>
References: <b3f07165-67f0-3d50-e249-2618a2dc862c@suse.com>
 <309bea05-2247-d451-3548-c824333a83f9@oracle.com>
 <8432d9b6-0aad-01b7-9ffb-e38ade602719@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8432d9b6-0aad-01b7-9ffb-e38ade602719@suse.com>
X-ClientProxiedBy: LO4P123CA0234.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e95c7e0-48e6-4502-7131-08da29c8164f
X-MS-TrafficTypeDiagnostic: SN2PR03MB2174:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<SN2PR03MB2174E02044CC9A84DE410E1B8FFC9@SN2PR03MB2174.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pF9ueL/CBFX3p+peAoDM+bOtr9+4d+ay3qblJvrBi+dPJcFlAWg25tcJRdlqahyLMPKEW3KIbzz3CSIkk3mGzUT94fQzzpHygqE7O3Qv6Aqwvs6gTDCoxBGWYlO+ffFyLEKQtsYOwAR/6+c0N4pMpvaGhoQVLeZ03xq5LzlJxy2Q2dbroBO+xFtEGk8yb2b0pyBUCjB+1xLSCCt8uHupQohJg8j3YemVBXaY9daHlh1gducFNGXmP8FMtlt5vypEVNVpNARtdGrjcnC9Y3llxiKNe5PDkdViH7cxHcd/kTt/c0cPDdB7EsaZeDlFhkvJtjTeBqZrmlDJRSNwJsBoKqR9DzPn1iy0uyWxhdCZel2ZccF4EsGsCDgeDoXJLYTkY7+ISv+bSOTfhLIm+30ssOcMISVR+Fy2hJ1mauwDRhEtf73EXQuzZaudD+NPcT7tNhU4ooeyCWRPxuFptCADQFPzucmrh2TKLeqbdZSH7rsT+9zQSh23iHHFjYCDYBXhRZXETcl3MLjflbjg/Pw2a1SuTcY76Yv4gTMAr7ARcsyBdo0n3j44zZVVWlCsvYx0ICjJ+vbUVj4SlOY+7osR7Fp/15mubD5xLkReZeKoCVxoWQ9FDVmcEBpKtClvMdh3evRI6l/PE4UQHtnc1oouVarPTdjU57svXcU4UIZAHI7/BFfmeHNcYf9UOaaceF29IhERkD9oCDenp50qSugWmhAnfX/jm6o9HJ/oA8nUHsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(9686003)(6512007)(82960400001)(6486002)(966005)(6506007)(6666004)(33716001)(8936002)(5660300002)(26005)(53546011)(186003)(38100700002)(6916009)(316002)(85182001)(54906003)(2906002)(83380400001)(4326008)(66556008)(66946007)(8676002)(86362001)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJhR3ZrSWp0R0FramJSOE1jSHRYd0FOeS9vbC92akpHYUc2MU1iM2FvQURG?=
 =?utf-8?B?MkoyZmxxRUtlZFF3N1REUlJYRGd2aTRqdTgrckZpL2k3SWMwcUN3eXI2eFMw?=
 =?utf-8?B?T2lMcnZ0NmNLUjR6OE9QcldNMmFXZUN0WmVMM1VNY09oQ1kzWEhlODhKbDZX?=
 =?utf-8?B?R281RGgvYUlGZlVIRldhNS9nZ1RLUUdmNzBWZm1VRWRwOEU4UGZiMUlmN2hl?=
 =?utf-8?B?bFZjL3VrbmZmUFlMQXhvRlpKVUxXVXhxdU5MWkRnU29DbGRpMUw3cWZHZkVD?=
 =?utf-8?B?VUtUVElnZ3VMZVRBbm9ycDVCZ2NlVU1YMkdpWEVmSXZWa0F2TGkrRDZnTUFh?=
 =?utf-8?B?em80Z09mNU1wOTE0bjV4OUxPM1F1R2lkU2Y4UzZkU1J2T2tKMlRCQThjWmFz?=
 =?utf-8?B?UkdabmVRMUhnV1RCVXZHVUcrZ212eSs4R0Z0VUJ5dWl6N1lLaDZGSnZhY2lU?=
 =?utf-8?B?VHE1TFI0Z3VMSzE1bVJ6WFJadTM5em5tamNCbGdsLzFsMjlmd1BPUnMxeXAw?=
 =?utf-8?B?aXkwNFF1TDI2VExWclF6WVZhekREWkZ1b3NSbnpNZENONWFXbjJEd25NaEp3?=
 =?utf-8?B?dHBDVXFjQy9xYjR0UzgwNWFrVE1XTWxZYUJwbnZMQk9qNVBTTlEvK3pQRzVW?=
 =?utf-8?B?YmVnNFhjZWF4MXhvd2E0bEpnaUM4Y3k4cjBKTnpFS0dDczhlRFIrYlhjb0pB?=
 =?utf-8?B?ZDlTM2VtR21mZm5ndG1naCtjTVh5N3p0YzNlb3FaSmJLUm5xaSt6R3ZDYVJT?=
 =?utf-8?B?VlpYMHg2d0JmTFM2Y1dHamJrVVh5SGgrZWFNZ0ZEOGRRQ1k5WG83cHlUSmt0?=
 =?utf-8?B?dDR1QU56cVRKQzJHdUl0YlN6NmhZTmZRVEVFcGpUQlRFWFVtZ1hoc0E2Umpj?=
 =?utf-8?B?dklIYXBHSUJQYklTdkRMd3BkejA0SHVzTGY2YVRUOUlnMTRnT042c0xPaEIv?=
 =?utf-8?B?ZjJvK05zdXlpWFIwSTVFT0ZzQ3d6eU9UbVFsYWsxV3lUN3g5SlQwL2VnSHor?=
 =?utf-8?B?WWc1am5SclRBSjBIUGxDaWtRektqUWhBbGVEZll3NXdxVW9IK1hiMEVuZ21l?=
 =?utf-8?B?cmo0VVQ3VDJCTlhpY01BZjV1ZDJWVUZzQklmVG5Lb1JYYiszR1h0WTRKSWJV?=
 =?utf-8?B?MXpwejRCb1BUOXpmRTZRZU5WVlBmTTNkNVhmeldnRjU1aGJjOVU0SmFQTUU1?=
 =?utf-8?B?SWNxeFBqSmhOczlEYnFLVjVnamo2Wlo4NmhJL1ZlQjVRRGxYYWtvUGJYdHZP?=
 =?utf-8?B?VWo5MU5udG13NTVUcVgyVFpPcDBqRlpZTjVUdzRGMG5VV1pmdFk2WWNsd0Fh?=
 =?utf-8?B?eVkyVm5jTFkvcVJZQkJCVkNxOGx3RHhzc0swQVA5ZTRIaWRRdE1qSWorNFY4?=
 =?utf-8?B?SzJFNmxxa1N4QXdQc2hqZmFwSEtldW00dkFRRkUxVW1KMUlzYzQ3M1MrdXhZ?=
 =?utf-8?B?OG82dzk2bEZxdTBhaDdkZWxHZ2VXdU83Y1lpc3h5aGhBNTlEMG1sTG1kZ0oy?=
 =?utf-8?B?ekIvWVcwWnh2VzZIRDA3c0NaMS8vcEdDUWpGUC9kMVVyaFZYbTk2RUorcFF3?=
 =?utf-8?B?TXV3VXVZNUJMWHFONGZEWlVjYURSMjFQYk94aEdtSVVEcmVDc3M4dnZQd0Nx?=
 =?utf-8?B?QzRvQmdBays3Q3JhdXRYNHJhVEtGMTFvTVJyVXplSklLbGtaRm5XQTZManBX?=
 =?utf-8?B?TlZtL1hTaU50K0prZWkxKzRVbGNzQnVtSDJqamdCaCtOdGJmM3A4V1d5a0pz?=
 =?utf-8?B?Vk8yejNPZk5zTS9EUVdPSkRQMGt6U3NhWTQ2MkJEOC9JSjhIMDdzZ2FodUJv?=
 =?utf-8?B?OVR4MnRZdUZHOXVNSHo0d0JXRUlDVE1adDc0L1ZkQmw1S0JuUHBZSHFQb21o?=
 =?utf-8?B?NGxtekZvZ2hvV2lVeElUTkp2dUpOWVZrLzZWRTF5aHAzN0cwYXRNK0VZVVp2?=
 =?utf-8?B?aEtzUHVOWkhTWUZ2MS9JbjQyNGhCVnJYdEV0b0ZDSlozb0ZPZnhVdWdOVS9p?=
 =?utf-8?B?V05WU01STUZOOWtxeVNhZm5MZy8rQ2htVThsNU00WUlRblV1MVFUb1pZZEYy?=
 =?utf-8?B?UGVnM012SWd0TFhadGlxZUFvRE1ScUt2aXJJZUpuV09GQ2tObUUzM1FvaEhN?=
 =?utf-8?B?M09ZQkRWQnVTTGFvN0dCdWMwazlEOUh2a3E5dlBINEFwYkZZeHpHTXZMcWdV?=
 =?utf-8?B?Rm9xNkVTaXVQQ2RZUHZLOHJtYXJWN09yaXA5d3g1NVlacWZmNEQwV2lqU1Nx?=
 =?utf-8?B?UkM5ejhRS3VqTStkN3kxc0RLZkxKMEVBKzU1Z0VCb1Y4c0lXbXhRemRGbHJF?=
 =?utf-8?B?Q1NRb3A3My8yVjJOelpsQmQ0dlZBTHlnb2s4cXdRU0theEM1UUNXV0ViZnFw?=
 =?utf-8?Q?2PS3CTDDBLCvh4rI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e95c7e0-48e6-4502-7131-08da29c8164f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 10:07:37.2568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgtCOHYH2VG+bf65/dvXDa98mZN8xbQuu+3kLJmujUoXC9LmpbUYZJaqZ66VTA5tw3IikAdAhgAEEwEeTCLJEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2174

On Fri, Apr 29, 2022 at 11:50:39AM +0200, Jan Beulich wrote:
> On 28.04.2022 23:30, Boris Ostrovsky wrote:
> > 
> > On 4/28/22 11:53 AM, Jan Beulich wrote:
> >> Hello,
> >>
> >> in the course of analyzing the i915 driver causing boot to fail in
> >> Linux 5.18 I found that Linux, for all the years, has been running
> >> in PV mode as if PAT was (mostly) disabled. This is a result of
> >> them tying PAT initialization to MTRR initialization, while we
> >> offer PAT but not MTRR in CPUID output. This was different before
> >> our moving to CPU featuresets, and as such one could view this
> >> behavior as a regression from that change.
> >>
> >> The first question here is whether not exposing MTRR as a feature
> >> was really intended, in particular also for PV Dom0. The XenoLinux
> >> kernel and its forward ports did make use of XENPF_*_memtype to
> >> deal with MTRRs. That's functionality which (maybe for a good
> >> reason) never made it into the pvops kernel. Note that PVH Dom0
> >> does have access to the original settings, as the host values are
> >> used as initial state there.
> > 
> > 
> > Initially MTRR was supposed to be supported but it was shot down by x86 maintainers who strongly suggested to use PAT.
> > 
> > 
> > https://lists.xen.org/archives/html/xen-devel/2010-09/msg01634.html
> 
> I recall Ingo's dislike, yes. But them suggesting to use PAT when
> PAT depends on MTRR internally is, well, odd. Plus there continues
> to be the question why PVH Dom0 should see (and be able to play
> with) MTRRs, when PV Dom0 can't even learn their values.

Oh, I didn't realize the handling of MTRR in PVH dom0 was a question,
sorry.

I don't think it makes sense to limit PVH dom0 access to MTRR if that
then implies changes to Linux when running in PVH mode so it can use
PAT, and likely changes to Xen in order to avoid using MTRR when
calculating the effective cache types (ie: in epte_get_entry_emt).

I also don't think there's a need to have this kind of feature parity
between PVH and PV dom0s.  IMO we should expose whatever is required
or makes the implementation of guests easier.  For PVH we could always
stop reporting the CPUID MTRR bit and thus stop exposing MTRRs and
guests should cope.

Thanks, Roger.

