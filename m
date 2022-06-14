Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102754AD78
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 11:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348713.574895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o130T-0000hA-9C; Tue, 14 Jun 2022 09:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348713.574895; Tue, 14 Jun 2022 09:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o130T-0000eD-5Q; Tue, 14 Jun 2022 09:38:41 +0000
Received: by outflank-mailman (input) for mailman id 348713;
 Tue, 14 Jun 2022 09:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1me=WV=citrix.com=prvs=1570496fe=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o130R-0000e7-PZ
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 09:38:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3aa8cac-ebc5-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 11:38:38 +0200 (CEST)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Jun 2022 05:38:35 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CH2PR03MB5288.namprd03.prod.outlook.com (2603:10b6:610:9b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 09:38:34 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 09:38:34 +0000
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
X-Inumbo-ID: c3aa8cac-ebc5-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655199518;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VoYG36nGOO3GYMb+c7WpE0fIiap08K2I+1ZP0rlsr5Y=;
  b=YGbITQREXg+itkWHY5kWdLGFQ+PgOtr9EPC3/nb9wRw7IhCHvQubFtlA
   vXa9XDKEWW/tvvZ6g/PxaSxK4Dm/PlNXflLJdXTStWkvwChhL7tO1D0Ng
   RItfuzeOHjHRBA40JeVEu7Dx1L2P6Lv/BxpUTzUn2tsIZW72udhmQptrD
   0=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 73543426
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Vr2w468DpDsXPYN1KCz/DrUDnH+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2UcWzqCaayCZjD2KtFxYYq29UkE65DczNBrHQE/pCw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw34HlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnZu6dCEFYrLAoc0UdUhiLjh9HvZL47CSdBBTseTLp6HHW13F5qw0SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvSMvIAHtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGYF9AnJ//RfD277lwBWzLf3D//pZ4aIfexRx2OVp
 mT38DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW7xHEXCRAQfUu2p7++kEHWc8lEN
 0Ue9y4qrK4z3E+mVN/wW1u/unHslgEYc8pdFas98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa+PHYTJGpbPyscF1JavJ/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BApJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:Rq3RG6Ce+dC485PlHeg+sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl4N6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDIxI88gGBgR6h9ba/SnGjr1wjegIK5Y1n3X
 nOkgT/6Knmm/anyiXE32uWy5hNgtPuxvZKGcTJoMkILTfHjBquee1aKvW/lQFwhNvqxEchkd
 HKrRtlF8Nv60nJdmXwmhfp0xmI6kdb11bSjXujxVfzq83wQzw3T+Bbg5hCTxff4008+Plhza
 NixQuixtVqJCKFuB64y8nDVhlsmEbxi2Eli/Qvg3tWVpZbQKNNrLYY4FheHP47bW7HAbgcYa
 hT5fznlbZrmQvwVQGbgoAv+q3gYp0LJGbJfqBY0fblkQS/nxhCvj4lLYIk7zI9HakGOuh5Dt
 T/Q9pVfY51P78rhIJGdZA8qJiMexrwqSylChPgHX3XUIc6Blnql7nbpJ0I2cDCQu178HJ1ou
 WKbG9l
X-IronPort-AV: E=Sophos;i="5.91,299,1647316800"; 
   d="scan'208";a="73543426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw7KAUf88nyrjxfuuJPGCi1uvZtB8cwQov9qagSyZA1PHFWuI3eGbHHM2U5yiYPpjC82goArrVsTS+U+WgG9Thu3FJvayeUeEQ+2JhUtUcSwu9vhMNkmKZI4jXrErD8nZnaonGL7YDU0lck3JUOKcpHzd7LHfzEvbo3SM01HsuJkxaE6BuAJAX9zRXK8JCDETiEQbG8Vm0e3iVbqEkqNh1dS858ilVJAwgVYdJ8agHMaVwaUYcyzJ6AnlyOKW/Y7ffrtBNYpUXo/nzUr8TEzWuhFhACGhd7nG0TzrEx1uXYzeRQbuYtZCcG3/N14oas5krWeASel/kHDsALHKVIRtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMEGXRZfJV8cRfQIPJiIUOeSoPS/a1AqUpOTX0HMXjM=;
 b=PeoXy3PqK36k8NKbtlulixtCQA0P79qwdX1XKCRsA4twAv7yJGer4nZgAOFhRde0fJDwvpcESSacMcfmMm3bGjbthJY3CGtu3v2rYNmyCF59wr+6TGjqwOgNbQRKnfvDdV5gMebKKjPnhi1fc1pTNk83XTV2vgv6gGshVjDgdCYIYimI/S6NDqLhzC+L1tsmz5/TEgtJXDfeeDfwAH9tEF+Wfe0puAzxNZdECZ9r2P2f9aSLaU3SHyE7c8Z5S39SCbOmDSIv1nqG98UcXdyK/Ju4YZ5QGf1x8/BK0cq4787Hv5wSFmjw3QLG16KLknWDRhbGKPo0BXjk5SlO3mKAlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMEGXRZfJV8cRfQIPJiIUOeSoPS/a1AqUpOTX0HMXjM=;
 b=AglvoEv1r9cW5E9W2pGkvumr3grVZoyGGiGU7ZvLoUP6xiJaVTiIFDMp9O0ojyXsE3ew9mxyvLyFFeq7A2+JfO/Eu6nQPpTRDUAwBh3W/kSWNVLSfqbDS2paLmTKGKd7hc31+EnDVt2yo7N0eHL3D1QeRixXrD/AMExz4VA6t2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 14 Jun 2022 11:38:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: do not drop serial output from the hardware
 domain
Message-ID: <YqhXFKMlIvkQzVoT@Air-de-Roger>
References: <YqbziQGizoNX7YFr@Air-de-Roger>
 <3d0d74d8-55a9-cdb6-0c5e-616ddd47bbc0@suse.com>
 <Yqb9gKUMokLAots7@Air-de-Roger>
 <afa0a9e3-fd35-be38-427e-3389f4c3ca26@suse.com>
 <YqcuTUJUgXcO3iYE@Air-de-Roger>
 <f0f87e99-282b-6df7-7e57-3a6c73029519@suse.com>
 <YqgwNu3QSpPcZjnU@Air-de-Roger>
 <69d85d88-4ec1-987c-151f-0d433021fe34@suse.com>
 <YqhHtetipYTG8tuc@Air-de-Roger>
 <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72c94980-cbcd-d3b3-7aad-c9db58d9c4a2@suse.com>
X-ClientProxiedBy: MR1P264CA0172.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0a58550-5e64-4ada-dd12-08da4de9a657
X-MS-TrafficTypeDiagnostic: CH2PR03MB5288:EE_
X-Microsoft-Antispam-PRVS:
	<CH2PR03MB5288E47ACEAA50169894FEB38FAA9@CH2PR03MB5288.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bqMBC/72HdvWcJFmNTgpTKlM877FsO8BiG+CbZtshauUsR/zAs9vTQfx0nLcVLlAiz/YNOqQ85Q/9CODwsnL9a1TyqmKR0J4QSyGXuBGG4a+BnAWmHe2Wjgkva9frayaMUl02hmcMFPT1pktROTafSKoUyuHxljxCR6EOkHMjRUUdASySh365eZ3Dx2vJoZKEnjKEBRpJ6QDYMNGH2RIyu/64R8J1jNGg3FDS4gT1fcEQ+16Dcjw9hgztGhNBymyIKghNZWBO7fkPAn3v9BcDgUeKTbmZu+LejEd+S0/VFHhnzns40pvyrPzpb5PdvBtbYseLS2ovV1gClYNsy/jghuJBUf8twuFvd8wDz272Q7NK3zn6+CJIaNG8IVGQ+DdqBsJXEB35HxpTx4ai55DU+bFzY5aWD2CL63/cyUTSh8dezaxWOTd2oGhQdNB49CYLyXLN3WZ8pP/+fZk7V4BK5Umdb+YkqU+aEq1eEQuggZibZHrhd5ipbLTaN/PFuNEVKyz9MhJ6obDPS9EiD76p35yIGpDAiSz/DSHFKC4DSmBxPxakGvZAUpc+b5qhMV6B3g6XUN+d+VlIEQ9P19NzmmqH9Bxg9DL43/QI+i9KXlsNQewAgXr2uNTvjgPa9gcgjGTajHxY+9Jrw5/EC7YmA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(366004)(82960400001)(2906002)(5660300002)(186003)(38100700002)(33716001)(26005)(6512007)(6666004)(9686003)(86362001)(6506007)(54906003)(53546011)(85182001)(66946007)(66556008)(66476007)(8676002)(83380400001)(508600001)(4326008)(6916009)(8936002)(316002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBNMnZzejZZaWV6OU5iM2VFWUtDNXljUUhXZkowVVY2cUJTajBVaHhyb0Zn?=
 =?utf-8?B?a1lRNUEvTWtWRHlUamFJMWhQTFBaRnBWb0FBSHdPcWl5T2hFck95MUVxS1B1?=
 =?utf-8?B?Y0R1d2ovSzc5RFN5RDRvYmV5YkJrekE3cnlZK2FnYjlsK1FJelViVlp0b0M4?=
 =?utf-8?B?MnFpTXA3QTlCQjE2Mm1oblFaR1VGNDlaMVAweENOZ3AwTHpGY09jYUZTeHNp?=
 =?utf-8?B?VjMvUldNOHVZVEZRV1NJQkt1VXhzOUczTGJUKzMwakx6T2tpN2FxZGcvQzQx?=
 =?utf-8?B?R3QwZFp2SHI3SDk3aU4xUFNBcmh5ZG5yLzF2UTdtV0xNNCtBSThtdngrb2U1?=
 =?utf-8?B?Q1dza01ycU9iYmZyR3VZUjhYOXA4QzM2UEpiTkROdzJSVldIU2ppekEwL2Uy?=
 =?utf-8?B?cjBiZTZ1K2NvbUdSbk1EYmcyTWhzTzBCV3FWL0pTMVVjdnd1SDRsTjlTaWYr?=
 =?utf-8?B?R3N5WTZKU0hpeGN4TitrcWNXYTVvcGdCQ0FLR0ZUZE1KMmVoYTh1bFA5cXp3?=
 =?utf-8?B?NktTZGdMaU9mcUJVL21HZGpQY1BJbWhVeG1KbEdIMzhHSGtDcWM0R1R2ZElu?=
 =?utf-8?B?QUhBUXIzTnBCRnAvUTlqd0FGUEhLRUY4NlpNb2ptQzlJNnprMWphS3F6NzJs?=
 =?utf-8?B?RzZpVElqdU1wTlZ1c1liS010TGZwdHFGamxBZUIyS0RXRndxdU16WVM3ZHZX?=
 =?utf-8?B?bWg0aktpOXQ2elZzK2JJR1NCRWUxakRXTzZZWnNGUlEvMlVXK0w5eHlZQ0ZO?=
 =?utf-8?B?eStxN2ovSy9jclBCdUkvUDUyY2tXdFhSK3lPU1BPRHB4L1ViUVc3QjBCNUY3?=
 =?utf-8?B?VS9ZQm1CcE5JazZabVJON25SWUU4c3VWemh1cDF6a0dUL3dEWWo3UnZ6MXlC?=
 =?utf-8?B?YktOVW1yWHp3ODQxOFVQV0NQdldtK0J2T29ycVNJeU1HTDNraGFaTFFDV2FC?=
 =?utf-8?B?ZCtNa2JyVGpraVRmTjVUeVdjdmNjQllGVVF5eGRWSEVDK0p5a3REem5uL05Q?=
 =?utf-8?B?R1FhWTJGSlN5NE9ZY01DMEtaeE5Wc0hYdHJPWnVybWFhTlc0SVh2WUgwUkxZ?=
 =?utf-8?B?UmtrbnJoSGoraEV3c2ovRjJlMWNiQmNPYlRsM0NPc3h1UkhGTlRIUjNLOEFy?=
 =?utf-8?B?dUYzYlZkd3YyeG1zTXR2UGN2MEhQRUQzYUZVQlBWRUwreWpWYnQxTVkrQnhh?=
 =?utf-8?B?OXgza1FsMElQSHBKdHU4Y2FYeUtkSmlFd0tvWDBUeTdodXlwOU9sT0FlNndm?=
 =?utf-8?B?M2p1MTd5Mkh3NCtWNVgyL0lURG5PdmF5TktCa3RycERYTHkrUGMxYndETDBL?=
 =?utf-8?B?RkFKeWFxcGNCL2QzT0l5cnN2TVJ2eHVIeUNPV3dWR0JHQUlUakticG9Sdkw3?=
 =?utf-8?B?VFN2aXp3RFZURlJjK3RLc0EwSTRyMU0wZFhPTktxaElCRExmM2JaQ3c1VlZU?=
 =?utf-8?B?RldmQWQ5SjdHUlFuU2NIaEV6MmswbTBUZkg1S2hzNWNxQlVNUHVPc0k4aVZC?=
 =?utf-8?B?OENzNWxTN2RkYVFDdGY5ZWhrVkc4cGk5cXltWEsxLytiY0pSWmYvM2NudUtO?=
 =?utf-8?B?WkFVQTRXNjM1bnVHMG9JbzdobjVmN0MxRytXblk2MXF6dk5IemZNUEdWMUhz?=
 =?utf-8?B?WTM3M2JuTERsZjgxZHZ5YUpMR1kxQTVYT2grS1RPOFprUm5VODdvQVVodW1s?=
 =?utf-8?B?akJvT0JWUFlCR25yeHR1bjhkZUhubFVvTHVHVXVTR25WdDMySWZLVklsMExO?=
 =?utf-8?B?eER3eXB2Y2M5bGl5KzBldUxaQzMvOXNQRTRnb0ZGVDRVVUFxUU9COXZBQkU0?=
 =?utf-8?B?SFprMjlKT2xPQmNhanY0ZXN3QkVJTGtwOGJaNWpkNmUyZldnK3hQQ3hDdnAw?=
 =?utf-8?B?blJGVU9DNG9TSEVkL1REVGc2bElIM3pMV2x4dmN4ejdvZitveDZUOUhVNG1C?=
 =?utf-8?B?Y3M5cnVwd3RaSHllNWR3R1Nhd05NUVlHQlBHV3QyRVFGcHlkdTJ0UmNyVHQ0?=
 =?utf-8?B?UjJOQmlhK0JOdG95YXMzaHVyQWY0M21XNWE5S1EwM0F1a3AvY29hdWVaU2ZX?=
 =?utf-8?B?UmdoQjl2UUEwVVJodm9rL0FXVWsxR1g4TW03cVdCYitzWlFNUnhGa0JpWGc2?=
 =?utf-8?B?bXJySmp0V2VrOTFWTnYrTWUzQkwwMzluU3hWUXJuanE0NUVhZERpeUI1Y2Nt?=
 =?utf-8?B?cnZXWUJSd1BFOHBzSVFUOWswQmlHYmRkenZHa3pwcHNKOUtiUnVkdjR0cjJX?=
 =?utf-8?B?SElTT094dEtFTk03YzVYdEQrTS83MGtGR1dZelBiWGV1OUswTW9xNlNEY2Vi?=
 =?utf-8?B?anB3bzg5VEplUUV0T0U4SWxoQm55eG8xYTZSWjhmLzhrRUVPejdhS0pPVnFG?=
 =?utf-8?Q?vZ6wolE84Kt/IN6o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a58550-5e64-4ada-dd12-08da4de9a657
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 09:38:34.1247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUueelq+HKBo8r6XPAS5uHzif4/uyjIVhGqxbCQ3F7Vvw/5Y4moygq9FuQIRfwo1gPcLS1/As4/bRQHzKqp0+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5288

On Tue, Jun 14, 2022 at 11:13:07AM +0200, Jan Beulich wrote:
> On 14.06.2022 10:32, Roger Pau Monné wrote:
> > On Tue, Jun 14, 2022 at 10:10:03AM +0200, Jan Beulich wrote:
> >> On 14.06.2022 08:52, Roger Pau Monné wrote:
> >>> On Mon, Jun 13, 2022 at 03:56:54PM +0200, Jan Beulich wrote:
> >>>> On 13.06.2022 14:32, Roger Pau Monné wrote:
> >>>>> On Mon, Jun 13, 2022 at 11:18:49AM +0200, Jan Beulich wrote:
> >>>>>> On 13.06.2022 11:04, Roger Pau Monné wrote:
> >>>>>>> On Mon, Jun 13, 2022 at 10:29:43AM +0200, Jan Beulich wrote:
> >>>>>>>> On 13.06.2022 10:21, Roger Pau Monné wrote:
> >>>>>>>>> On Mon, Jun 13, 2022 at 09:30:06AM +0200, Jan Beulich wrote:
> >>>>>>>>>> On 10.06.2022 17:06, Roger Pau Monne wrote:
> >>>>>>>>>>> Prevent dropping console output from the hardware domain, since it's
> >>>>>>>>>>> likely important to have all the output if the boot fails without
> >>>>>>>>>>> having to resort to sync_console (which also affects the output from
> >>>>>>>>>>> other guests).
> >>>>>>>>>>>
> >>>>>>>>>>> Do so by pairing the console_serial_puts() with
> >>>>>>>>>>> serial_{start,end}_log_everything(), so that no output is dropped.
> >>>>>>>>>>
> >>>>>>>>>> While I can see the goal, why would Dom0 output be (effectively) more
> >>>>>>>>>> important than Xen's own one (which isn't "forced")? And with this
> >>>>>>>>>> aiming at boot output only, wouldn't you want to stop the overriding
> >>>>>>>>>> once boot has completed (of which, if I'm not mistaken, we don't
> >>>>>>>>>> really have any signal coming from Dom0)? And even during boot I'm
> >>>>>>>>>> not convinced we'd want to let through everything, but perhaps just
> >>>>>>>>>> Dom0's kernel messages?
> >>>>>>>>>
> >>>>>>>>> I normally use sync_console on all the boxes I'm doing dev work, so
> >>>>>>>>> this request is something that come up internally.
> >>>>>>>>>
> >>>>>>>>> Didn't realize Xen output wasn't forced, since we already have rate
> >>>>>>>>> limiting based on log levels I was assuming that non-ratelimited
> >>>>>>>>> messages wouldn't be dropped.  But yes, I agree that Xen (non-guest
> >>>>>>>>> triggered) output shouldn't be rate limited either.
> >>>>>>>>
> >>>>>>>> Which would raise the question of why we have log levels for non-guest
> >>>>>>>> messages.
> >>>>>>>
> >>>>>>> Hm, maybe I'm confused, but I don't see a direct relation between log
> >>>>>>> levels and rate limiting.  If I set log level to WARNING I would
> >>>>>>> expect to not loose _any_ non-guest log messages with level WARNING or
> >>>>>>> above.  It's still useful to have log levels for non-guest messages,
> >>>>>>> since user might want to filter out DEBUG non-guest messages for
> >>>>>>> example.
> >>>>>>
> >>>>>> It was me who was confused, because of the two log-everything variants
> >>>>>> we have (console and serial). You're right that your change is unrelated
> >>>>>> to log levels. However, when there are e.g. many warnings or when an
> >>>>>> admin has lowered the log level, what you (would) do is effectively
> >>>>>> force sync_console mode transiently (for a subset of messages, but
> >>>>>> that's secondary, especially because the "forced" output would still
> >>>>>> be waiting for earlier output to make it out).
> >>>>>
> >>>>> Right, it would have to wait for any previous output on the buffer to
> >>>>> go out first.  In any case we can guarantee that no more output will
> >>>>> be added to the buffer while Xen waits for it to be flushed.
> >>>>>
> >>>>> So for the hardware domain it might make sense to wait for the TX
> >>>>> buffers to be half empty (the current tx_quench logic) by preempting
> >>>>> the hypercall.  That however could cause issues if guests manage to
> >>>>> keep filling the buffer while the hardware domain is being preempted.
> >>>>>
> >>>>> Alternatively we could always reserve half of the buffer for the
> >>>>> hardware domain, and allow it to be preempted while waiting for space
> >>>>> (since it's guaranteed non hardware domains won't be able to steal the
> >>>>> allocation from the hardware domain).
> >>>>
> >>>> Getting complicated it seems. I have to admit that I wonder whether we
> >>>> wouldn't be better off leaving the current logic as is.
> >>>
> >>> Another possible solution (more like a band aid) is to increase the
> >>> buffer size from 4 pages to 8 or 16.  That would likely allow to cope
> >>> fine with the high throughput of boot messages.
> >>
> >> You mean the buffer whose size is controlled by serial_tx_buffer?
> > 
> > Yes.
> > 
> >> On
> >> large systems one may want to simply make use of the command line
> >> option then; I don't think the built-in default needs changing. Or
> >> if so, then perhaps not statically at build time, but taking into
> >> account system properties (like CPU count).
> > 
> > So how about we use:
> > 
> > min(16384, ROUNDUP(1024 * num_possible_cpus(), 4096))
> 
> That would _reduce_ size on small systems, wouldn't it? Originally
> you were after increasing the default size. But if you had meant
> max(), then I'd fear on very large systems this may grow a little
> too large.

See previous followup about my mistake of using min() instead of
max().

On a system with 512 CPUs that would be 512KB, I don't think that's a
lot of memory, specially taking into account that a system with 512
CPUs should have a matching amount of memory I would expect.

It's true however that I very much doubt we would fill a 512K buffer,
so limiting to 64K might be a sensible starting point?

> > Maybe we should also take CPU frequency into account, but that seems
> > too complex for the purpose.
> 
> Why would frequency matter? Other aspects I could see mattering is
> node count and maybe memory size.

Higher frequency likely means faster boot, and faster buffer fill,
because the baudrate of the console is constant.

Thanks, Roger.

