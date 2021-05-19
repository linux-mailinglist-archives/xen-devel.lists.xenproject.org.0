Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A453887C8
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 08:46:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129886.243579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFyc-0006fs-KC; Wed, 19 May 2021 06:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129886.243579; Wed, 19 May 2021 06:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFyc-0006dF-GG; Wed, 19 May 2021 06:46:42 +0000
Received: by outflank-mailman (input) for mailman id 129886;
 Wed, 19 May 2021 06:46:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljFya-0006d8-Uo
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 06:46:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77c3da16-163c-4abf-ad64-8c0348d52495;
 Wed, 19 May 2021 06:46:39 +0000 (UTC)
Received: from DB6PR0801CA0058.eurprd08.prod.outlook.com (2603:10a6:4:2b::26)
 by AM9PR08MB5873.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 06:46:37 +0000
Received: from DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:2b:cafe::b2) by DB6PR0801CA0058.outlook.office365.com
 (2603:10a6:4:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Wed, 19 May 2021 06:46:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT035.mail.protection.outlook.com (10.152.20.65) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 06:46:36 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 06:46:36 +0000
Received: from 1dd00e7453c0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1774D172-7DFA-473C-BA3E-27FADDC84E4F.1; 
 Wed, 19 May 2021 06:46:30 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1dd00e7453c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 06:46:30 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0801MB1920.eurprd08.prod.outlook.com (2603:10a6:800:8f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 06:46:29 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 06:46:29 +0000
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
X-Inumbo-ID: 77c3da16-163c-4abf-ad64-8c0348d52495
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pxsC1t+NLF4X5GmOARzvzf6dayhkqZGGMAervDQAUE=;
 b=LstdcJkjQDzuXc8Rc95uZOPN9VCCRu/Ccle6f5iSG5c8mqwHXIROYkbPKcWarZIWSg0Nnm1BCNlpdlBQrEYayY58jvsqDpjDsm79JNBZVUKqLVDtF3hqdlMXBs3Bd9Ur70TmOGHdWT6PG/MKaXQLDKlam15zFTry1iwa+OhuMOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfor7oII/j5wGZwvzLyqe14viMjqr0alhmKgknzJK8aWOZ1HwUjkwN3PIVtuN8595xy9UM7jd45J4McI+yz81V7Kul24RzS4qsDFiLWl1yD3o9qEaovP2x0xCwXqQ0UzU9nKz2g7nsm1brDioCKv8CFHH+0vIkzKZEqjMhkJ0q7ET9lVym1ZyFJ8lLRipg0yBkPLrDqZZ1kP0/FlPz0TgQfPTZT5Ls5RWudsvGVHHwB1PLrgp4jovk/rc5jmEtNiTZOsFxsD4kS72cXrulftRGsIG1NxSJQJI8kBjwkJK8Gx6rfJWApKvQ8hgQgc7E5i9ndpT5oDFZM7Vhg/L4TbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pxsC1t+NLF4X5GmOARzvzf6dayhkqZGGMAervDQAUE=;
 b=V5DAUOsY1fXtQlspeYI8HD4B9bi+BOSgb15n1MuLLMSiCvbfs371TNmJ9zekabozeVjwv71ly+y58fznCTH68wbJnYjM/lBmDt2uUelocCCbgRu4zm+1YyjKoc907z51nkAM+T/i8sTbW8Bz/aLHjro97J9gyRuJnTDwTLXclbTqpigcb3SIolQQ6acsA0m5I7TXN8WlyOUdN/l6GpglTk1+Mdj3YMPMHBgtq9DyS64e8PciMb0LIdJ87HnmFch65WvGf12L76lxwOzdpajv84cpmuqj3eNJruf6UrM+z02J/XIoi6nwZl/mNvLKr2pZGRo9HXpUk/0+UgjosgeMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pxsC1t+NLF4X5GmOARzvzf6dayhkqZGGMAervDQAUE=;
 b=LstdcJkjQDzuXc8Rc95uZOPN9VCCRu/Ccle6f5iSG5c8mqwHXIROYkbPKcWarZIWSg0Nnm1BCNlpdlBQrEYayY58jvsqDpjDsm79JNBZVUKqLVDtF3hqdlMXBs3Bd9Ur70TmOGHdWT6PG/MKaXQLDKlam15zFTry1iwa+OhuMOg=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 08/10] xen/arm: introduce reserved_page_list
Thread-Topic: [PATCH 08/10] xen/arm: introduce reserved_page_list
Thread-Index: AQHXS6XFXoougD95T02cEJMQScUNQ6ro2ogAgAAQIWCAAC7qgIABQ90g
Date: Wed, 19 May 2021 06:46:29 +0000
Message-ID:
 <VE1PR08MB521533FA7B7D799DA7083256F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-9-penny.zheng@arm.com>
 <97bc6ca6-206b-197f-de08-20691578b9db@suse.com>
 <VE1PR08MB521538CF7B0BFED3007E5D8DF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <285e39b3-1bfc-aff3-31e7-d29993d77a20@suse.com>
In-Reply-To: <285e39b3-1bfc-aff3-31e7-d29993d77a20@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 361DFC8BAB7DF544BB4BCD3708316DB1.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 572e14e1-3b5f-449e-5ca3-08d91a91d967
x-ms-traffictypediagnostic: VI1PR0801MB1920:|AM9PR08MB5873:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB587342E9E58EBB79F35F64B3F72B9@AM9PR08MB5873.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /+kP2u2Fn5J7E6zl8xuAiXAabMOLTkD7BTEIUlNXFgjzTusZOo+s5JlMyIv7YvoW/A/N9zojRJjSGQNvFd8Yfgzoil0PUm0v0Js1H/o5hJwKZHiKXuYjcVoSnJEdqw4lAFlajnWw5EiuZ2iiN+3MbGvVEwvqYwZ85vrfO6e0hdsfiTjtGweG6/MzOYp8MguVroU7k4Ntk0vcKaeyrBANouCS3egSsbuWWn8ShCM9LJ0WB9f/ARfls9I7zp6eFEa2VOAd4EpFRBCXKZXs3KkOif7OjzbliRGP4ynpG0Vgpsn938uMAE6z777si/DeEPmlb/gq452vECOVSGPSOkNAAI6b8TnpYWDfGb/3o9vTzxlf+LKcBTl8l11shIc1x1qGR/nF7S8bEGNemUQ1vT2yoi2vfd/noaF107lkNhGQ0JhAcEX7gBIt0xZdiJ1FNIIwDWWQqt4WHUO/+nwD3Q4GjzJa4gqlMltNh+vATd6VqfIarYotBI3IjKUvyyHXW8N3LvP2U3yNHOvHmbAMb/YYlhUp9LrcPBMBFYaBOBsdNm/0hjslFdMkqzHd1PxZ2fDB7wlZxaIaKXn5288bGQvDmbMh8QP1KkCzqvxwG3MZeB4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(122000001)(9686003)(86362001)(66476007)(71200400001)(66556008)(33656002)(66446008)(64756008)(38100700002)(76116006)(66946007)(6506007)(83380400001)(478600001)(53546011)(8676002)(4326008)(26005)(6916009)(5660300002)(8936002)(55016002)(54906003)(316002)(7696005)(2906002)(186003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?MTZQSDhlMWx0Sis4Zm4xUHlSMFNkQkhUUlRsSUJ1MGdrNWZZY2J5MkRvMWpF?=
 =?utf-8?B?Vys0aDlOQThkVHR4bU00dUZSaWZnNW1ueEo5TGNxQjJnWkpaVlAvcmQwcXNz?=
 =?utf-8?B?R3ZqdmNuQXFHVVNNOEUwM09UZFZPekgwUUt2V3RxNlNQTS9hamFROVRPMGZE?=
 =?utf-8?B?UGhPZEEvcGQ1a1kyeGFzOG5CY0VlcFNQbytHSFBHZ3ROUEtzZEFGTnVsMVZZ?=
 =?utf-8?B?eUpxdTdodmJINnFNNzdZc29lSmRZeUpKblVLTkdENHJhVDAyY01wNmlBUVhJ?=
 =?utf-8?B?K0ZTaXI2eW9IekVjY0JiVXJ5RTF1NXdBOXBqOStQWVRLeHRaOHR1aHUxcDd5?=
 =?utf-8?B?MlMwQjl4S3phcTY4N3FqWS9DRGxqQlhBMmtCUFhlbUdNVG5LY0d6SnhRZ0Qx?=
 =?utf-8?B?MlRLUndNS1QwbUwxdVA3RlRmbVArckxMOVFneFdJRi9nWXZISEZWWHVFRlor?=
 =?utf-8?B?N0w2VWQxSmFKWGRKeGFDUHRVSlEvcVNnU2Uzc0ZmaTRmR1VVSXVYY0hmdHk0?=
 =?utf-8?B?cXkzajk2TDhUOTFCZWl0NU1YRU83SjhGZU04NEFzV3NhWXpKaUR4aXNQMTZh?=
 =?utf-8?B?dm5nYS9DajRzM1UvbEpIa2xFVlVUcFhNQks0SFlkVHB5TytjdXpGMW1oTGtR?=
 =?utf-8?B?Q2ZzN01DeHlIcmV2MlhBYi81a3pBdXVxVWFFNks0dDNRc1M0WUk1S3VvQVFY?=
 =?utf-8?B?V05nZDlsbmRsb012amVublAzN05SbGFMRGhIUGpYWlh6YzRoNDRRTzllbjJt?=
 =?utf-8?B?QlhOTk1rTFFqcGc2TjNtdUN3ZyswamlkSWZpVlY2UmlCN041SUVCZFlvUVFT?=
 =?utf-8?B?Sk13VWlDV3RlRFdkUlVob0p4K3hNdWFCbnFaYzdMZ0dHQzhBdVlsb3FZSEFQ?=
 =?utf-8?B?Y2s4QXNwNTJaZXlQQ1NTcExOYWE5aW1XUHFHOVpMa3JDNnM0OWFMblVzak5S?=
 =?utf-8?B?RXgrazJqOXBVVHZmUCtEWThaY0RsbkJJVC8zTE9OMVhkNjR0U3FGVGQvcS9L?=
 =?utf-8?B?QXhHb1hFdFY3S2dZV0pSeklXVWEwYUZhZzJKeGE0dGZNN1BtS053RGxLVTlr?=
 =?utf-8?B?NDN1alVFb0luS3UvT2lBcW9qT2NWcjNMN0JFSEV5VjJORVU5MjFIVTliTFFV?=
 =?utf-8?B?bnliZW01ZS9WWVdnTXY2ZFI2RkZXVVRwUENuYjE0dVY2UDRrdDlmL2tLbTlK?=
 =?utf-8?B?cE1yS25xWk5uZkhHM1BVcVdHd1gweHEzZVpkNnZJSVZINURNbmdnRzlsWVQ5?=
 =?utf-8?B?QnBWMklXcU9BZTlBU2dNMVNTY29ma1VVcklxaWFnWitYQ2NQMU1pRDZpZVRM?=
 =?utf-8?B?M2ZUQk04QlIvSW1kbS8xR1pzZjNnMEM1L3N5bUdhalhIdzk3VUtVaDRxQ25P?=
 =?utf-8?B?SUdjbmVmZGlnTFJhOVJzY1BjU0tIS3VJKzc0OVNTS1d1U0ZKZCtGNGpZaHpU?=
 =?utf-8?B?NVRNTzR1aUxQa01JWFhkcmhZWGZxTjRhWXRUVGVpOVRUR25PblE2czJvaU1X?=
 =?utf-8?B?SlcySXF5Wk55a0JnS2hRZ2J0b3BBK3laY2xyL1dQV3U5YzdmNERpWDRHcGRx?=
 =?utf-8?B?b3pvVkRhOStpeUtZY1BzQVpPWkFKQk41TVU4ZmV0SnBkaEFUMzNnNmhYZzZL?=
 =?utf-8?B?YjZjV2hDMFpUM3pkbkhLYzNVYXdSU05od1BPZnV3VjYyNlA4ZVoyQ2ZFNzhx?=
 =?utf-8?B?em5oV2pKaU9yZmpkRmExSE5xdjdWOVNKYUxBUjNhYVZGRFZjMHdtYTF2MVZl?=
 =?utf-8?Q?7T+CA090UcrL5U7S1IFgdwW5KTNIA4w9OmgZN5z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1920
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9ecb5b2-fbde-4749-b851-08d91a91d4e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BcRYx7FNb6XC7cdAybuMOBaVAuj8QmLXa6Ppo6glpVF9zd6HvmUBoXC//rLn5dZn+G+TTWodCETvOjjS+c3G/aZj3nDkK3+h1A2Okx2wzPOBTDr54zdpnBD+ZFHjRlb404Lu11GX6TiL4Fadv6bZ//1noUv9emYMRkuEwlTKEWe+FElWGGdbMDJXCtRWPtlx4kPe8rAfmQQFXYPI6ZkpgqNQbMQTadS8FcbxgWycRQwlsYdu2JJN92o/eF37tElAXPHe2pHLkVnocQxd0Arp+wsLm0cAcmNvbsYqE0NL8GJHNQknpQ4zoM1ss9s4792VTZqr34IpkkrDkESxtPn9caqfPfBCo8iu1cPUJnhT8OtQ+v/8S+eUfXplWv/2LS37GE0FFti9fiKxF8EZKk/A2keReNQzReCbwFNFVolZyfaGOLE+NQ7ox3ky5q87Osq7hyJK0X+c+BgW1BAMl/xSD0A0Jkkert8Y26Xin3MxTK1OA5F8N37fyl8CYFBIU5wags8aToG/b5HnGt4B568plcntfVDDXH0wng+filSA/1tWA3M5UAlggfQz3aM+0LmEBPNYPQrYGhqucEVqPvJq3bTzmKaUu/Y70bFohprM6Gy2rgdX7Mfl9RDGdpBvR07ntniaV5zscC/R1qthXP14dl0i/5t1t3t52RlSm+pemF4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(82740400003)(5660300002)(478600001)(54906003)(8676002)(7696005)(70586007)(4326008)(26005)(6862004)(53546011)(316002)(336012)(6506007)(52536014)(86362001)(47076005)(83380400001)(81166007)(186003)(2906002)(33656002)(36860700001)(9686003)(8936002)(356005)(70206006)(55016002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:46:36.9575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 572e14e1-3b5f-449e-5ca3-08d91a91d967
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5873

SGkgSmFuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDc6
MjUgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdl
aS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCAwOC8xMF0geGVuL2FybTogaW50cm9kdWNlIHJlc2VydmVkX3BhZ2Vf
bGlzdA0KPiANCj4gT24gMTguMDUuMjAyMSAxMDozOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4g
SGkgSmFuDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBNYXkg
MTgsIDIwMjEgMzozOSBQTQ0KPiA+PiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5j
b20+DQo+ID4+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
OyBXZWkgQ2hlbg0KPiA+PiA8V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPjsgeGVu
LQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4gc3N0YWJlbGxpbmlAa2VybmVs
Lm9yZzsganVsaWVuQHhlbi5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwOC8xMF0geGVu
L2FybTogaW50cm9kdWNlIHJlc2VydmVkX3BhZ2VfbGlzdA0KPiA+Pg0KPiA+PiBPbiAxOC4wNS4y
MDIxIDA3OjIxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IFNpbmNlIHBhZ2VfbGlzdCB1bmRl
ciBzdHJ1Y3QgZG9tYWluIHJlZmVycyB0byBsaW5rZWQgcGFnZXMgYXMgZ3VlYXN0DQo+ID4+PiBS
QU0gYWxsb2NhdGVkIGZyb20gaGVhcCwgaXQgc2hvdWxkIG5vdCBpbmNsdWRlIHJlc2VydmVkIHBh
Z2VzIG9mDQo+ID4+PiBzdGF0aWMNCj4gPj4gbWVtb3J5Lg0KPiA+Pj4NCj4gPj4+IFRoZSBudW1i
ZXIgb2YgUEdDX3Jlc2VydmVkIHBhZ2VzIGFzc2lnbmVkIHRvIGEgZG9tYWluIGlzIHRyYWNrZWQg
aW4NCj4gPj4+IGEgbmV3ICdyZXNlcnZlZF9wYWdlcycgY291bnRlci4gQWxzbyBpbnRyb2R1Y2Ug
YSBuZXcNCj4gPj4+IHJlc2VydmVkX3BhZ2VfbGlzdCB0byBsaW5rIHBhZ2VzIG9mIHN0YXRpYyBt
ZW1vcnkuIExldCBwYWdlX3RvX2xpc3QNCj4gPj4+IHJldHVybiByZXNlcnZlZF9wYWdlX2xpc3Qs
IHdoZW4gZmxhZyBpcyBQR0NfcmVzZXJ2ZWQuDQo+ID4+Pg0KPiA+Pj4gTGF0ZXIsIHdoZW4gZG9t
YWluIGdldCBkZXN0cm95ZWQgb3IgcmVzdGFydGVkLCB0aG9zZSBuZXcgdmFsdWVzIHdpbGwNCj4g
Pj4+IGhlbHAgcmVsaW5xdWlzaCBtZW1vcnkgdG8gcHJvcGVyIHBsYWNlLCBub3QgYmVlbiBnaXZl
biBiYWNrIHRvIGhlYXAuDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcg
PHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICB4ZW4vY29tbW9uL2RvbWFp
bi5jICAgICB8IDEgKw0KPiA+Pj4gIHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgNyArKysrKy0t
ICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8IDUNCj4gPj4+ICsrKysrDQo+ID4+PiAgMyBmaWxl
cyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBU
aGlzIGNvbnRyYWRpY3RzIHRoZSB0aXRsZSdzIHByZWZpeDogVGhlcmUncyBubyBBcm0tc3BlY2lm
aWMgY2hhbmdlIGhlcmUgYXQNCj4gYWxsLg0KPiA+PiBCdXQgaW1vIHRoZSB0aXRsZSBpcyBjb3Jy
ZWN0LCBhbmQgdGhlIGNoYW5nZXMgc2hvdWxkIGJlIEFybS1zcGVjaWZpYy4NCj4gPj4gVGhlcmUn
cyBubyBwb2ludCBoYXZpbmcgc3RydWN0IGRvbWFpbiBmaWVsZHMgb24gZS5nLiB4ODYgd2hpY2gg
YXJlbid0IHVzZWQNCj4gdGhlcmUgYXQgYWxsLg0KPiA+Pg0KPiA+DQo+ID4gWWVwLCB5b3UncmUg
cmlnaHQuDQo+ID4gSSdsbCBhZGQgaWZkZWZzIGluIHRoZSBmb2xsb3dpbmcgY2hhbmdlcy4NCj4g
DQo+IEFzIG5lY2Vzc2FyeSwgcGxlYXNlLiBNb3Zpbmcgc3R1ZmYgdG8gQXJtLXNwZWNpZmljIGZp
bGVzIHdvdWxkIGJlIHByZWZlcmFibGUuDQo+IA0KDQpTdXJlLCBJJ2xsIGFkZCBhIG5ldyBDT05G
SUdfU1RBVElDTUVNIHRvIGluY2x1ZGUgYWxsIHJlbGF0ZWQgZnVuY3Rpb25zIGFuZCB2YXJpYWJs
ZXMuIFRoeA0KDQo+IEphbg0KDQpDaGVlcnMNCg0KUGVubnkgWmhlbmcNCg==

