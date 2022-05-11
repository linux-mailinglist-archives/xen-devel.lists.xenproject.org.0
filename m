Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B293652312A
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 13:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326723.549334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokCx-0002xG-Lv; Wed, 11 May 2022 11:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326723.549334; Wed, 11 May 2022 11:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nokCx-0002ua-Hm; Wed, 11 May 2022 11:08:43 +0000
Received: by outflank-mailman (input) for mailman id 326723;
 Wed, 11 May 2022 11:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nokCv-0001xN-GF
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 11:08:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b55962a4-d11a-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 13:08:40 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 07:08:16 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BL0PR03MB4289.namprd03.prod.outlook.com (2603:10b6:208:6c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 11:08:11 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 11:08:11 +0000
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
X-Inumbo-ID: b55962a4-d11a-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652267319;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=36WlfBmXSKoUB9BSOG/HJzxrNe4fjswmsS5Vb1nthtA=;
  b=RQhL2FVkfYnGRv+E0XnhxvY4/SRfuxpQl1apS4RhvmSioWGzDv3bOlKY
   yX3FTwogMrff+cYXClOW924jXbxR3RLFUnlS7plWmZ8gUZ8rbLqKofcjB
   cmn6llyM1XO/SW5TltiTdtkeBdu+kAiE86ONr0bhmWYawhKLveRWilLGk
   g=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 71462117
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e5Ik4q09Ozx2Xc/ST/bD5d9wkn2cJEfYwER7XKvMYLTBsI5bp2FTz
 mUcX2jVO66KM2Wnctp+PYiypx5V7ceGnYQ1GwQ4pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMx2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1vsJaLZCwTb5aUv9xFWSJkOi8lP5dvreqvzXiX6aR/zmXgWl61mbBLMxtzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B86dBfmTjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SCjLWcB8Q39SawfvHrt/Ap3y5TWEICOIIe2VNxEwheGq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0c9ldDew8rh2Mw6z84gCFC2xCRTlEAOHKr+czTD0uk
 1qWxdXgAGU1tKXPES7EsLCJsTm1JC4Za3cYYjMJRhcE5N+lp5wvihXITZBoF6vdYsDJJAwcC
 gui9EAW74j/R+ZSiM1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:Fcge/qAIvTEYJW7lHeg/sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80lKQFmLX5WI3PYOCIgguVxe1ZnOjfKnjbalbDH41mpN
 tdmspFebrN5DFB5K6VgTVQUexQpuVvmJrY+Ns2pE0dKT2CBZsQjTuQXW2gYzdLrUR9dNME/N
 323Ls2mxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg72w
 31CNUWqFhwdL5mUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,217,1647316800"; 
   d="scan'208";a="71462117"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIaj+cb5PWp2kii8cAb26KHQqPqFY4VsUm2VKeKkKo4xiC6YSszk2JXeukq+xrLTthnOQaq8WWsNhxOZm1lOOpNwBUdqI5Zm5FIveDoBAAho1iufgGCO0ppM1t4B256JYP1lu3oF6Ejm3AvDlAeGKBAnj/Jnl2DtvTFMOnlZj/HQeO7ztKWEHGaiDdcwVBVOpIHqB+KnVep62ng4/E4du9aNGxw+E4+/uF312TBHgGRC6S3/g1P/SJI63VzVYf57ecNw/7G7A/dsuK3dPzo5Cj92CvIK056V3vk2ssCS0OOW5YHiWIa+vtiyAt38SWEB2i4MOWFM/ErRN/UdhdIxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJWgfGFO8DncUUY05mQZ8PEOgtI+BJ+iBil/u2rwa1w=;
 b=WHg76gK4JsE/skzPZ86E391T7cNfn7msGiwkXKt+uGSbCPMGUjtGrL8a8CqmCby6+k46rW8xqFYqKCIy3jWE/SIiAKEbDaViACJmmhVhXxtvBEhDivsN4Zy6CUCTEZ7ClcjroR4Yljf9isGJysvb0DU2j8lkXdEiqJkqDmNIGjGAoP1MOjKJuER/59yIjEs2CnoIMvwQzgCCYweNbjfzadoo8acDB7eWlakmrI7sl5pDqryAuB3viUP+o/DiAqcfP1ucjA1Dv898rYb7BbVnLDiIl2SurHBjxhUmSgUHUpcDc2xicVimZJCgZgXCFgpZGzLXCOT3gM+71+AfOmAepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJWgfGFO8DncUUY05mQZ8PEOgtI+BJ+iBil/u2rwa1w=;
 b=GMpUJcusiq0SVKF+RGQ32iBvTSwwFnZZTRpB74Kx5IR0tcv2/y8smlL7CpULND2yKDQcsIev03UQOmaEals2HgJaCnTX8gaUIXPzd3SWITvYEJ1WWgC50rKN/Rg8FHhT7udAQGUcFpkakpqGnslYHZ/MWIMO9xqzkJNbgzWIQkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 13:08:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 18/21] VT-d: replace all-contiguous page tables by
 superpage mappings
Message-ID: <YnuZFkzfjagzk4Hv@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <98553b89-6296-9e4c-4677-9201cd7cdeef@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98553b89-6296-9e4c-4677-9201cd7cdeef@suse.com>
X-ClientProxiedBy: LO4P265CA0095.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af930fe0-3fb8-49cd-0bfb-08da333e8992
X-MS-TrafficTypeDiagnostic: BL0PR03MB4289:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<BL0PR03MB42898B050F27AAB12C3A635F8FC89@BL0PR03MB4289.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iWtrfwPB3AbHh2o7qT8xf1FotCWTTpWQJzlY6Zuka85aXgtG5wwKAJo7KbQ8bsl4APIAIDEIXE+tGl15zYLLl1PtS6gHyWjKh4cjceTDDYxriTGlOw6UiH5YZmEyo4iCEADhzT8T8v76K/96T5mjJm/dY5iuIbEyBF1qGzGVBRyTf0RiRR16jn+fRvBB+m33a8Bjxk+XninGwSd79jyMs7IMW4WzF0WrDq0ad1ZII8DLrMKjghsP0sXpuTUV2/WEaGJNFPLYj9F8AvCpimUqPZg/rfVqbO6MOVj7jlwxnFCNKAp7WHNnjRCAPXjZm367quHt9++m8UcMDQEnbar3LbB0J8Etk0KPpAKolPw+tqQpHzrR5gIAzeBSfM0O0m4ly1xgK+b5nYQ2L255Yta0//LBdMHQ+TW5EMXLtt+06pw1+vdLT3GQe2MYtwH2/ZFqfHXprk82GRLj2zbHsbd93GpBWgoMjJXuQLDdq5kqZ3PTdDAB3dqh/dAGbda/nV3JG4uVgKfNjf4JMkRGvRENfUYLG+gNDFwGl2DvDpexErTUk6hKC0X/vb+TAdcSIBlUhe2bPy03AcbulQjyxFAelOYUtUJ1D6m0Vd/gpxjnL9zFChtuRXJszqF4M5Je7LlG+HYj426duA7BNKBNc8d+Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(82960400001)(86362001)(38100700002)(9686003)(83380400001)(6512007)(26005)(186003)(8676002)(6666004)(4326008)(316002)(8936002)(66556008)(66476007)(66946007)(33716001)(4744005)(85182001)(6506007)(5660300002)(508600001)(2906002)(6486002)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTlkcGNaZXNWRlRkeVZRcHVDZTl3UWlPTmVybFN1N1NPUDR0QUxHcWJ4bWts?=
 =?utf-8?B?K2lkNWdLYmxaSjRlVXYxUWdmWWdwdlh4WlVHRWVnbEJDbk9pL2NhK0t6c0lZ?=
 =?utf-8?B?VHQwZmUzTTVPSnRWTzAvTDYwZGcyZE9FK01QZHNhNDMxZVpoL3ZVRWwxZ3Ja?=
 =?utf-8?B?QytPODdhV09zYktoVkFFM1VId0ZIUEdrTDVoTFdjZ3BMcCtKa3BmcXhoZ1FN?=
 =?utf-8?B?RFgvMGpqQzJzY2lmN2syM0ZoWnRVYjJOTExMTVlrV1prTU5jSGlDVFdhaGxk?=
 =?utf-8?B?ZjhGRFlaZHl5YWtKUmd3SWNZNFA3QU1RaWRLWkZVdzIwSDRxcTEvVXo0c0VW?=
 =?utf-8?B?SGtIVkNIRXRJTm92d1BiK0Y5aUxpSzJiYmhBdnRHdXJJMnB3ZEYyYjZZUXYw?=
 =?utf-8?B?TTBEMGpCMG0yUDloUWE1ZWdQSnZBUTdaSFUvVXNoemRJTExMU3dYS01SdlNH?=
 =?utf-8?B?dkQ3eDNFWk5zM1RVaU5oWTloY0FCVlpHc3daREJqT2dId0xUaEx0alE5UXpL?=
 =?utf-8?B?a3dSWTk3Rm14WDVRaXBBMThGVEk5NlFmV0ZTcDVGYmEwYXhNdndwdFNWaDJa?=
 =?utf-8?B?cG5saVcvSVN2Z1VONkZLQ0YzRmNZYzBmM04zRlh2d2d0V21IQjJMTENhZ2FK?=
 =?utf-8?B?S2ltNGdFYmxMVXQ4K0tyMXRQY2tBaTM4aGpxNjQrNFNQVkZrNVo2OEhxSUZm?=
 =?utf-8?B?SEF0SlhsSUtkWUtTTi8xa2QvVjkrcjFsSlphcGFtSXNZOVFuZ2t3VUl3SFJT?=
 =?utf-8?B?Mlg5SXI4cmVNYi9lYWduTVlPYWlpSFkvc29Dc2Z2K1JRU0EvL0pOUGkzV094?=
 =?utf-8?B?QXBnc2phS01iK1UvRUM3VWpZQWdKc3U3UWtSekJSNnZ0MHhqbFA3eTRwWC9I?=
 =?utf-8?B?Z2RDRHc4YkhPbDNDWm9DNnRRRVIzU1FXc0ZueHUxNTc1dm0veGwrU0hNUEEr?=
 =?utf-8?B?YVlWQk1PQzFQeUxySGgrdmUrUU1PTEhMTFZuVlhtUWp1MjUvZnlGTFV2a01H?=
 =?utf-8?B?VjYxQ2VKVGJCVUpJb3c3clNpUnczVHoxV0s5MU0zZWdqV09yZTFyMFpqUkdX?=
 =?utf-8?B?KzVXVTYrTENYMnVMVjlpMElQbzFjZ0t4T3MxTGdwaUxCYUp1T3ZuMytHR2hn?=
 =?utf-8?B?b2lTVDBWTGRQc1YrQlh6dk1GaGovcVpPRmxsK0lYR01MNFVlakxEVjJSc2NQ?=
 =?utf-8?B?YXBuK1VxVFBvOTE2ZllWYjF2aWdETVRPbktIVng5WC9DbkFoVlg2VHJzZmMy?=
 =?utf-8?B?UGU4N0VVVmI2NkxTTFZhSllpNVA1ZGRjakVRNHpvZ3FhajhmbG9wYmtLQXFx?=
 =?utf-8?B?WkdDcXJsZlJ0TXVTMTN1YzdCa2thOXpQalJuLzZsblhjZ2xiM3hmWjA3dFdp?=
 =?utf-8?B?WmIzdVMxRjdTT0VFelhFbkJ5a2c0NlJKSHF3TG5zMXY4clRIK0UvLzdlUG9o?=
 =?utf-8?B?U2xKYUJGWXp2TFZ0Mms3bUxDVm5kQ2Y2RjdOVW5RVWxVbHBSZmtPVTNUV251?=
 =?utf-8?B?VXFKbVpRRlRFKzFsRkU4WGhKOEpKNXlMSEQxZ1A4UzVGcGNxWjBYak1PUEpk?=
 =?utf-8?B?THFNS1NEb0lXdkZGVGpUd1N0QURZd0hQVjU4dXcvUmhaM0VVak80TXdzVXZH?=
 =?utf-8?B?Z05SZ0ZYbVdFdUVjQ0V4QTE0eUNxd2pDUnNROXdwREdnZ1poZ1ZGdzFLbngr?=
 =?utf-8?B?RDdtRnBZRktaeEdaTWx1dlNFU2hMRUlNTE85Y0F1cGFQMWRJV2gybndGbmtz?=
 =?utf-8?B?NUxTaHVTQjlFaUk4UXUxeE9pbzh5WDlWdFhRUmFKamdSVnlHYmhoOXh6YkZH?=
 =?utf-8?B?NC9XVHEzS2NFWTh3MElTWG9GMzdnZDdYbWd4MnBCbTV6WitaeTdWYXdyREov?=
 =?utf-8?B?K1lrYTNlRTN1RTF2UnV1aFZNNStVMHhFM1RzK09TZGV6VFhIWXdEdGFaYjUw?=
 =?utf-8?B?cFFjT0RFeTlxQmhqbm50QXFEZ2NuNThoYlUrKzhpOUV6cnVDaExQRVh0cmUy?=
 =?utf-8?B?dkhkZG1DYTJ1V21CT1hiMVpuRHM3TFU1UzJBeE9hdWp0Vks3UldGL0F5TVZJ?=
 =?utf-8?B?OXhNTXV2TGVBK0lRVk1yYlNOUXc3bVRJOUpRRjlUVUdiSElpRW8vKzlRcUM3?=
 =?utf-8?B?YmVvUWYwbVp0N3ZHbENvb2RMdCtXcnFjK0FqRFM2MVhxUndsK3FwTXRlV1Jr?=
 =?utf-8?B?Vlk1ODhJTXRVMWZLc2tZUjVKWXhISDMxZVk2dWlvVDNhYU8vclBiMCtyQVpI?=
 =?utf-8?B?d2MrejNqU0Exa2d4NWVWbTRIVzRHMVh5WHZPeEttUEdDUkdXa3hzOHpUTm9P?=
 =?utf-8?B?T2VRckswSlY3dU9zdkFWUEp3NmxLYWxGZzhWVHovaDd1cko1M1hlUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af930fe0-3fb8-49cd-0bfb-08da333e8992
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 11:08:11.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+H8KuXFwfoERJ+nsgWtuh2OlMb8IHkgL9oQJCIFnAUlYVhbEGxeVtlLVgRkr+vxrUl9pgd6O01UEmF1/BRezA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR03MB4289

On Mon, Apr 25, 2022 at 10:43:45AM +0200, Jan Beulich wrote:
> When a page table ends up with all contiguous entries (including all
> identical attributes), it can be replaced by a superpage entry at the
> next higher level. The page table itself can then be scheduled for
> freeing.
> 
> The adjustment to LEVEL_MASK is merely to avoid leaving a latent trap
> for whenever we (and obviously hardware) start supporting 512G mappings.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Like on the AMD side, I wonder whether you can get away with only
doing a cache flush for the last (highest level) PTE, as the lower
ones won't be reachable anyway, as the page-table is freed.

Then the flush could be done outside of the locked region.

The rest LGTM.

Thanks, Roger.

