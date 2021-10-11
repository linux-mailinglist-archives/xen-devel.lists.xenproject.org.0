Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5515C428B15
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205739.361127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsuL-00020Z-7V; Mon, 11 Oct 2021 10:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205739.361127; Mon, 11 Oct 2021 10:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsuL-0001yk-3W; Mon, 11 Oct 2021 10:51:49 +0000
Received: by outflank-mailman (input) for mailman id 205739;
 Mon, 11 Oct 2021 10:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkLr=O7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mZsuJ-0001yc-Pi
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:51:48 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f10142a-be32-44f5-9916-6b532c55ee6c;
 Mon, 11 Oct 2021 10:51:46 +0000 (UTC)
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
X-Inumbo-ID: 4f10142a-be32-44f5-9916-6b532c55ee6c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633949506;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yOc1FC3dq5is9drg++qboHvhgNwrvGJC92b65vHy0Pw=;
  b=K52Q656JeiFbRVdWBakUXeyxOVZt+YDAD7YsPCvQyLJtAaaiXAYRbqji
   VxCrglcdlMHxHksNgXsO3RwwfCbxG7ZB7SS/mlNJ2kzm9Ygtk8kAOAKmC
   NMhmND33ejdAddKsXGJPCEEAiP5T4s66FrVsLZorgDz6uRqVYI0nD2Md/
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eIFNPcpZUX1R1K7BQz28WmjUFiGAHPoFl30yGMQ0z4WHD5F3Hb+agy9WzSFL6gkL4+FcLMBFmY
 cyi5kqagnmtPCdt6vfD5QH8z0OtdqTZfZomkLRAB9muqjdrxXXbiDHiNiNxNZ7D8goXyVjxOO/
 ESDzUoiCheM8mvvxENnRYfLqzCStqK1NMjCun5Un0kYTjnA/AMRAqAFHE8xgpEinGKvrzY3OKQ
 kIqMM2QhRnKTIb4ScBRhpdXwdOdp6SEf7h2cZmgIuTy7SWTBYajdeNSw4RyV5ewWqoxRvx6sfj
 0QFG5PyMx3ZaN5P81F48Rgmq
X-SBRS: 5.1
X-MesageID: 54896848
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4vMaG6mIwHNt218oBsiQf+Do5gyPIERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXUGyGPamPM2HyfNp2ad6yoEhT68WDzN4wSQFo/3pgEyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA185IMsdoUg7wbdg2tcx2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MVGi7PpFCMFBaH3peJMdhxmEyxnDIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gps1pEQTaqOD
 yYfQRBjdE2baRhrAA8WIckbnvqH3nfZdwQN/Tp5ooJoujOOnWSdyoPFMcXXUsyHQ91PmUSVr
 X6A+H72ajkkM9iYxSuA42ibrObFliPmW6ofDLS9sPVthTW7xGYeFRkXXluTuuSihwi1XNc3A
 1Qd5y4GvaU0skuxQbHVQBmQsHOC+BkGVLJ4EfA+6QyL4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaIyEVMGtEfi4CQgst6sPm5oo0i3rnRNt5DLS8iNGzHDjq2
 i2LtwA3nbBVhskOv42g5kzOiT+oopnPTyY26x/RU2bj6Rl2DKaMYYCy5B7j9+RRM4+DR3GIp
 n1CkM+bhN3iFrnUynbLGr9UWuj0ubDVa1UwnGKDAbEx/AqCoiOHUbtc2wx4dWJsDMYJYA7AN
 Rq7VRxq2LdfO36jbKlSao23Ctg3waWIKekJRsw4ffIVPcAvLF7vEDVGIBfKhTi0wRdEfbQXY
 M/DKa6R4WAm5bOLJdZcb9wW1qM33WgAzGfXSIGTI/+PgOfGOiD9pVvoNjKzggEFAEGs/FW9H
 zV3bZLiJ/BjvAvWOHS/HWk7dwFiEJTDLcqqw/G7j8baSuacJEkvCuXK3ZQqcJF/kqJem4/gp
 y/mAR8JkAWm3CGZcm1mj0yPjpu0B/6TSlphbEQR0auAgSB/Me5DEo9OH3fIQVXX3LM6lqMlJ
 xX0U86BHu5OWlz6F8c1NvHAQHhZXE3z32qmZnP9CBBmJsIIb1GZq7fMI1q0nAFTX3XfiCfLi
 +D5vu8tacFYHFoK4Qe/QK/H8m5dSlBEwLgsABCSfoUKEKgumaAzQxHMYjYMC5hkAT3IxyeA1
 hbQBhEdpOLXpJQy/sWPjqeBx7pF2cMvdqaDN2WEv7uwKwfA+W+vnd1JXOqSJGiPX2Lo4qSyI
 +5SyqikYvEAmV9Ltat6Eqpqkv1it4e++ecCw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZl2CKv/Q4KUn3/gFt+7+DXRkANhWAknUFfrB0LJkk0
 aEqv8tPs16zjR8jM9CniCFI9jvTcixcAvt/7pxDWd3lkAsmzF1GcKfwMC6u7cHdcchIP2krP
 iSQ2PjIiYNDyxeQaHE0D3XMg7ZQ3MxcpBBQwVYeDF2Vgd6Z1OQv1Rhc/DlrHARYyhJLj7B6N
 mRxbhAnIKyP+3FjhdRZXnDqEAZEXUXL9kv0wloPtWvYU0j3CTCdcDxjYb6ArBID7mZRXjlH5
 7XJmm/qXAHjcNz1wiZvC1VurObuTIAp+wDP8Cx98x9pw3XujeLZv5KT
IronPort-HdrOrdr: A9a23:fqb7iqko5sqf1GRO/qw+cR12l0LpDfIo3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5PUtKpTnuAsW9qB/nmqKdgrNwAV7BZmfbUQKTRekJgLcKqAeAJwTOssJbyK
 d8Y+xfJbTLfD1HZB/BkWqF+gAbsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.85,364,1624334400"; 
   d="scan'208";a="54896848"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnjGZWzM1Zmne+By9GGXPlwpPJHZbRh+qDOlGFTlzVcvWSUvSfek7dBlZRPsyzZGzRn+K8JRVdBtgkjMr7ynUc8zWaV3w4VkjwvpBhEWk37ANy6TDnvPcRTWKaTcb+aX8fY4+1AcLK+jewPX4EQMeHDhkpH09lQMkbw8WmWfGVNut47MvArGVTBXvz32IJHGsShtm4S7aLtok92Z7UNdCTRpHg/Hhl9TdH9HNHTbBzFrhLLjxtUvDHcNya0fvrDkKeUdLEjS5TcyPSNI5+BNR+OT65O59vopKWN6YUReSyiM9758RAmvxyQgThqNpBiD2EmPITmths2eU5SIVQhF7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w475Y4obhiAZXFhuzgyXVss5IH9ghhVXUDZsncRBuFc=;
 b=adW0jx+5n0j9TREPhv8b0SbECEFYBBqEgTSujRgp5T/U30dAPI5vm7AFxrudaaUNgYAINST+sw3whb5JsZ5kfJgQsaxgNEzkc+heE65QgsA8IoacrDmotpLvQ884FvugfNO/oozmIUTFGL3d3eQ08NiSPz3Q3JZjzJw4lZa3E1GHYb7vgGb9lYJ5KQjjwlgayMBimrE7yRGs43PYEZNykUNVZO4mvCraUF2xyNtKBfV4bkKLex5XdP8NEHHqGDSCjdeZ86PIJbabbsDaXHh6hsaoN6rGBxSNApFtnRWv5X+32S+MWZ0xRBLA0RfDXiUfls6/S3KlYGKhrrjUCVV2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w475Y4obhiAZXFhuzgyXVss5IH9ghhVXUDZsncRBuFc=;
 b=D3nOzdP9Lrcs6Z6pl7DsGzEHKNoBSvTw8o+aAH3DuVmcJmxfQY1yA+JWgyAAOD7nNTLF1A7C9g3OZ1KtEFgmyPJu2OWPVfORZz3eVG0tmwljg/Tx99iKR/plodWaf3+pll0WvlV6TtfCwsOxB2Bsly0A1+21bx5kPKO0eEp3a+4=
Date: Mon, 11 Oct 2021 12:51:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWQXF2vDaWQvi+bT@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e548546-0619-4175-d2b8-08d98ca507cd
X-MS-TrafficTypeDiagnostic: DM5PR03MB3146:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3146A9186037F1968370B3428FB59@DM5PR03MB3146.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +R2Gl6VGMjz7riNVSBrC3PXMetIBhgtdf82IwnC5PigqnygAxefMjKqRLQm2HODGMplcpVcfTMAwaUrmaEzknGLqFrYncGJHfoDZiFBRae6D419c3ORH8aZEveOHDR//ZYALsHHNp6U1drm+qjVLGG5n4jgoJUg/GWHV2qf0JUAEBR1OmNpkVv8E2gVAJKbk/jF4CrTC//nmNW6rfddSEeLSCn9pecOWRLk+QPozIezguqlxM2n+3zQoRUufEdHSMmm29AdtttX80HXckIHxTWc7LMKOR65Kn484EBMBFCPngQ1Y0ZPn7xmXiVvKqmXlwlP3e4+WXwSCxJ/xQfBlFwr9LxMc/68I8Ch33kwfEbleieANYe16iPiRu3CGfp1d+kwrF3E694C2K1q0/CkGfKRYG9/3VWYDxv3/2/mD0ko8XG/PleTeYVklHRybx4XHNPVT2F/V4KDFE/l0hl3yFi0aM1aTWTJP8FUEXol0XzkGDOC6wmuYOIpME8zENqd8WUcC4+Kp2FMazk2SleyESTdnnhMr4N3a5Jtn7gZJlTyLPtscjJLwDVsjHKBScg3TvdpJ/y8YPhqA0zkVnKsXoHz67lkswKFZc0K0TeU228h/xLE8dbAfqUar7++Worv/GSJhFKVCWSWPqHDGwxwTrRyo/pi1DLfWFA0cHEX5XtArdhBMRD7obY7rjvTMYUzEs9kS7NpZ5G/yMNUgl0ZRYhH7XXfkcNDyRq3JEgzE5Dg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66556008)(66476007)(4326008)(6666004)(6486002)(54906003)(83380400001)(6916009)(5660300002)(9686003)(8936002)(956004)(86362001)(6496006)(186003)(7416002)(508600001)(38100700002)(2906002)(26005)(85182001)(8676002)(66946007)(2004002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEJWRHJ3ZndCd210Q2JsNWIyWG13NnpiNTBqMkxOK0JpcndicUQ2UzVqWFJk?=
 =?utf-8?B?MHpneFVBZlo1ZTc5QTZZa1ZjbmQ2dEwyNFFTR2VycXBiQS9jRWJjWjJuQWdX?=
 =?utf-8?B?NUpZVCsxVldwdG4rQnVWTDdKcStsYURlVVNkeXFXTmMvcEFxZEtZMk53MmJy?=
 =?utf-8?B?M0tqZ1p4UWtLTFNOV3V1VDEwWWZnRG9WTEM0S090M3NrVmZBMDJ0RTVHZGN2?=
 =?utf-8?B?TGVaRTFzcUlFNnp0a2lEalFhZXRXZHUvS2pyTkUwTDJGcFlVdEl3NXgzdldI?=
 =?utf-8?B?NUtEMUlZLzRBRTJVYXF5QUd3S2J4NWpBTGdVSXY0bEdFSWtBSm9OS2Jka1hr?=
 =?utf-8?B?WGppandMdHl3UWRpS2Z4Vk5ydFUzY2JZU1c4dXV5ZVhLc3k0bjZHVUN5VmRp?=
 =?utf-8?B?ZEJOVUU5SVAyNUxDZzFDRDNqdDdnWG92VnkxT2xMcmxUR3ZrTkUzdDdPZ2M4?=
 =?utf-8?B?cGdsclduL2dlV2M5dnJuNEFoWWZMMGJRWkRqdVBSdlljVU54UkRmYXJXSmNK?=
 =?utf-8?B?bFo4bjVVZVFUNlVicjVBOHpmTXE5QmR3SmRQRi9UY2RPeVg0TzlwQ2c0YVJD?=
 =?utf-8?B?blhIQ3VYM1VUUnp5cFdHM0xSM2p6Y29zR09qMDB2T2dWbnJxcU1pMUtCSk5x?=
 =?utf-8?B?MlBxVEIxaSszQi9FN2lBVjk1ZGt4V2k4NFgxMDZnVFdNOWs1Mjk1RmJiTWF6?=
 =?utf-8?B?YXNiM056VDdURjNEbVdwV1pKNUpiQnc2ZjU4TGE4V0VjdTI4eTdZejhFSkdW?=
 =?utf-8?B?ak9JWlppeng3QVlIVk9xVVBKZVpVdTBnSTAvK3FkSDhvSkY2U2NDdTNxbFdi?=
 =?utf-8?B?OXpSYXhuNTRCMGRCdlUybzErbUNnTXIwMjJ5S0JTQ2JkeXVYc0N2MnovUmVB?=
 =?utf-8?B?WVN2SjZDaDVZVEVjR0lYK3RZSTJvdFlEWkE3YXQ5aUhFRk84SzMxNHl1QjlF?=
 =?utf-8?B?QWZXdEt1YnVnQ2dmd2Y4UStTRjRuU1NPaHYyVjlTZmFTR1E5M3ZjbWpPNEky?=
 =?utf-8?B?ODRMZ2dXMnozaWRUVkcyTHJySUFGdDdLSlhBNm1PV0I2ME5wcG03dk5vMEFz?=
 =?utf-8?B?VVhDSDcyY3ZJSTJoUGNtQnVRU2c3bE5lbHBjZlhDbFc0ay9aRGxFeGVjS0Np?=
 =?utf-8?B?blJRcTVKcUU3TWpxS3hzT2lqUndvZ25OUm11L0lwQTMvTGNyQVNNSjF5bWdk?=
 =?utf-8?B?b01MclZEOWplY0p2aFdUVVI2WVd3WmRtM0VzRmI3c2tscGJnUnVvanZEcWkr?=
 =?utf-8?B?Q2xRbEhocjBuaW0wbng1MCtEOUJ6d0Z3VXNLeFphNjlpVUNLSy93THFXZjBR?=
 =?utf-8?B?VlM4NjQ1YkVKT011TEEwbVUzRlo2NEs5SGtEb2dWcWliejZXNndzYWpLN1p3?=
 =?utf-8?B?K2E2ZWppWFU4d0IxMDF6eHhMYjZ0YkFqa2hvZDZ3YXZQd0JiNysrZHFYR1Fv?=
 =?utf-8?B?ZTROSFZKL0JKdlhtaVhoWCtlakd4alJNS25DV0NmL2I2T2t5dVM1SEtIZHR6?=
 =?utf-8?B?SmxUTEN3bExIQlBTdXlmd3FNbTk0Tit4TnlXQXZKNTd3b2NnNXNMM2R5VHla?=
 =?utf-8?B?d2NockRxM3J6bE5pekxidVNuOWdpWHQrb2kvdlJrbTZPdUhLcmthVFc3Y2Yr?=
 =?utf-8?B?STdiMk9vd1lLYjVsTFFiUXFuYm15K2x4ZnY0bERkNEZCdy93RkZvaEVhdEhu?=
 =?utf-8?B?MHY0RU1waTF1VExnc3NWeEo4Nk1sanM1TjhXeFcwMTNweC9YR3hFNllHcHFE?=
 =?utf-8?Q?wWRBIWpBJwUMQz6MRyeN79Gl01cOsffVM8l8St4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e548546-0619-4175-d2b8-08d98ca507cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 10:51:07.9441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3GzIJB2fNb/p65pYOcGKB/+oaCwmVSwX2tPWlL5J2+IbUQ5KCzik1a/MHhi4gEteeHPENSmSt9lo/sOQ90hpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3146
X-OriginatorOrg: citrix.com

On Wed, Oct 06, 2021 at 06:40:34PM +0100, Rahul Singh wrote:
> The existing VPCI support available for X86 is adapted for Arm.
> When the device is added to XEN via the hyper call
> “PHYSDEVOP_pci_device_add”, VPCI handler for the config space
> access is added to the Xen to emulate the PCI devices config space.
> 
> A MMIO trap handler for the PCI ECAM space is registered in XEN
> so that when guest is trying to access the PCI config space,XEN
> will trap the access and emulate read/write using the VPCI and
> not the real PCI hardware.
> 
> For Dom0less systems scan_pci_devices() would be used to discover the
> PCI device in XEN and VPCI handler will be added during XEN boots.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Change in v5:
> - Add pci_cleanup_msi(pdev) in cleanup part.
> - Added Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Change in v4:
> - Move addition of XEN_DOMCTL_CDF_vpci flag to separate patch
> Change in v3:
> - Use is_pci_passthrough_enabled() in place of pci_passthrough_enabled variable
> - Reject XEN_DOMCTL_CDF_vpci for x86 in arch_sanitise_domain_config()
> - Remove IS_ENABLED(CONFIG_HAS_VPCI) from has_vpci()
> Change in v2:
> - Add new XEN_DOMCTL_CDF_vpci flag
> - modify has_vpci() to include XEN_DOMCTL_CDF_vpci
> - enable vpci support when pci-passthough option is enabled.
> ---
> ---
>  xen/arch/arm/Makefile         |   1 +
>  xen/arch/arm/domain.c         |   4 ++
>  xen/arch/arm/domain_build.c   |   3 +
>  xen/arch/arm/vpci.c           | 102 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/vpci.h           |  36 ++++++++++++
>  xen/drivers/passthrough/pci.c |  18 ++++++
>  xen/include/asm-arm/domain.h  |   7 ++-
>  xen/include/asm-x86/pci.h     |   2 -
>  xen/include/public/arch-arm.h |   7 +++
>  xen/include/xen/pci.h         |   2 +
>  10 files changed, 179 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/arm/vpci.c
>  create mode 100644 xen/arch/arm/vpci.h
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 44d7cc81fa..fb9c976ea2 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -7,6 +7,7 @@ ifneq ($(CONFIG_NO_PLAT),y)
>  obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
> +obj-$(CONFIG_HAS_VPCI) += vpci.o
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 36138c1b2e..fbb52f78f1 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -39,6 +39,7 @@
>  #include <asm/vgic.h>
>  #include <asm/vtimer.h>
>  
> +#include "vpci.h"
>  #include "vuart.h"
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
> @@ -767,6 +768,9 @@ int arch_domain_create(struct domain *d,
>      if ( is_hardware_domain(d) && (rc = domain_vuart_init(d)) )
>          goto fail;
>  
> +    if ( (rc = domain_vpci_init(d)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c5afbe2e05..f4c89bde8c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3053,6 +3053,9 @@ void __init create_dom0(void)
>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> +    if ( is_pci_passthrough_enabled() )
> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;

I think I'm confused with this. You seem to enable vPCI for dom0, but
then domain_vpci_init will setup traps for the guest virtual ECAM
layout, not the native one that dom0 will be using.

> +
>      dom0 = domain_create(0, &dom0_cfg, true);
>      if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
>          panic("Error creating domain 0\n");
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> new file mode 100644
> index 0000000000..76c12b9281
> --- /dev/null
> +++ b/xen/arch/arm/vpci.c
> @@ -0,0 +1,102 @@
> +/*
> + * xen/arch/arm/vpci.c
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +#include <xen/sched.h>
> +
> +#include <asm/mmio.h>
> +
> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
> +
> +/* Do some sanity checks. */
> +static bool vpci_mmio_access_allowed(unsigned int reg, unsigned int len)
> +{
> +    /* Check access size. */
> +    if ( len > 8 )
> +        return false;
> +
> +    /* Check that access is size aligned. */
> +    if ( (reg & (len - 1)) )
> +        return false;
> +
> +    return true;
> +}

There's a vpci_access_allowed which I think you could generalize and
use here, there's no need to have this duplicated code.

Thanks, Roger.

