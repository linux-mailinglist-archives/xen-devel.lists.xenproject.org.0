Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FEC3F2A4C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 12:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169413.309469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH269-0003bH-B5; Fri, 20 Aug 2021 10:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169413.309469; Fri, 20 Aug 2021 10:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH269-0003Xa-7l; Fri, 20 Aug 2021 10:50:05 +0000
Received: by outflank-mailman (input) for mailman id 169413;
 Fri, 20 Aug 2021 10:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH267-0003DM-5Y
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 10:50:03 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee3e4b3d-4312-48ad-a67f-86d70d784bed;
 Fri, 20 Aug 2021 10:50:00 +0000 (UTC)
Received: from AM5PR1001CA0065.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::42) by DBBPR08MB4821.eurprd08.prod.outlook.com
 (2603:10a6:10:d5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.24; Fri, 20 Aug
 2021 10:49:58 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::5a) by AM5PR1001CA0065.outlook.office365.com
 (2603:10a6:206:15::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Fri, 20 Aug 2021 10:49:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 10:49:58 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Fri, 20 Aug 2021 10:49:57 +0000
Received: from d2cd7d3aa593.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA8DA143-304B-4266-8841-D56A62D46575.1; 
 Fri, 20 Aug 2021 10:49:51 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2cd7d3aa593.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 10:49:51 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1877.eurprd08.prod.outlook.com (2603:10a6:4:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 10:49:50 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 10:49:50 +0000
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
X-Inumbo-ID: ee3e4b3d-4312-48ad-a67f-86d70d784bed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CjrrO265wf0aGcX4XJfwZNR15y2eAMmUON8dxOA9VA=;
 b=9BbNS9Jjl41FuhgPDIJRBzaysXzPrMIB5GijKO2sr9mhMiqsDoNrPLDBxX8e3e0lSegpdHsnpDXBn3oKMX8t/lkE70wf+l80jXQoqVy3DHvHt0b8Q1ebYsFLrjK3dEO/gUXpmWaLi/FRU+6B9QTNvY0hXjS9ekAMOZcEwKpE6bs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4064da89f091ea73
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2wJWOMxt6b2NX3oPcKc0tsbVLy2F3HyNkQWckT24ZrEuWV2DNokPAjme1dKJImw+82e7Tm5IKmiksDqUbjd2Jz6jic+SdZvlUueddGPL+LCvhQJsV2YwifQtuN5XK4PaMeOGNIf3LZsVAWTSbJVSHvdTXOXHb3ZGFwA4Iv9p9eYk/HkHU8nKSaicWTDPzqY/93CjaeRvA9e9f0xNZMcz1sdZYR8bpvwGA2xfxyTSzC3CobyTtrJCHs33sMJo4wMjuodQpwcOTNRftPbMUuvZvYa2q6GwteMR2FlPRZyXFpTmBFIm4uiiP9UA0/eD+s6i1TMDUDP7vI1L0HEsZuneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CjrrO265wf0aGcX4XJfwZNR15y2eAMmUON8dxOA9VA=;
 b=FcGu0JZZh7EqvpZ5k0HmhBtMd9STsl59ZEBrCJVrQ27vC2nWyBhM3OGcDuGW7lS7d772jiAj3DTHeoUQ3Eiis6Xr/FNmm3TyUIKtxBsIdReMl9KqEkTJfc+d2+Q2lbDNdaAp/qsHlHwkV9+D8MTE7/vRp5ESnpR2aJKCSY23ryPqtiHCowc0W/vSKPlenihJCW1Oe+OisYzoONhOg7ZfqQB4P97rDiw+QC4GOnyTm2CAzNdlQRuhECx7dmZrenBvoXJ7J3FVbXgQbnKv+YefTpp1h6/873Igg7sFV/wtORDEZTVHu1WgN57pTosLzVj32gI3De8sPYdKZz+tojskuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CjrrO265wf0aGcX4XJfwZNR15y2eAMmUON8dxOA9VA=;
 b=9BbNS9Jjl41FuhgPDIJRBzaysXzPrMIB5GijKO2sr9mhMiqsDoNrPLDBxX8e3e0lSegpdHsnpDXBn3oKMX8t/lkE70wf+l80jXQoqVy3DHvHt0b8Q1ebYsFLrjK3dEO/gUXpmWaLi/FRU+6B9QTNvY0hXjS9ekAMOZcEwKpE6bs=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA Kconfig
 for arm64
Thread-Topic: [XEN RFC PATCH 17/40] xen/arm: Introduce DEVICE_TREE_NUMA
 Kconfig for arm64
Thread-Index: AQHXjps53Qsrm+WTv06/kg1OUu3sHKt64bkAgADV/ZCAAGlegIAAHTUQ
Date: Fri, 20 Aug 2021 10:49:50 +0000
Message-ID:
 <DB9PR08MB6857E4371D0E31C65E952C0E9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-18-wei.chen@arm.com>
 <1fbcb8a6-67b6-e2d6-6524-cfce7a8a6557@xen.org>
 <DB9PR08MB68571FFA0E971E3A60C588EA9EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <fe477382-c078-9647-49f8-ef40a9e20b50@xen.org>
In-Reply-To: <fe477382-c078-9647-49f8-ef40a9e20b50@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EAC63C512C3C4141B61853DB3D4804F8.0
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6027197b-07f7-471b-1473-08d963c840e3
x-ms-traffictypediagnostic: DB6PR0801MB1877:|DBBPR08MB4821:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB482118321FBA3B584CA9A3579EC19@DBBPR08MB4821.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FNcTJN72YX8Hhm/jtvPJgKjcJS+D3KfE//qu1r6dviJYRpp489TFv8mhTduzQ8IjOd//xqRykrE2Rzt65OWxnvUDSClUpMsMNkWpXc+vBjKOsweDiZmNk0mJv5S4wilGMqwnZN/8W9wD5IpVMSZ3CUaNgU9bEJJTjr53HC2eT+t3dfu5HnfkpCOZd3IkxbIukmcZEb79ockXiyVFefPc/sk2nkt5qbcnVqqy4FV2vhdb6BD/dsD9KGHDVc+P+sqH10UAcbgNwJn/tdlug3NaO7QI2onTsrOU/N7oMyDrBUQUQWBbotjELUmhpj4kYgmY10E6LLKTWh1+m9ALhfH9qmSkWPfGZGJsWzSO1V9JEcvGeyxI/UAfA+XRh6KiJGqcDZqxPSHmgNJIdzcYAKc5vqH8x2BDHZNDT85lGX077G/vAQkiB0JV4+0mrISOj27Puk9S+vbeXlMYWyEw09dAnNdE5iq5wRup8GkVNlGmX1VsmKy1WkhgjftNnn8dcu9nObLm5YJ+qF/UcPwBiFuqZNEDBwgxH8NoNuw+LAtU7vt+xVSOTte1dju7WtaOeaenY+4mLgpfzfEhaSJE76jZA12XhCHMPu10UupWGCkj7a59ydoyWndBDj2JJX/hNKOA8CNadeEjLpBN7+8AbtO+MFsJAPN5ftFpV94Bv0FjNonnPLzpn9//8IEmhso/4x9DTdptSgm/nXn7PuC09msDcQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(8936002)(8676002)(2906002)(316002)(86362001)(122000001)(38100700002)(33656002)(5660300002)(6506007)(110136005)(4326008)(55016002)(71200400001)(52536014)(53546011)(7696005)(478600001)(66946007)(83380400001)(66446008)(66476007)(64756008)(9686003)(66556008)(38070700005)(186003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R01wOGNzZ3BOWFo3ejloMzYwamFuc1hTeGdJSStDZUZoR2dGeWFVWmM1MGJX?=
 =?utf-8?B?NFFwZDBiamhNUnJRdG1HMVpCOHlPTXpDc0JLTGlzejFuWmRwd1h2ZGw4T3Vh?=
 =?utf-8?B?RVFyakpvYzJSSXJTQWlCanNVM3N3UlR2SVJZdTNyZkp1aC9WbjF4dXJVcVJ6?=
 =?utf-8?B?U25kRFRnQTFDcCtZbU5DdWViTytEUjJXREQ4dzFwNWRyZDNSTHdjbWNKOWtP?=
 =?utf-8?B?N24zZCtzNEFxdStmWkV5TlNNbUZHdDVxQ0pjbVBDZ21ZL0pURHA0cGgxdXd5?=
 =?utf-8?B?d2VCT2UyS1Ercjh2TWNJUE1hOVlFTTZGUERlZDAwb1MxNXRyaGl1Z3czK3Z2?=
 =?utf-8?B?SXBmNFJ3OGUzU1dkRXZaZFRuOS9RdnNiNWRHVFd1YitOU0F1OHZXVW04OVAr?=
 =?utf-8?B?aXlKOXhkNE01R0VSaGN5SXU3U2d5Yzg3WUlHTnJWeHdBbzlLOElmdld5SGpG?=
 =?utf-8?B?VGNWdnNsSkh4TmN0T2VWQXBCVEJoWWVZNnBtay9sYjdRTnhmTExoR1N6WXl3?=
 =?utf-8?B?dXpzbHlVZmVpd2dhWUYrN1pTWjl4YUN2ZlpoMGJvMzNKa253YitzWTEzNTlE?=
 =?utf-8?B?bDdEOTdEWXBZWTZuS1VIMndYdXJCTVVKS1pRM3FqdjhUTm1hWUM2NVloU3hw?=
 =?utf-8?B?aFZvMmdBcVJ4Y2phVDBWVDFrTGwwTGVJUkduWjdQMXN0L0Q3My9tREdzeity?=
 =?utf-8?B?c2M0cWZhdk9tQy94RnF4dFBiczQxOVlPYUNYVnRaWlhjUXJpd08wMGFkQWYx?=
 =?utf-8?B?ejJmb29oUm9FYllFcENqekt6MVQyT3JyT3FISzJqWmJielRHWklucXQrYmRL?=
 =?utf-8?B?OFRiTk9WYzB1Z2xLRkpzWUhEUHpRQTJkdFB0Q2ZOZlU1QlRqYzNHanFlZDNK?=
 =?utf-8?B?SkpjZDdhcnJnR2RCMHpkcFhQRUF0MWxuejhPVytXbU1OQWppRkJhWm9mRGkv?=
 =?utf-8?B?ZzdWZmtSenBRUDNIZS9BRlZkb1FGOFpPZ2sveUJSMlRualFqNFNZSVVoWU84?=
 =?utf-8?B?dUJ0VndROTR3eUhzRmlPbklMZmhzRFJRdDBTem0zUUo2YzVpeHpZUkZjaUhE?=
 =?utf-8?B?dEFpNUxDcUZNVzEwZEpsSWZ2TUxKbmVBbzVCZjBkZFMyeDlDUDVjWXJZQXZM?=
 =?utf-8?B?TzNNcFB1VmJxaUZFbHk5NUFabDl5RnBRNy9HbFZoUkxjcU9IMnh0ZWtLRXV3?=
 =?utf-8?B?azlLSzU4MGVRYWZWL08yWjlLQW5tSmdBMmZTQXZFc1dHK1R6ZWJGaTA5dS9x?=
 =?utf-8?B?U2syM0ZqNjF2WG9wejVTRm1xeXVKbC9rQ1Nmc0xtTXpDZWZhRHVEdmpRWEQr?=
 =?utf-8?B?L3pFUjNGbktwd00yZ1RZY1F2bGRWR0YyTmJuWkQvdEpGekJENjZSd2JxWEhK?=
 =?utf-8?B?VTBCaXVqZ0RicEt6RnIrZXJJS0toRVIzTjNJVXpaZFdmVU1ZMXJCbk5HQW5U?=
 =?utf-8?B?VDlaMnplMG1OMmVoUGZSSUlGbU10Mm53Z2VDaEQ5ZEFzNFpBUFRLWUJZSW12?=
 =?utf-8?B?U09sUjIweFdseWpGd2RPV3c3dVpFMkRBa0lvNGswUkJIU2k5c1pOZjlZVFZE?=
 =?utf-8?B?R2xyK1dyRWxERFlvZy96K1ZlWU1tQ2JjZEhEYWdWVE5GblUwam4wVGtIbkFF?=
 =?utf-8?B?enQ3NTdjYnN5c0FMLzEyYlJiVFozNGhTMGU4V0FyMm54YkZTUmJIeE1JTnN6?=
 =?utf-8?B?d0lzY1ZXYWhOUjRybEtjRG9UOUNGWXBxZ2JxT2UvbzlUQ29nUGc3S01iOUtK?=
 =?utf-8?B?SXlmdWVabWRYZTBWNVZmYlYzQ0IxYnZtNEFvVXI1aUFZdmF6RHRvaG1xY08x?=
 =?utf-8?B?bEZJeVZvd3daellSdWRVbVBOUnRPNGtBTkRCdWFsbFVPTG9kalJjUEViWVNG?=
 =?utf-8?Q?WvEVl8tAVKmxZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1877
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e375ff1b-5af7-48c8-c3f6-08d963c83c55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wWHAPiLRu7zJtgXSkuWuamO1wOhXvMti2mkt3FveqkZQ77O+IonMx2UDvrkar5QE7Q9rzqW6ZJl6ZsVhFoN9hjzbiKKcamoT5kg4ewoHleIGE76bCWomEpR+9o0fqq34rEEDOba0qHwm5StA+lA5ZgB11yAxBUanKcudpLHjyNhRfZPp0nftB5ueH6Gi2MngacCPOjAz+BuLR2Mstm900mpLl4Y5y/NvunhJy7KRF0AV6iaWYwJKINvlqhWTILCU0WUL6Z9ezTYNW0QQtqbL0gcWpYa0dbu1AgNNDsSDjSwbDePUK3HOspo+1Pvq0bkPgjVqS441MMUzvTpu2XuqzGLilhlsMyj6SqGjd4iR9Vq6cQaTm0IznnaZpW08pMeWJN0AMLv1Gmuboin8OIQ0zkItVRxBhC999RJm68hdFHV7nqv03Q4ByjOHC1mYcivaF4ngjifMbPS2ptU8N+pUolXq6MMIExbbTYxhZRTD7TNMYOtKkneDWJK+pn89EdUws5pKze0ueZx8TDTQyYaPcKCxFmNqOvVJDyzfg5Ek6MeVHf8c3O3XGkklhO1qsU3QE4rUGZ9HK7aqN2uRHjpxh+Eqa+m1v0L2C78ERa+trbGHxc6iGDnj0JIMpMlHUjJ++MKnxyuGsPNjIp79X6+i8qpNdVWfNiCWIjU1MzAxGzv6WPkf8cs7nMEb4tsrYZVPdlMEGUg+i/eVtE+4P9FBOw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(4326008)(508600001)(2906002)(53546011)(55016002)(8676002)(82310400003)(7696005)(186003)(26005)(86362001)(33656002)(336012)(5660300002)(6506007)(81166007)(316002)(356005)(110136005)(9686003)(47076005)(8936002)(70586007)(52536014)(36860700001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 10:49:58.2318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6027197b-07f7-471b-1473-08d963c840e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4821

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTY6NDEN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMTcvNDBdIHhlbi9hcm06IEludHJvZHVjZSBERVZJQ0Vf
VFJFRV9OVU1BDQo+IEtjb25maWcgZm9yIGFybTY0DQo+IA0KPiBPbiAyMC8wOC8yMDIxIDAzOjMw
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBXZWksDQo+IA0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiAyMDIx5bm0OOaciDE55pelIDIxOjM4DQo+ID4+IFRv
OiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsNCj4gPj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4g
Pj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPj4g
U3ViamVjdDogUmU6IFtYRU4gUkZDIFBBVENIIDE3LzQwXSB4ZW4vYXJtOiBJbnRyb2R1Y2UgREVW
SUNFX1RSRUVfTlVNQQ0KPiA+PiBLY29uZmlnIGZvciBhcm02NA0KPiA+Pg0KPiA+PiBIaSwNCj4g
Pj4NCj4gPj4gT24gMTEvMDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBXZSBu
ZWVkIGEgS2NvbmZpZyBvcHRpb24gdG8gZGlzdGluZ3Vpc2ggd2l0aCBBQ1BJIGJhc2VkDQo+ID4+
PiBOVU1BLiBTbyB3ZSBpbnRyb2R1Y2UgdGhlIG5ldyBLY29uZmlnIG9wdGlvbjoNCj4gPj4+IERF
VklDRV9UUkVFX05VTUEgaW4gdGhpcyBwYXRjaCBmb3IgQXJtNjQuDQo+ID4+Pg0KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+
ICAgIHhlbi9hcmNoL2FybS9LY29uZmlnIHwgMTAgKysrKysrKysrKw0KPiA+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+Pj4gaW5kZXggZWNm
YTY4MjJlNC4uNjc4Y2M5OGVhMyAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9LY29u
ZmlnDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPiA+Pj4gQEAgLTMzLDYgKzMz
LDE2IEBAIGNvbmZpZyBBQ1BJDQo+ID4+PiAgICAJICBBZHZhbmNlZCBDb25maWd1cmF0aW9uIGFu
ZCBQb3dlciBJbnRlcmZhY2UgKEFDUEkpIHN1cHBvcnQNCj4gZm9yIFhlbg0KPiA+PiBpcw0KPiA+
Pj4gICAgCSAgYW4gYWx0ZXJuYXRpdmUgdG8gZGV2aWNlIHRyZWUgb24gQVJNNjQuDQo+ID4+Pg0K
PiA+Pj4gK2NvbmZpZyBERVZJQ0VfVFJFRV9OVU1BDQo+ID4+DQo+ID4+IFRoZSBuYW1lIHN1Z2dl
c3RzIHRoYXQgTlVNQSBzaG91bGQgb25seSBiZSBlbmFibGVkIGZvciBEZXZpY2UtVHJlZS4uLg0K
PiA+PiBCdXQgdGhlIGRlc2NyaXB0aW9uIGxvb2tzIGdlbmVyaWMuDQo+ID4+DQo+ID4+IEhvd2V2
ZXIsIEkgdGhpbmsgdGhlIHVzZXIgc2hvdWxkIG9ubHkgaGF2ZSB0aGUgY2hvaWNlIHRvIHNheSB3
aGV0aGVyDQo+ID4+IHRoZXkgd2FudCBOVU1BIHRvIGJlIGVuYWJsZWQgb3Igbm90LiBXZSBzaG91
bGQgbm90IGdpdmUgdGhlbSB0aGUgY2hvaWNlDQo+ID4+IHRvIGVuYWJsZS9kaXNhYmxlIHRoZSBw
YXJzaW5nIGZvciBEVC9BQ1BJLg0KPiA+Pg0KPiA+PiBTbyB3ZSBzaG91bGQgaGF2ZSBhIGdlbmVy
aWMgY29uZmlnIHRoYXQgd2lsbCB0aGVuIHNlbGVjdCBEVCAoYW5kIEFDUEkNCj4gaW4NCj4gPj4g
dGhlIGZ1dHVyZSkuDQo+ID4+DQo+ID4NCj4gPiBIb3cgYWJvdXQgd2Ugc2VsZWN0IERUX05VTUEg
ZGVmYXVsdCBvbiBBcm02NC4gQW5kIERUX05VTUEgc2VsZWN0IE5VTUENCj4gPiBsaWtlIHdoYXQg
d2UgaGF2ZSBkb25lIGluIHBhdGNoIzYgaW4geDg2PyBBbmQgcmVtb3ZlIHRoZSBkZXNjcmlwdGlv
bj8NCj4gSSB3b3VsZCByYXRoZXIgbm90IG1ha2UgTlVNQSBzdXBwb3J0ZWQgYnkgZGVmYXVsdCBv
biBBcm02NC4gSW5zdGVhZCwgd2UNCj4gc2hvdWxkIGdvIHRocm91Z2h0IHRoZSBzYW1lIHByb2Nl
c3MgYXMgb3RoZXIgbmV3IGZlYXR1cmVzIGFuZCBnYXRlIGl0DQo+IGJlaGluZCBVTlNVUFBPUlRF
RCB1bnRpbCBpdCBpcyBtYXR1cmUgZW5vdWdoLg0KPiANCg0KT2suIEkgYWdyZWUgd2l0aCB0aGlz
Lg0KDQo+ID4NCj4gPiBJZiB3ZSBtYWtlIGdlbmVyaWMgTlVNQSBhcyBhIHNlbGVjdGFibGUgb3B0
aW9uLCBhbmQgZGVwZW5kcyBvbg0KPiA+IE5VTUEgdG8gc2VsZWN0IERUIG9yIEFDUEkgTlVNQS4g
SXQgc2VlbXMgdG8gYmUgcXVpdGUgZGlmZmVyZW50IGZyb20NCj4gPiB0aGUgZXhpc3RpbmcgbG9n
aWM/DQo+IA0KPiBJIGFtIGEgYml0IGNvbmZ1c2VkLiBZb3UgYWRkZWQganVzdCBsb2dpYyB0byBz
ZWxlY3QgTlVNQSBmcm9tIEFDUEksDQo+IHJpZ2h0PyBTbyBhcmUgeW91IHRhbGtpbmcgYWJvdXQg
YSBkaWZmZXJlbnQgbG9naWM/DQo+IA0KDQpObywgSSBkaWRuJ3Qgd2FudCBhIGRpZmZlcmVudCBv
bmUuIEkgdGhvdWdodCB5b3Ugd2FudGVkIGl0IHRoYXQgd2F5Lg0KT2J2aW91c2x5LCBJIG1pcy11
bmRlcnN0YW5kZWQgeW91ciBjb21tZW50cy4NCg0KQ2FuIEkgdW5kZXJzdGFuZCB5b3VyIHByZXZp
b3VzIGNvbW1lbnRzIGxpa2UgZm9sbG93aW5nOg0KMS4gV2Ugc2hvdWxkIGhhdmUgYSBnZW5lcmlj
IGNvbmZpZyB0aGF0IHdpbGwgdGhlbiBzZWxlY3QgRFQgYW5kIEFDUEk6DQogICBCZWNhdXNlIHdl
IGFscmVhZHkgaGF2ZSBDT05GSUdfTlVNQSBpbiBjb21tb24gbGF5ZXIuIFNvIHdlIG5lZWQgdG8N
CiAgIGFkZCBhbm90aGVyIG9uZSBmb3IgQXJtIGxpa2UgQ09ORklHX0FSTV9OVU1BPw0KICAgQW5k
IGluIHRoaXMgb3B0aW9uLCB3ZSBjYW4gc2VsZWN0IENPTkZJR19ERVZJQ0VfVFJFRV9OVU1BDQog
ICBhdXRvbWF0aWNhbGx5IGlmIGRldmljZSB0cmVlIGlzIGVuYWJsZWQuIElmIENPTkZJR19BQ1BJ
DQogICBpcyBlbmFibGVkLCB3ZSB3aWxsIHNlbGVjdCBDT05GSUdfQUNQSV9OVU1BIHRvbyAoaW4g
dGhlDQogICBmdXR1cmUpDQogICBJbiBYZW4gY29kZSwgRFRfTlVNQSBhbmQgQUNQSV9OVU1BIGNv
ZGUgY2FuIGNvLWV4aXN0LCBYZW4NCiAgIHdpbGwgY2hlY2sgdGhlIHN5c3RlbSBBQ1BJIHN1cHBv
cnQgc3RhdHVzIHRvIGRlY2lkZSB0byB1c2UNCiAgIERUX05VTUEgb3IgQUNQSV9OVU1BPw0KDQoN
Cj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

