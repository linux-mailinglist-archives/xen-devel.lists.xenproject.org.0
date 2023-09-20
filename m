Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BC87A77EA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 11:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605468.943044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qitqG-0007e0-Vw; Wed, 20 Sep 2023 09:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605468.943044; Wed, 20 Sep 2023 09:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qitqG-0007c7-Ss; Wed, 20 Sep 2023 09:49:56 +0000
Received: by outflank-mailman (input) for mailman id 605468;
 Wed, 20 Sep 2023 09:49:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qitqE-0007c1-Sn
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 09:49:55 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b2773b5-579b-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 11:49:52 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 05:49:43 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6777.namprd03.prod.outlook.com (2603:10b6:a03:40c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Wed, 20 Sep
 2023 09:49:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 09:49:38 +0000
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
X-Inumbo-ID: 0b2773b5-579b-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695203392;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kPB6DbYidbp6fu9uBXlb5gXEyF4w51KljK6FpnwDGjw=;
  b=NcmE5KfNu6bi84+L3GZ4eiA4qDuZDFUvHH3fAADfOhteWdERn9OeFysy
   3RvooC8xI/sCK/QNyLzVKTPyj4Y8S19MV7zg2DxtPVnZmiuVuXH4QHYM2
   N/BXUjzXjSz3kzevIBA/OkHuTgOTii8xE9cVaRJWAzuGKmmnlMsj2VbSL
   w=;
X-CSE-ConnectionGUID: 6HtUucXmQmelgBhPrEfJEQ==
X-CSE-MsgGUID: dx3qRFJGRpSSSGnmIeuVdQ==
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 121843946
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Tu2pZ6tI6hewDKEwus2R4KFxg+fnVI1fMUV32f8akzHdYApBsoF/q
 tZmKT3UPf7YamLwfthzbIXgoEIFv8fTm9BrTAA9rH83FiIb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6EzyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdhARUw2It+ePxb+/RcNsvt4OIuvGBdZK0p1g5Wmx4fcOZ7nmGv+PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgf60b4K9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAttCSObpqqACbFu7ynxIESc4d3SBucKCsWG4XvNSN
 nIYw397xUQ13AnxJjXnZDWGp3qDsg8ZSsBnOeQw4wGQyYLZ+w+cQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAOMWIdbDUYCwsE59Xuqps6iB7nR9NvVqWyi7XdPjX9w
 CuDqiQksJwVgdQWzKWw/V3BgDWEq4DAS0g+4QC/Y46+xgZwZYrga4n271HetKxENNzAEQHHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGp9slePBC
 KMLhT5s2Q==
IronPort-HdrOrdr: A9a23:0dXVVqpSgVAKEvz08jk60tYaV5tlLNV00zEX/kB9WHVpm5Oj+f
 xGzc516farslossSkb6K290KnpewK4yXcH2/hsAV7CZnithILMFutfBOTZskTd8kHFh41gPO
 JbAtJD4b7LfBVHZKTBkXGF+r8bqbHtncHJuQ6d9QYXcegAUdAF0+4NMHf8LqQAfnggOXNWLu
 v/2uN34x6bPVgHZMWyAXcIG8LZocfQqZ7gaRkaQzY69Qinl1qTmfHHOind+i1bfyJEwL8k/2
 SAuRf+/L+fv/ayzQKZ/3PP7q5RhMDqxrJ4dYKxY4kuW3TRYzSTFcdcso65zXIISSaUmRMXee
 z30lcd1gJImjfsly+O0FzQMkLboUkTAjfZuCGlaD3Y0IDEbQN/MtFGg41BdBvf9g4PgPFQuZ
 g7hl6xht5vFhXHkz3659/UEzdQtmTxj0YDvIco/jpiua13Us4LkWXaxjIMLL4QWC3984wpC+
 9oEYXV4+tXa0qTazTDsnBo28HEZAV7Iv4oeDlxhiW56UkgoJlC9Tpv+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBUukChPYHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTceOwJpI+BbQR3jVZ0Wk9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRtbWXv
 6iUagmd8ML7VGebLqh8zeOKKW6c0NuIfH9kuxLK26zng==
X-Talos-CUID: 9a23:fA22126cZwqjeLupBNssqm4IJ90uQnjkyXrULGW4MXxERp+4cArF
X-Talos-MUID: 9a23:QdctawgYYljiWYn3pS9vo8MpONcz+p6AKm83ia49gOaCMA19JgmRtWHi
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="121843946"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWF5ADe25Hmcm3zdcwmsPw14OXMV0075JBk7wcZMYWTXWtYVcqJQIhUNKwgzDTcYeRhMM/2GWoduq16tZkD0ANexmPTdPRGfOI1UNWFu3tMqdVHkU/bsfg/+74CvrLSAlZG0WvSu+kxT0bk7ee31rVpC8MPt4Ecz4sGOT6FDQ7eKw1bAt3smta1GED19r1DdBz96D6Qa0hWbyirTfRzgnZ5MLZ3dCV/SygCY0OJejetMJbz+Jd/bG712vi/GIzHIsMQjHIFwUTRYKUlpEmWN11rVPzGrgxEW5Z+PzMmc37ZTCO57fxSBpRMyhoOoAEhuHqEWkCVGj37IWXdzRkrzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDDowD9H8w+aIqHSiMv4jxBQmSjDbOAEQIF92F2dLNY=;
 b=itP+LejvDFxweDYy6FDUsl54CWRAFWmflvjUIHh+bRh3H52BfAGQJuc7kNDApsRC3B2C29+LypruhfjNy8tdBQPuh9dZ2b/GT4/Gn33H3DYvaPL2Hcuuv0+4pY5wHsT0PxnnK/ZiMyDt23vtms1d2V0/w9WskWgpr3Ey4EVCcDGFd5ksIj5RhEkGy5U5vJdj4eb1VSXV1CK+jplfKIsv/3RszT2DD9R7mEmdO08JX4hlgSz5dFIFxybJIDBbpkPdkyeXObwrnNzLQUqtXmJ4SbUK3kcXfGY8aJJg3a+hwuoYPML5ziLiQEXrkt+7VtHlu+0pxtvx0CkaO2m/t+bwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDDowD9H8w+aIqHSiMv4jxBQmSjDbOAEQIF92F2dLNY=;
 b=cRlTljJ3XZ7AiBcxZinoUIdTyZ7M75KgSHQRztPFwAuGAuc0R/O4/0s/J3sVVoYHFSL+7onZFuG2omd/ntq/h/pU9YH4rN4wD40m2RMa+culVJrlZ6BbRIBI0rx4dCtdSJCIjM/4Vq8BdVtB6i0aEZJ4TJh+zaJCG9DWXYPAIf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 11:49:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v9 06/16] vpci/header: implement guest BAR register
 handlers
Message-ID: <ZQrAK-XgKQwEPVED@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-7-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-7-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: MRXP264CA0009.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::21) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d7de99-5c94-45f8-c34e-08dbb9bee784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mSK4lP3551o/gTgPUEb8kEszXI1CeL2zGNUzcqfAUhgdd0LMNSdMRSwinUaK6k9QlzhWWDxnSYvnQErxg5N4F6KxWx/fpH0oeQ3s/zL7Kus0VnITEZjP/9xW/McbJl6gRcchr9rL0LMiSlgE2nQU6XTg6t69JikTtcwCzWSVmUL/nkLQNuqv/lpEfzSuwZuxI5HHqlIOFPGYasmbdCGgL/WGfRtHK2z+CYxnbYuIEZnuxxQ06Tl3cstbebAcFBHShDb5v15YA00LWIuFRnASv6DLWPli9SfjFrxux+OSoAkVpFTsKVsWwV+pQxpT3QxpMGjgcTO5nVBUi+crwcZUX2T0Bgrtcwsnc6gSYOmS4WBNVhulGSJN1r76dnWxvF6ED53epuMgh83r9EqZV2Q5V19dkyQ4pF2a2eeJdKVFD3LmZ+2T/uXJ4Wst5m6jF6cwavwUMiCZtLWt68pwrU4AQu8V84rauvcXXh/9Nona6PMja2mxqp3PJtcGGm3IHtmcpwCkBXt+jabBQrrKHB0ARzO5fvKi6vy/ohot/3ME4FVLe+ca1U/q8SZ0rB6iQ6js
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199024)(1800799009)(186009)(2906002)(5660300002)(26005)(66556008)(41300700001)(54906003)(66476007)(316002)(6916009)(66946007)(478600001)(8936002)(8676002)(4326008)(6666004)(6486002)(6506007)(9686003)(6512007)(85182001)(33716001)(38100700002)(82960400001)(86362001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmV2TnFlRnlhWkx0RG9qTHVueWRUaU1zRzJlNWs2SEpyNC9NWDdzVzRISVM1?=
 =?utf-8?B?V0RjNW5MeStzK2dJY2VGaDJpMzJ4T1h3Z1Y1am56cjZhc2dNWFBJRHkrR3I1?=
 =?utf-8?B?NHVqSENJSUVrRUk1QllCcmJQYWlxS2QrVFd4YitFZUMyK1J5WThJV1RSVS94?=
 =?utf-8?B?eCtqenZIOHJsR1RnOEtwSUY4bTMvTzU1am52SEJITisxUkd5MS94ZzlPYUlC?=
 =?utf-8?B?L1FmVUpzak0xSzFyUHB2Ni9lWGNoYlZnSS9JNHZnbjVyUWV3VDJaWmU4TnBH?=
 =?utf-8?B?eStMNjhhMTNucy9FeXFLVWVpaDlpRVJSWW52TG1yZVFkZklmUllvVFNJUi9w?=
 =?utf-8?B?dm9Ib1RkeDgrT3NTbHRBN1NUWXVKSiszckpCT2hnL0NiMFVkSy8vZklMTTBk?=
 =?utf-8?B?SXJLaXduZzJWZS9xR2dFc09rS1dDU3VsTDRHYjdYZVN4Z2hYSkNYaUx6UVp4?=
 =?utf-8?B?WXBFb1BkQWsyTE1VWW92SlErTkdpU2VTb0s2NTVIN2ZpREk3K2lwSlpFNVdN?=
 =?utf-8?B?bEtQZTdwQlNZcXIxYWx0R3pvWWZsVXc4SkNuWDl1MGNobVQ1VzJFRjNSOUlG?=
 =?utf-8?B?Ym9xdlJtSE5iQjBnQjZhNXlpUnZyU2RCYXFIaTV6WHI0SGRCdUErTUJqSHpH?=
 =?utf-8?B?STBYZk1uT1lCT0tmMm5IZS8wWSt6dmpFTlFuLytUWlhvL0lVa243MnVCOFI3?=
 =?utf-8?B?SjVwU2xBUDZxZWpYd2tBRXNvYVNzU1pBd3hGSENNQzV3OEVQaG9MMndnVkx4?=
 =?utf-8?B?NlNCOE5POGw5aEZlMlZublppaWdmN3Jyb3BVVG5OOUtmdUF2K09MTVpSdG1s?=
 =?utf-8?B?d3hhUk5xaEVHTmNhNWVwMzNJbklPYTF1WFVqejJuVmVDN0ZRYWQ3U1F0YVpK?=
 =?utf-8?B?K2dHVjN4ZjJpUGpUeTJ4RllMVHI2QUw0YWUxZmRnSDV4R2NvcHFFYm4yZ09B?=
 =?utf-8?B?ek80aXgxRGtHN2N2ck5HTnhQYTQyb2xKdm8xcGIycnVSKzdKdWtuQUZuMldG?=
 =?utf-8?B?dEJRK1NBeVdSWENTTkhkSXpnTW9QUDhVL3QwVXc1eURlTnFiaTE1VkRhanlC?=
 =?utf-8?B?L3pZTUo1bDB1VWZxRHJqem82TWdicDRiNS9NY1J2c2twMmlPNUp0VHY2ejZJ?=
 =?utf-8?B?ZlJLcGdjYmVGNlZCTjdEZmphUXhPc2lOY0xSUitCMzdsYlozMW9saXRrSWRm?=
 =?utf-8?B?bmhnWC9hNmtPS2VDRWppd0FFYlhNWlNFQ3B0NmU1eVVwc3N1YVhsZUx4UTNa?=
 =?utf-8?B?R1JlRUdzbzVwK3E3d2xvb0hxeTVOeFNFUFEzVmZmeTR2eER0a2hDT2ExWmZ4?=
 =?utf-8?B?NXBIbTlsc3pGRDhHaGRFSmtGNmg3MSs5MmI1dWpTcG1nQmlkRmZKRUUwQWJM?=
 =?utf-8?B?bmVHT3p3REVoUkFvaTA1bFVOalIveXQ1d2VScEJYRjJ0cEJmUDJZVDNMenBK?=
 =?utf-8?B?YnJSQWlaVi85RlVsdFdDei9Tb2RBVTRmdkpGeTZWYXZvbTY3eTdXbzF1b1Jl?=
 =?utf-8?B?WWRsOStSVWhuT0EzUzVISmFXK2ZiR0E4MXZmbkVlYVhQODZ2djJQTC9IZ05u?=
 =?utf-8?B?VHBpWCtldmZ4bVI2ajQrNUFaa25FcVhsU2ZBQU9BUnpWeXlrQXRMbC94My85?=
 =?utf-8?B?RERQUjhDOXROdEl2QUJWVUhjclZsN1o0Z2dCRHBvZGwvYUhIWWJlY3VkQitw?=
 =?utf-8?B?L1pQc0tZNExFaEYzdXp5WkVjUis1RUx5d0tEaGZiSWl4dWg1REZ1WFBkbUpk?=
 =?utf-8?B?aWQ2dStuR2oxWmxFY1IzTGxWUUZCOFpaZ3E2aW9xOGVObFhDNFhDVGo5TVF4?=
 =?utf-8?B?WFI1eGtBenhCT0s3OG5PN3RVQkwydlhGRmNlTUIzeEtiWU5RV0Z6ODYzWitQ?=
 =?utf-8?B?SnBzL2JmQ2RCdGhFaTh3WkNsQktHdHhKSEhKUHhyR2ZJT2R3YnR2N082YWdp?=
 =?utf-8?B?Nk9DK3lOVXRmakpNUEpLeitST2dkYlJ6U1N4N0wwdTBNcjNxaFdoUzdvazhC?=
 =?utf-8?B?c05JTm5XVTJyWS9kSTV1Z3IrWFBub2NuanMxWVVxT2xza1kzbjRZSEYxNjQz?=
 =?utf-8?B?ZW8zbnoySUVBRjl6UExCMS9QVXl1NkxFTmdDT2tqK3JWelFkUUU0RWRCZXMv?=
 =?utf-8?B?YnBmREhRSTNSZkhnRll2R3k2ZDFrM2QrRDU2U3hWSWU5bVlrYlp1NlZKT1d1?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qkPH1J/fnOc9uMzYnNEPj3LKCIFPa2X6xJOoESwSRcP2mnRMOZ4oDxO3MI0YFFPL988W4ri1E6m304RqSYiRZZh4Lfc7Smy0SZNeybrZzGeUNdhWzXwCRX3PZyZq88VPNhWI1qP0YK5qhGTvj/bT5v5ZI938iuGZ+/DeNBONPty2YaPbxUZ/UktqJiiNL95eI1Ztul/lxK+S8Gmfv52pmHXHjufkixddqV5j4tgAiZIBF6ES8oPauWiYRGKtuKHFyNMkAn7DvijsVMO/aAigiwumR8AO8ccY/SQ9nZpl2e5dKcsfKw6Qun+zsUVJtOwmtI4NEGPN7d99gAkj6nS1Sr2t1iLmNsfoh6UpjnGhYZLKrt+prcohXwlPqQdRVp8oVRdW48AKS3u3u23giwyB6BrzSTZC95kSMxvnWhGOVsZSqf3xzKNLSq81kYqVXNE6uaXzAYJ5aeggH2RkiHYqyyauC3K8XxURVf1ojeq3cMIgFZ0FCjYiB61IllR86NFTZOwbQRjHu1RGGaejbFGRlrHM5n7CbGbsWIemdiRELCWVPPZ1JTCKcTcLkUyOZqEWtX3tSzj22Eum5fgmKo8bGWvKv92hAN3wnQ0fXETzaw0wNT1rR0jhZRdapxzl8V65CUWA+TpKZDgAI+5RMriAktRBZ0nZr1H5Ha1tQCI67yWRxU0HmY08MTg2P3iRf7c2MyZYjuKS0OajZwzyc1a7qJ7NOJBq46F5OjftnuEEh00jGALZrV4AxLEB5Z/irGumCdqCiLR1d8HaDkPeHIepkjUdr+D48trX5fz/e0KwAKzAZnv/lLn6dSD32G4qNEHN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d7de99-5c94-45f8-c34e-08dbb9bee784
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 09:49:38.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOKfsJ6I181XNs9W5QBz/BaacIcGqfwavCOcQg/0AIS0PNrg7739bBIE//ownt9HkrDIqEtKKsO79SvbcEqSvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6777

On Tue, Aug 29, 2023 at 11:19:43PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Add relevant vpci register handlers when assigning PCI device to a domain
> and remove those when de-assigning. This allows having different
> handlers for different domains, e.g. hwdom and other guests.
> 
> Emulate guest BAR register values: this allows creating a guest view
> of the registers and emulates size and properties probe as it is done
> during PCI device enumeration by the guest.
> 
> All empty, IO and ROM BARs for guests are emulated by returning 0 on
> reads and ignoring writes: this BARs are special with this respect as
> their lower bits have special meaning, so returning default ~0 on read
> may confuse guest OS.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
> Since v9:
> - factored-out "fail" label introduction in init_bars()
> - replaced #ifdef CONFIG_X86 with IS_ENABLED()
> - do not pass bars[i] to empty_bar_read() handler
> - store guest's BAR address instead of guests BAR register view
> Since v6:
> - unify the writing of the PCI_COMMAND register on the
>   error path into a label
> - do not introduce bar_ignore_access helper and open code
> - s/guest_bar_ignore_read/empty_bar_read
> - update error message in guest_bar_write
> - only setup empty_bar_read for IO if !x86
> Since v5:
> - make sure that the guest set address has the same page offset
>   as the physical address on the host
> - remove guest_rom_{read|write} as those just implement the default
>   behaviour of the registers not being handled
> - adjusted comment for struct vpci.addr field
> - add guest handlers for BARs which are not handled and will otherwise
>   return ~0 on read and ignore writes. The BARs are special with this
>   respect as their lower bits have special meaning, so returning ~0
>   doesn't seem to be right
> Since v4:
> - updated commit message
> - s/guest_addr/guest_reg
> Since v3:
> - squashed two patches: dynamic add/remove handlers and guest BAR
>   handler implementation
> - fix guest BAR read of the high part of a 64bit BAR (Roger)
> - add error handling to vpci_assign_device
> - s/dom%pd/%pd
> - blank line before return
> Since v2:
> - remove unneeded ifdefs for CONFIG_HAS_VPCI_GUEST_SUPPORT as more code
>   has been eliminated from being built on x86
> Since v1:
>  - constify struct pci_dev where possible
>  - do not open code is_system_domain()
>  - simplify some code3. simplify
>  - use gdprintk + error code instead of gprintk
>  - gate vpci_bar_{add|remove}_handlers with CONFIG_HAS_VPCI_GUEST_SUPPORT,
>    so these do not get compiled for x86
>  - removed unneeded is_system_domain check
>  - re-work guest read/write to be much simpler and do more work on write
>    than read which is expected to be called more frequently
>  - removed one too obvious comment
> ---
>  xen/drivers/vpci/header.c | 131 +++++++++++++++++++++++++++++++++-----
>  xen/include/xen/vpci.h    |   3 +
>  2 files changed, 118 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e58bbdf68d..e96d7b2b37 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -477,6 +477,72 @@ static void cf_check bar_write(
>      pci_conf_write32(pdev->sbdf, reg, val);
>  }
>  
> +static void cf_check guest_bar_write(const struct pci_dev *pdev,
> +                                     unsigned int reg, uint32_t val, void *data)
> +{
> +    struct vpci_bar *bar = data;
> +    bool hi = false;
> +    uint64_t guest_addr = bar->guest_addr;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        hi = true;
> +    }
> +    else
> +    {
> +        val &= PCI_BASE_ADDRESS_MEM_MASK;
> +    }
> +
> +    guest_addr &= ~(0xffffffffull << (hi ? 32 : 0));
> +    guest_addr |= (uint64_t)val << (hi ? 32 : 0);
> +
> +    guest_addr &= ~(bar->size - 1) | ~PCI_BASE_ADDRESS_MEM_MASK;

I don't think you need to mask out PCI_BASE_ADDRESS_MEM_MASK here, as
you already do it if bar->type != VPCI_BAR_MEM64_HI for val.

> +
> +    /*
> +     * Make sure that the guest set address has the same page offset
> +     * as the physical address on the host or otherwise things won't work as
> +     * expected.
> +     */
> +    if ( (guest_addr & (~PAGE_MASK)) != (bar->addr & ~PAGE_MASK) )

PAGE_OFFSET() would be easier to read.

> +    {
> +        gprintk(XENLOG_WARNING,
> +                "%pp: ignored BAR %zu write attempting to change page offset\n",
> +                &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> +        return;
> +    }
> +
> +    bar->guest_addr = guest_addr;
> +}
> +
> +static uint32_t cf_check guest_bar_read(const struct pci_dev *pdev,
> +                                        unsigned int reg, void *data)
> +{
> +    const struct vpci_bar *bar = data;
> +    uint32_t reg_val;
> +
> +    if ( bar->type == VPCI_BAR_MEM64_HI )
> +    {
> +        ASSERT(reg > PCI_BASE_ADDRESS_0);
> +        bar--;
> +        return bar->guest_addr >> 32;
> +    }
> +
> +    reg_val = bar->guest_addr;
> +    reg_val |= bar->type == VPCI_BAR_MEM32 ? PCI_BASE_ADDRESS_MEM_TYPE_32 :
> +                                             PCI_BASE_ADDRESS_MEM_TYPE_64;
> +    reg_val |= bar->prefetchable ? PCI_BASE_ADDRESS_MEM_PREFETCH : 0;
> +
> +    return reg_val;
> +}
> +
> +static uint32_t cf_check empty_bar_read(const struct pci_dev *pdev,
> +                                        unsigned int reg, void *data)
> +{
> +    return 0;
> +}

If we are going to gain a lot of helpers that return a fixed value it
might be worthwhile to introduce a helper that returns what gets
passed as 'data'.  Let's leave it as you propose for now.

> +
>  static void cf_check rom_write(
>      const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
>  {
> @@ -537,6 +603,7 @@ static int cf_check init_bars(struct pci_dev *pdev)
>      struct vpci_header *header = &pdev->vpci->header;
>      struct vpci_bar *bars = header->bars;
>      int rc;
> +    bool is_hwdom = is_hardware_domain(pdev->domain);
>  
>      ASSERT(rw_is_locked(&pdev->domain->pci_lock));
>  
> @@ -578,8 +645,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( i && bars[i - 1].type == VPCI_BAR_MEM64_LO )
>          {
>              bars[i].type = VPCI_BAR_MEM64_HI;
> -            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg,
> -                                   4, &bars[i]);
> +            rc = vpci_add_register(pdev->vpci,
> +                                   is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                                   is_hwdom ? bar_write : guest_bar_write,
> +                                   reg, 4, &bars[i]);
>              if ( rc )
>                  goto fail;
>              continue;
> @@ -589,6 +658,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
>              bars[i].type = VPCI_BAR_IO;
> +
> +            if ( !IS_ENABLED(CONFIG_X86) && !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, NULL);
> +                if ( rc )
> +                    goto fail;

For consistency you should also set bars[i].type = VPCI_BAR_EMPTY
here.

> +            }
> +
>              continue;
>          }
>          if ( (val & PCI_BASE_ADDRESS_MEM_TYPE_MASK) ==
> @@ -605,6 +683,15 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          if ( size == 0 )
>          {
>              bars[i].type = VPCI_BAR_EMPTY;
> +
> +            if ( !is_hwdom )
> +            {
> +                rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                                       reg, 4, NULL);
> +                if ( rc )
> +                    goto fail;
> +            }
> +
>              continue;
>          }
>  
> @@ -612,28 +699,40 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          bars[i].size = size;
>          bars[i].prefetchable = val & PCI_BASE_ADDRESS_MEM_PREFETCH;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, bar_write, reg, 4,
> -                               &bars[i]);
> +        rc = vpci_add_register(pdev->vpci,
> +                               is_hwdom ? vpci_hw_read32 : guest_bar_read,
> +                               is_hwdom ? bar_write : guest_bar_write,
> +                               reg, 4, &bars[i]);
>          if ( rc )
>              goto fail;
>      }
>  
> -    /* Check expansion ROM. */
> -    rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> -    if ( rc > 0 && size )
> +    /* TODO: Check expansion ROM, we do not handle ROM for guests for now. */
> +    if ( is_hwdom )
>      {
> -        struct vpci_bar *rom = &header->bars[num_bars];
> +        rc = pci_size_mem_bar(pdev->sbdf, rom_reg, &addr, &size, PCI_BAR_ROM);
> +        if ( rc > 0 && size )
> +        {
> +            struct vpci_bar *rom = &header->bars[num_bars];
>  
> -        rom->type = VPCI_BAR_ROM;
> -        rom->size = size;
> -        rom->addr = addr;
> -        header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
> -                              PCI_ROM_ADDRESS_ENABLE;
> +            rom->type = VPCI_BAR_ROM;
> +            rom->size = size;
> +            rom->addr = addr;
> +            header->rom_enabled = pci_conf_read32(pdev->sbdf, rom_reg) &
> +                                  PCI_ROM_ADDRESS_ENABLE;
>  
> -        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write, rom_reg,
> -                               4, rom);
> +            rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rom_write,
> +                                   rom_reg, 4, rom);
> +            if ( rc )
> +                rom->type = VPCI_BAR_EMPTY;
> +        }
> +    }
> +    else
> +    {
> +        rc = vpci_add_register(pdev->vpci, empty_bar_read, NULL,
> +                               rom_reg, 4, NULL);

You should set the BAR type to VPCI_BAR_EMPTY here.

Thanks, Roger.

