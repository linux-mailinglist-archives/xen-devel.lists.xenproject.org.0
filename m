Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9631662F688
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 14:45:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445777.701150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1fl-0003zd-TM; Fri, 18 Nov 2022 13:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445777.701150; Fri, 18 Nov 2022 13:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow1fl-0003x1-Qa; Fri, 18 Nov 2022 13:44:49 +0000
Received: by outflank-mailman (input) for mailman id 445777;
 Fri, 18 Nov 2022 13:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow1fk-0003wv-Oz
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 13:44:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28818953-6747-11ed-91b6-6bf2151ebd3b;
 Fri, 18 Nov 2022 14:44:46 +0100 (CET)
Received: from mail-bn1nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 08:44:42 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM8PR03MB6245.namprd03.prod.outlook.com (2603:10b6:8:32::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 13:44:36 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 13:44:35 +0000
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
X-Inumbo-ID: 28818953-6747-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668779085;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wF59RuD8Rj2Axz2JSiM4yybdghUoVELSgnJe+HgwmWE=;
  b=Ie4QdNaErY+YpKVSXtP9Sxp7bKWdJWbKzhkFqjaU0m8cJFBSOAHaVeMQ
   GEJBKAFvmNZvGB/5aRAMxhZFh5EoYMU3FaSjuxSvxJftVrtmwanhyceTc
   NWuN8hFX6JPTqN1P8njXxqlOI3bZpgEa46ZTimuNRL0bvVcSs5EIpRNY5
   0=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 85133242
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OxEwmqPjZlnSm/rvrR2BlsFynXyQoLVcMsEvi/4bfWQNrUomhTFSy
 mQbXG2HMvreMWTyctF3PYni8klQuMTQmNU1Hgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v1oImVh+
 6UfERcmRU26jaG64vHnasA506zPLOGzVG8ekldJ6GmDSNwAGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PNxvzG7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVryv33bWTx0sXXqoUNLy42vc1qWbCw0koETERdnSnkaGm3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU331y1uPhTa7OCxQJ2lbYyYBFVEB+4O7/Nh1iQ/TRNF+FqLzlsfyBTz73
 zGNqm45mqkXiskIka68+Dgrng6Rm3QAdSZtji2/Y45vxloRiFKND2Bw1WXm0A==
IronPort-HdrOrdr: A9a23:S1KuParv9DIMgmOJf0lc5Z0aV5opeYIsimQD101hICG9E/bo9P
 xG88566faZslwssRIb6LK90cC7KBu2yXcS2+Qs1NyZMDUO1lHIEKhSqa7j2SDdASHk1uM178
 ldWpk7LNXxCFh8g+b2iTPWL+od
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="85133242"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auIbv0PjFVDoL9tmAdY7EZfBNDKL3aBJREThSK6Xf8JxgHxr3Uc7o+H/K6CFF04pTqT6K1fVzoPUEZIHdG87t6w3rLPAWs/GZDcosfr9z1OFu9JFbLHGHsiVidvkf338t8h+WGTzHPZ9Lu5dbq02Y+ZiNb0oNmaK9XyNmWud8pTf3e7LGR4/Ic8uCvt6XLyyWUVHnDiXOHAS8LUk0a1GcKOLRTDR7mF6+yM18I4x8O1X3rj0BQwjmv3F9VQtVuEO3DkzmjeScMJkPNe1eSQiC3awSu3rwcdxUKW7Sud9cxS/erK2MhQr2ifAhboQhiY5JL9wmcPtHtUfprrV+n1wkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNlMLUQguxBjhgQ7a2qDcoPA+nYF/Bgs2inTOGLNjMI=;
 b=BEpALoVrg10EKqpURrwCMdzaEXuYLVqTrpnLw5Ks/sz5sknZV9COFz5dxVkeZfgvuDOUfjinuYEZuzd6dosejTIYJvHz7XmCZTZ7QCPB2kjyqmXSilY15xhPOn4BSqze3yp3cHrmVM7Wm3HO7eGP5+iaDhKQ4QN1BTrdrCsv29dh6jl5alEbcvT5lI18MVU2zsnoIlFQ1OBRQyKgn+ZX3KGAT7KuYHWHRQiRfP9am5AyJPktxsWu+sCa8vEZEOBvkQBDX00IWjaB1yyAhqkWvIwv5vuY/dKnxAmFzMHUKSOdnrHDRuEMNk/GflvhieRxn90pVDfOlKOdC8oVLfZaJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNlMLUQguxBjhgQ7a2qDcoPA+nYF/Bgs2inTOGLNjMI=;
 b=lABmMVSaF2TNAHjf2ECbCi/eIpVGSEHmtOFSqhzcQ+h0QMeEvJ8Ge/cbjPCq4qjuENSKguyYRE1epf5YJdbUPSYB2sJwztSXPJUdhD46awKzO68l0dykB3oDvKM6BQiBQVVQJU3TKOhPD4MYYeKMLuwiPhwmrd0t5SzDcuZsBog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 18 Nov 2022 14:44:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] efifb: ignore frame buffer with physical address 0
Message-ID: <Y3eMPMvtIgfkaMJV@Air-de-Roger>
References: <20221118123925.25363-1-roger.pau@citrix.com>
 <d2d0d0a0-6ee6-d9da-992d-99bf52be8119@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2d0d0a0-6ee6-d9da-992d-99bf52be8119@suse.com>
X-ClientProxiedBy: LO4P123CA0643.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM8PR03MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 848eeb2b-4425-43dc-7a06-08dac96b067a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6VyRvWIHoONfg3gft3k9ysg6wQT4yYdzA2did9ODnNib8CVST+9hvWq2nlBMkps/P086guyqL/l0IstOTHpD0gbFPEqdewNa7JMr6n8dfD4Ji2R9w5MTsQVyfThb+32VlWgiDayH7ERcRRnKm5XJzlVsJE7uTb6RBC+lrj0DCUpWNI+K6gJd8V1ZFOYmVoXSnYZ3cAwmwHfq644hMtFINeS+V2RCvC664eMthp6FiHz14yiLxi7kjCa9azPfrf9ZMTnSpuzBirBHQ85FZalu0Htisz2sjqKMM96nTamwsXRVNLkNh5AH73fYyvqGu67OQ8zCjBdjtE2/SgxMVbYRUt083hZzBUPvFoRQ5M/VsMPEAo4sE/IB2uAylT7ilmyiNCOHn8dO8dlgnM5yZfEdaz+QQJFWuDDRMWCB0oXoENQaZ03zHjjKPUJyhhyK7qezj3vCO0QA2BMq+R7QcUXPgEw307EB+/NitQW/I0FVrBHamTh1giXIxGlXCrnYbFVEfliS2ZaScIAD0ZnFt0xTtPVRN6b3bFYafWgw14NNI1GVdc3JUQyAFSChZHbUsK6oIr8LboOnWobjfDGl12B+A6yavAqlOfZhqCb0+Y9D3pVfDUYEHi5MI095iLpwHKpGXGSPg6vHrjbreH+Ak35tQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(451199015)(38100700002)(66946007)(82960400001)(4326008)(8676002)(83380400001)(66476007)(66556008)(85182001)(8936002)(5660300002)(2906002)(54906003)(6916009)(316002)(186003)(26005)(6666004)(6512007)(6506007)(9686003)(86362001)(33716001)(53546011)(6486002)(478600001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eU15Y29WQkdQc296SjlHalVrTWVsS0JVN2Z1aStyaitDK1RzcUZQY2R4c3Y0?=
 =?utf-8?B?ZTBlczI2ZG9EbFRtcUVMUTBJSG5ZdUdqVk9NRXRKcjhja1d1MDZOTVZ4dVl0?=
 =?utf-8?B?U1lZeWRHWVF5Q2NJZUw3T2xlVGNqUmlyOWhyNkMrU1c2aE8xUVNYSzlOdjZu?=
 =?utf-8?B?OVByVVBIQ1ZiU0RNVWdaQlVwZGFxVmFaa3NDeER1RzhqTjM0aGpxTy9CRDBt?=
 =?utf-8?B?V0ZjMDhmcTFVUGtyTEFoY00xZTdZQ2t2aVJ5OEIrUmkxdkticUFWallUcDVj?=
 =?utf-8?B?VE5VU2VTTjNyWnZVR1YyR25tVGY1T2xJT1pTeWgvMXBTRUNmTmdSOW5OS0Rl?=
 =?utf-8?B?SVpXaGx4NG5hb05BSTNtWmZ2NFNDZ3pnZzB0SERtZEtwZTA3bVlleWVRYVRU?=
 =?utf-8?B?MjNFa2lUNTdEdmdYVDMxS0NOK0RWZXo0aXBjWHgySzNLWHliM2M2UmpKMU92?=
 =?utf-8?B?UklEcFFuUG8zdXNhVitMb1I0VE0zOWdjeVY0ZGF3WUcyVFIyMzFEeEVXWFdC?=
 =?utf-8?B?QTAvak9GeXpYUkg2ZjNibzZGbnBsakFoc21LbnNjTmMzMVVHMjlMUWZRb0pa?=
 =?utf-8?B?bU13YXdlVDFMRFBzS2NOR0srU3prMGhDZnJpek9mU2xEbTJwaUV3RnM4cTFY?=
 =?utf-8?B?VTdpWXFaOUx5NDNYZ2xETlJXUXBMTjRnbk9OZ3ZSRmRZT1BVMXlBT0pGaGxI?=
 =?utf-8?B?ZndBYzVTSFh2OUI4aE45emFMdjNLeE1OcDNSWCtaR3pUUkJtRytFbFNpNmhX?=
 =?utf-8?B?NDh6Qy9wYnZVMW5YVlVua2dYMDJCdHRBN2h0NUliNmJqM3lwbktHdUJORDhY?=
 =?utf-8?B?TDBrSzI1M09KdjhNSis3UVRVek80OG80ZHVpeU5jWlg1eVBkaVA3cklja05G?=
 =?utf-8?B?Wk12eWI0WjlLT1ZTQmVXSTJwU0lyWHViWG1PTE4ydGVQQmxIMlB0UDNaV3BD?=
 =?utf-8?B?eHF5dlRLMGdhVVkxV010dVN6ZStYdDRXbXBndm9lZDVWYXRMM2g4c2pla2xv?=
 =?utf-8?B?VnpkUllCWGYvalJBeExrOHFVdTQvYkhwUU1SL0c0UFV3Yy81YWJWb1kxVzR6?=
 =?utf-8?B?MG5Pc3BybUgvSHRyNXNWNnEyRzFTSFdhMTFEMnY0bG5MRkFzejJKVWd5Zy9G?=
 =?utf-8?B?QXhkY1lFRFVUMGx4eW9UYnRWa2dveTZMRHlkN25TM2huK1ROb2VkTDZ6NzZT?=
 =?utf-8?B?TEdZMkw1NFhDK1Q4cXpwSStSWlZxSWpseERlanJNTFoxUlhwWDZkZTBQaUF2?=
 =?utf-8?B?bEEzY3JLR3F2Rmsya1daN3JXQ3hRcDlXZncrRTFEWVRaNHJNVXpwUlFKQWda?=
 =?utf-8?B?YmtPbXBCbVIwdUhLZkE5M3ZWNTZ5eXNjZFdubVZycTlHaDJlaXo4N2N3WG53?=
 =?utf-8?B?Q1pLOWpXc1QybHFhb1krSlowb0EwbzVaZm1CaWZDa3daanZxS0hBWEVQNm85?=
 =?utf-8?B?Yk1teWtaRENEMFRLY3JiM3R3T1ZDMmFjZVZLVEY0bmpqaU95SDh1dHFDWjE5?=
 =?utf-8?B?c3lRR1lPeTNRdDBNc09WTjRuUytwTHhLSjRGa1ArM2J5T2REQlozaTFWa25a?=
 =?utf-8?B?cTVmbTk3UklEOVFEK21ROTA5eGVWNkJ6ZmpTbGlLM2N2ODZxUHhrWGF4QXA2?=
 =?utf-8?B?Y2lFbmcraUZqbmxmdkpnYkVOZ3BFTzdQQjBZYWdxekxPMzJ1N2p6UkhYTXhz?=
 =?utf-8?B?VlNYaFVET003S283dWFsZnRjMXFoNjZPMUhaV0Q3QTBoT2oxdlhBbUFtMDha?=
 =?utf-8?B?d0RrOTB0RmFnWkJnNXg0cXdDTUxNYnhtcGlmTWJLNlNpU0VNNWpMbG9uWG9J?=
 =?utf-8?B?MXMyWW1YWGNkRGQ3R2JJTlFWdlRMOVhUTzY4WTV2TS84LzFTOHNmQlNhSmZI?=
 =?utf-8?B?bjVIcU1OYlJueklMNUw5TTFvaGwzaEV4RFNvT0dWaXEvSTJEK21xY0xIMi9n?=
 =?utf-8?B?TjBGV1dmRUFQbmE1ZjNDWE5BUVlVWkVRM1kwL21tdEFQc1Zidk9Kb1EzK043?=
 =?utf-8?B?SFVjdTlseFhIUDdOcktZOFk5Rm5jSGVtSFZXRldIeUV3bnhYK3Y2YW9neW9p?=
 =?utf-8?B?MzhiQlpDS1d4Mk5oWnQ3eDN1K1pWVGJHdFFTaXlKVGdaWHZTVHpjcDJVZC9Y?=
 =?utf-8?Q?1xkfjls913GNFCLnEfcWPJ+SM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RWKJVmeZpVAlpmYxiBwjR/9+S2o4QKJlc/9/3YxLEKUYKg8zBbeEQOWNzyNNgSXz9V4FMc2hkINRQAyw+cGBdPgmkm/gnvO84xg1g08S+auiiMbdo9eoRROIiBp+5y39VyCpK/HpbZTAo4rUOtuzV7w5kOPkH+Bv8aMOOh5oeM+nuVgEGAOwhGf7dACrFHadXJiuOyFSl1jiOgK+CtBvEhHMtrV7npu/6HD3jZYgdgWSY/Vv/GVazImX/hOm/bLRD/wSQaf7J8OgeBBWYnSszkzAmR4HfA2dVlAlfBNgkyeaYgCBi8Rr9gcKv2CxsiOsaaK7G87r6hxJenn/sARFUhOF7KFnLus71bdoNijrXXbuLCyUQcJEiuvkxM1vMit5/htKR6KMYZ5paaWHdb5zZgkWUAyGBso4zJtR/htTOzbfG7MTCTvsaU06OG1KznwigEjH0JZDQ9D+cJCxjh2d9XiMLC09Kf/+Rlxo4xx5nCNHncnnr1YdGYFpx/07rBvbCWw7b+vtpI3nueBeocWJGiIX2ZsIHME98/ZCERbA38WLbwia9SKGr8L1kjD0RknEr+lHgtpVr45ush5b8gb93lf/O0dfmvbEXgYIrP1lCAM2U2NwDjvuN8KJ+NSdOyaYL0D2k796mu4NPlGI7gLd2UxopbqnWMs8rDVfv2IKZOkzOLoy/l487iKaLK6efG/CDUkQ9Eo4C3ZDxLtquTdEwLPOQhfxxgP/zUwPpG8CFHvwsY+SjB5gCGSZJ/vBSlgDpnEx2PoXh0U5kCkwUR6UKqwi+xWm9UjmJ4TJ/MieeoKEC4mnYYrsI5sdLBQKl2fbAdmoh+iOORCXR3JOBDfAOQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848eeb2b-4425-43dc-7a06-08dac96b067a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 13:44:35.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHa/ZQzYWkzfNiU+iq4s1Ce+Z6PfmPXNje4vZGdBu2qEzCFX1D3dVBxF+Nh2NlJmvj7kDPv8MZ4nNwOe6a7pGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR03MB6245

On Fri, Nov 18, 2022 at 02:04:40PM +0100, Jan Beulich wrote:
> On 18.11.2022 13:39, Roger Pau Monne wrote:
> > On one of my boxes when the HDMI cable is not plugged in the
> > FrameBufferBase of the EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE structure is
> > set to 0 by the firmware (while some of the other fields looking
> > plausible).
> > 
> > Such (bogus address) ends up mapped in vesa_init(), and since it
> > overlaps with a RAM region the whole system goes down pretty badly,
> > see:
> > 
> > (XEN) vesafb: framebuffer at 0x0000000000000000, mapped to 0xffff82c000201000, using 35209k, total 35209k
> > (XEN) vesafb: mode is 0x37557x32, linelength=960, font 8x16
> 
> Interesting mode - should we check for non-zero values there as well,
> perhaps?

We could, yes, I went for what Linux currently does, but a height or
width of 0 is also likely wrong. We already check for bpp != 0.

> > (XEN) vesafb: Truecolor: size=8:8:8:8, shift=24:0:8:16
> > (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) (XEN) �ERROR: Class:0; Subclass:0; Operation: 0
> > ERROR: No ConOut
> > ERROR: No ConIn
> > 
> > Do like Linux and prevent using the EFI Frame Buffer if the base
> > address is 0.  This is inline with the logic in Linuxes
> > fb_base_is_valid() function at drivers/video/fbdev/efifb.c v6.0.9.
> > 
> > See also Linux commit 133bb070e94ab41d750c6f2160c8843e46f11b78 for
> > further reference.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Other options would be doing the check in vesa_init(), but that would
> > also then apply to other framebuffers and won't be strictly limited to
> > the EFI fb.
> 
> Well, zero is wrong uniformly, so it wouldn't seem unreasonable to
> put the check there. But I'm happy to keep it in EFI code for now.
> 
> > We could also check in vesa_init() whether the framebuffer overlaps
> > with any RAM region, but I think that should be in addition to the
> > change done here.
> 
> Indeed.
> 
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -552,7 +552,7 @@ static void __init efi_arch_video_init(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
> >          bpp  = 0;
> >          break;
> >      }
> > -    if ( bpp > 0 )
> > +    if ( bpp > 0 && gop->Mode->FrameBufferBase )
> >      {
> >          vga_console_info.video_type = XEN_VGATYPE_EFI_LFB;
> >          vga_console_info.u.vesa_lfb.gbl_caps = 2; /* possibly non-VGA */
> 
> A few lines up from here, just out of patch context, there is a
> PrintErr() which imo is bogus/misleading when also encountering a
> zero fb base. I'd like to suggest that you put the new check early
> in the function (perhaps extended by a zero check of other
> applicable fields, as per above), returning right away alongside
> another new PrintErr().

Would you be fine with the new message being "Invalid Frame Buffer
configuration found"?

Thanks, Roger.

