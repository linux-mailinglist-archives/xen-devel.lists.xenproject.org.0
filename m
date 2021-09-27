Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A33418E20
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 06:19:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196291.349066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUi6F-0003Xn-QB; Mon, 27 Sep 2021 04:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196291.349066; Mon, 27 Sep 2021 04:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUi6F-0003UV-KX; Mon, 27 Sep 2021 04:18:43 +0000
Received: by outflank-mailman (input) for mailman id 196291;
 Mon, 27 Sep 2021 04:18:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xxNw=OR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUi6D-0003UP-Ty
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 04:18:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fdba7454-1f49-11ec-bc3d-12813bfff9fa;
 Mon, 27 Sep 2021 04:18:39 +0000 (UTC)
Received: from DB6P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::31) by
 AM6PR08MB4934.eurprd08.prod.outlook.com (2603:10a6:20b:ee::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Mon, 27 Sep 2021 04:18:37 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::83) by DB6P191CA0021.outlook.office365.com
 (2603:10a6:6:28::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Mon, 27 Sep 2021 04:18:37 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 04:18:37 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Mon, 27 Sep 2021 04:18:37 +0000
Received: from 67f31e76db22.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3BA62E1-41A9-4149-9F6E-66551AB95E8F.1; 
 Mon, 27 Sep 2021 04:18:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 67f31e76db22.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 04:18:26 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4201.eurprd08.prod.outlook.com (2603:10a6:10:a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.17; Mon, 27 Sep
 2021 04:18:25 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 04:18:25 +0000
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
X-Inumbo-ID: fdba7454-1f49-11ec-bc3d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tquU0d1vXwH12rmXy34ZgK+kFXw1Cfp0uPLj9pvs/hY=;
 b=t543UH3rlE2JVfPcUeaIFoLSIPSkW6fIBhyF/I/hmgu60yfWbrUUfBCyHOaGnUmefT9njQbB6qKlbkDv0nR6ocMv2hpu4hreMkELuI+Buhl9ImrxEfCdi1vp2iGN8axvLE3VeMvZWe0R4FLYFAa80lN08fobIR8BmN5dIC04VnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C3gxvZio5YRVtXEJV7cMApmBP/hRPB4INy80LtQelKFCE1lohIrUSpVcvqqA0WZWzwwDCrpHmPSS9fJ/oB8nwdtXhMrTROXB1a8WXoJJNk+sumQXUQNmX1w/aY7vrroHi/9Ivm7oHFF69g5Wa/0rOiLxoOnNc4gFuQ3eLQFbvSOzl9zNdEHF1cVo5tS+e65+vbgJyrTgSwhkRu6shCiWhXHUji2t627NX1v+LJJFeZ00y0bcjERmbcU7O6lDnv0bAJfzhANGDVejTGRBwGwtVacSHo8emUvSJiUNWUgOYWTb5rfQ8peEoJmrj9w+BYzod4c0KMefCeeEa6ep8y9MXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tquU0d1vXwH12rmXy34ZgK+kFXw1Cfp0uPLj9pvs/hY=;
 b=PJyk0ryUOg/6VEmSTqrnKQHczty2o4i9LCz1PX6C0rC2VtpcW52Tv23dy4Oik7vezbTTprK8mY6Pftzv3mpFxcKF1G8TC1a683qsv4hk97g2PUnvHEsjq/gIKyHTTu0EEGxqOwwQbY7f4SRKfC7j2OwHEnDhEiMPDagm2MOzXUXcyASHxk56AVSbdIuDYwmBsu2tlRjYjdahrin8K98PFYwU3YSaWITZzhH5D6G2j0qj/oaxfx9tQtZi3Jo8g6rCO8WEQ8s86A8qf8E6xjuEF3zW7+0CjReRKbCbsPwlEtKR86ZbyiznOpwyClqe8/dCXA1UuzpfB+UUSO5n25HwGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tquU0d1vXwH12rmXy34ZgK+kFXw1Cfp0uPLj9pvs/hY=;
 b=t543UH3rlE2JVfPcUeaIFoLSIPSkW6fIBhyF/I/hmgu60yfWbrUUfBCyHOaGnUmefT9njQbB6qKlbkDv0nR6ocMv2hpu4hreMkELuI+Buhl9ImrxEfCdi1vp2iGN8axvLE3VeMvZWe0R4FLYFAa80lN08fobIR8BmN5dIC04VnE=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Topic: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Index: AQHXsHMrRDdmLUiNMk+huFUWk4EjYquyZ70AgAPY1CCAAP08AIAADO8Q
Date: Mon, 27 Sep 2021 04:18:25 +0000
Message-ID:
 <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7375F5EB05475F4D9A040A78B413529A.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9c9a6d00-a506-423e-c7a2-08d9816de0f0
x-ms-traffictypediagnostic: DB8PR08MB4201:|AM6PR08MB4934:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4934365BED878AA0D24568419EA79@AM6PR08MB4934.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tC3vusr0K/nwl8+5wEnJNIF5tuH8h6n5e9MDb3MqeY9NXPxG1At2xin0BqHOwhTisGeLaZoGbr23LnkF9Ah5BwLz87cXWwwy59L+uC5664YGMzh/iGfR0OqBwa+k/jKw5FlcTDH+IRmoFWzvrdj8XZzXsMc0WrR63TvQBQMhFL6qj+Nao072RSkd5XGN4yvkBxs8xm4pGq6zzva+c8cqbUet+gXfWUT2KAegu+IAlFgiL7Oh/iRIdU9sVqPFMwc6lBcDCBYucSoVhfS8WO3JpUVHcUZwNFu+eTtDqnTXAC5NHKUOQWeLxAW8UEcUQC4K89rTeaNFCQoR+eT1PGAG+ql1wTPsrNw6APOaG9PavU7xfKL+5lbnsgZ1BEk1c0xAMlFJqHR4bayHs7Ghs71IO/tFXp8CkbC23hu7ebmkam4bAKmZthToScgkGkKLzZAn1tBKl+ctgnGh7lgp84IB0xE70rZmV5nG7dCGMNWPMMPF3uWKeCxwP0UZaQbmqg4cJufmp96vvXS2KIn89Sh6ZKnlFClU8MZVRkwBeTT2aNgwbPl1HZEpb6Qk0TO91oM5bJFemnWZ0Cz1s5Bxp/L8wNjcuCXotPW9Eoncn9mW0qPWO7FpyNrYxHh5Du2Mmu7GfDKtccNFz+mcBdbgxNh4opzdNBKUcWaH0ZZN2wnHn5yM6WKqZAtP0ScqKd6y7PxdHiiUryTLVwjsQVfbcP1//2FseLvMW4ajsVlrXvXdB70vOboCTin9wtp2gHuS8xeb4JSlC42PqwSrOIuBsyN8pjyOJyJGTcWKebl0yVP8tW8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(4326008)(966005)(83380400001)(33656002)(5660300002)(76116006)(71200400001)(6916009)(66446008)(64756008)(66556008)(66476007)(66946007)(38070700005)(316002)(6506007)(7696005)(26005)(8936002)(53546011)(2906002)(86362001)(186003)(9686003)(55016002)(52536014)(54906003)(38100700002)(122000001)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4201
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c69f404-b6ec-43f3-77d8-08d9816dd9d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kvZYEt+pTbu7MOHInPQnIAp58oMdThgiLgx2DTpp6Y0DwedgGeJnQ8Y7aYnDQPv/2zh9MpXqblUbSrTFbXu4plaK3p1GRSw1jyRpcME8zr+1G0E+cMvQT5MU0+YvFCpNUNmEjpIA5hFurZHL5yKTKTjHYy8zzXtFbGwpE3Gy8U1OJgqZjF4d1r2dKM04eIjM7aaDIobDd+D80TQ0DP1sxJ4FRC2DsLPudYHdmUN2927OZVlFsYzxdgtBijMgaQabhFwyP5BIgpRWYLfUZ/kQfjQ7P6ruxk0rlC1V0udstAtK99d+eSCDjpo8JKmAcDMZLz4iOyYvApKejpWmmLQ0IW73k2wOdDyu7Om3PzkPYNLQ+xq5TVNNOrG07zVwWzR0QL1u8c6OpA35YS0akmIfxdXGwctrXDPzIqBrM0fVcUfsdWczVn4av8dtsFENkfp2kbgAfP5bDlZGiKj544P0P+ONXTj5stBRZt77VvANQpzgmxMPI4g5gP5Hr/Kbrh27fO+MSa2+rajMoA5TxBweJgM5LnitCnE/V2II5capNqVl482fuQhzyFaZBwc2z01jRshMJlkaw0ArdALqf8j3yCJc9MNeXuKOPtRtohI7s+K8iGs5DY+RECsLRVnAvqHSPULE3n1RFdcZ1Q6QNRBJk2CnEDB0xDbZGAUUsJfaWYq1llpr8tiAbzd2R0gf3Iq0HZWX/PrA+C29I15UDYSOVFNh/oBsVWyJ3nNSfLmINdsw0J2raPxcu8GjNq+smjlOkJ6tdb/nPcSbH9RIBC0QPXLBSYJOfNQQrWKamuwefkc=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(186003)(26005)(86362001)(33656002)(7696005)(54906003)(336012)(9686003)(6862004)(82310400003)(70586007)(966005)(55016002)(53546011)(4326008)(70206006)(47076005)(8936002)(508600001)(356005)(6506007)(8676002)(81166007)(36860700001)(5660300002)(2906002)(83380400001)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 04:18:37.4850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9a6d00-a506-423e-c7a2-08d9816de0f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4934

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ5
5pyIMjfml6UgMTE6MjYNCj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBDYzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgeGVuLQ0KPiBkZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsganVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMN
Cj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCAyMi8z
N10geGVuL2FybTogdXNlIE5SX01FTV9CQU5LUyB0byBvdmVycmlkZSBkZWZhdWx0DQo+IE5SX05P
REVfTUVNQkxLUw0KPiANCj4gT24gU3VuLCAyNiBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+
ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiA+ID4gU2VudDogMjAyMeW5tDnmnIgy
NOaXpSA5OjM1DQo+ID4gPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+ID4gPiBD
YzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Ow0KPiBqdWxpZW5AeGVuLm9yZzsNCj4gPiA+IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1h
cnF1aXNAYXJtLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjIvMzddIHhlbi9hcm06
IHVzZSBOUl9NRU1fQkFOS1MgdG8gb3ZlcnJpZGUNCj4gZGVmYXVsdA0KPiA+ID4gTlJfTk9ERV9N
RU1CTEtTDQo+ID4gPg0KPiA+ID4gT24gVGh1LCAyMyBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6
DQo+ID4gPiA+IEFzIGEgbWVtb3J5IHJhbmdlIGRlc2NyaWJlZCBpbiBkZXZpY2UgdHJlZSBjYW5u
b3QgYmUgc3BsaXQgYWNyb3NzDQo+ID4gPiA+IG11bHRpcGxlIG5vZGVzLiBTbyB3ZSBkZWZpbmUg
TlJfTk9ERV9NRU1CTEtTIGFzIE5SX01FTV9CQU5LUyBpbg0KPiA+ID4gPiBhcmNoIGhlYWRlci4N
Cj4gPiA+DQo+ID4gPiBUaGlzIHN0YXRlbWVudCBpcyB0cnVlIGJ1dCB3aGF0IGlzIHRoZSBnb2Fs
IG9mIHRoaXMgcGF0Y2g/IElzIGl0IHRvDQo+ID4gPiByZWR1Y2UgY29kZSBzaXplIGFuZCBtZW1v
cnkgY29uc3VtcHRpb24/DQo+ID4gPg0KPiA+DQo+ID4gTm8sIHdoZW4gSnVsaWVuIGFuZCBJIGRp
c2N1c3NlZCB0aGlzIGluIGxhc3QgdmVyc2lvblsxXSwgd2UgaGFkbid0DQo+IHRob3VnaHQNCj4g
PiBzbyBkZWVwbHkuIFdlIGp1c3QgdGhvdWdodCBhIG1lbW9yeSByYW5nZSBkZXNjcmliZWQgaW4g
RFQgY2Fubm90IGJlDQo+IHNwbGl0DQo+ID4gYWNyb3NzIG11bHRpcGxlIG5vZGVzLiBTbyBOUl9N
RU1fQkFOS1Mgc2hvdWxkIGJlIGVxdWFsIHRvIE5SX01FTV9CQU5LUy4NCj4gPg0KPiA+IGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0NCj4g
MDgvbXNnMDA5NzQuaHRtbA0KPiA+DQo+ID4gPiBJIGFtIGFza2luZyBiZWNhdXNlIE5SX01FTV9C
QU5LUyBpcyAxMjggYW5kDQo+ID4gPiBOUl9OT0RFX01FTUJMS1M9MipNQVhfTlVNTk9ERVMgd2hp
Y2ggaXMgNjQgYnkgZGVmYXVsdCBzbyBhZ2Fpbg0KPiA+ID4gTlJfTk9ERV9NRU1CTEtTIGlzIDEy
OCBiZWZvcmUgdGhpcyBwYXRjaC4NCj4gPiA+DQo+ID4gPiBJbiBvdGhlciB3b3JkcywgdGhpcyBw
YXRjaCBhbG9uZSBkb2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2U7IGF0IGxlYXN0DQo+ID4gPiBk
b2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2UgdW5sZXNzIENPTkZJR19OUl9OVU1BX05PREVTIGlz
IGluY3JlYXNlZC4NCj4gPiA+DQo+ID4gPiBTbywgaXMgdGhlIGdvYWwgdG8gcmVkdWNlIG1lbW9y
eSB1c2FnZSB3aGVuIENPTkZJR19OUl9OVU1BX05PREVTIGlzDQo+ID4gPiBoaWdoZXIgdGhhbiA2
ND8NCj4gPiA+DQo+ID4NCj4gPiBJIGFsc28gdGhvdWdodCBhYm91dCB0aGlzIHByb2JsZW0gd2hl
biBJIHdhcyB3cml0aW5nIHRoaXMgcGF0Y2guDQo+ID4gQ09ORklHX05SX05VTUFfTk9ERVMgaXMg
aW5jcmVhc2luZywgYnV0IE5SX01FTV9CQU5LUyBpcyBhIGZpeGVkDQo+ID4gdmFsdWUsIHRoZW4g
TlJfTUVNX0JBTktTIGNhbiBiZSBzbWFsbGVyIHRoYW4gQ09ORklHX05SX05VTUFfTk9ERVMNCj4g
PiBhdCBvbmUgcG9pbnQuDQo+ID4NCj4gPiBCdXQgSSBhZ3JlZSB3aXRoIEp1bGllbidzIHN1Z2dl
c3Rpb24sIE5SX01FTV9CQU5LUyBhbmQgTlJfTk9ERV9NRU1CTEtTDQo+ID4gbXVzdCBiZSBhd2Fy
ZSBvZiBlYWNoIG90aGVyLiBJIGhhZCB0aG91Z2h0IHRvIGFkZCBzb21lIEFTU0VSVCBjaGVjaywN
Cj4gPiBidXQgSSBkb24ndCBrbm93IGhvdyB0byBkbyBpdCBiZXR0ZXIuIFNvIEkgcG9zdCB0aGlz
IHBhdGNoIGZvciBtb3JlDQo+ID4gc3VnZ2VzdGlvbi4NCj4gDQo+IE9LLiBJbiB0aGF0IGNhc2Ug
SSdkIHNheSB0byBnZXQgcmlkIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0aW9uIG9mDQo+IE5SX05P
REVfTUVNQkxLUyBhcyBpdCBpcyBwcm9iYWJseSBub3QgbmVjZXNzYXJ5LCBzZWUgYmVsb3cuDQo+
IA0KPiANCj4gDQo+ID4gPg0KPiA+ID4gPiBBbmQga2VlcCBkZWZhdWx0IE5SX05PREVfTUVNQkxL
UyBpbiBjb21tb24gaGVhZGVyDQo+ID4gPiA+IGZvciB0aG9zZSBhcmNoaXRlY3R1cmVzIE5VTUEg
aXMgZGlzYWJsZWQuDQo+ID4gPg0KPiA+ID4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vdCBhY2N1
cmF0ZTogb24geDg2IE5VTUEgaXMgZW5hYmxlZCBhbmQNCj4gPiA+IE5SX05PREVfTUVNQkxLUyBp
cyBzdGlsbCBkZWZpbmVkIGluIHhlbi9pbmNsdWRlL3hlbi9udW1hLmggKHRoZXJlIGlzDQo+IG5v
DQo+ID4gPiB4ODYgZGVmaW5pdGlvbiBvZiBpdCkNCj4gPiA+DQo+ID4NCj4gPiBZZXMuDQo+ID4N
Cj4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29t
Pg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgOCAr
KysrKysrLQ0KPiA+ID4gPiAgeGVuL2luY2x1ZGUveGVuL251bWEuaCAgICAgfCAyICsrDQo+ID4g
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+
ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggYi94
ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+ID4gPiBpbmRleCA4ZjFjNjdlM2ViLi4yMTU2
OWU2MzRiIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0K
PiA+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+ID4gPiBAQCAtMyw5
ICszLDE1IEBADQo+ID4gPiA+DQo+ID4gPiA+ICAjaW5jbHVkZSA8eGVuL21tLmg+DQo+ID4gPiA+
DQo+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+ID4gPiA+ICsNCj4gPiA+ID4gIHR5
cGVkZWYgdTggbm9kZWlkX3Q7DQo+ID4gPiA+DQo+ID4gPiA+IC0jaWZuZGVmIENPTkZJR19OVU1B
DQo+ID4gPiA+ICsjaWZkZWYgQ09ORklHX05VTUENCj4gPiA+ID4gKw0KPiA+ID4gPiArI2RlZmlu
ZSBOUl9OT0RFX01FTUJMS1MgTlJfTUVNX0JBTktTDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyNlbHNl
DQo+ID4gPiA+DQo+ID4gPiA+ICAvKiBGYWtlIG9uZSBub2RlIGZvciBub3cuIFNlZSBhbHNvIG5v
ZGVfb25saW5lX21hcC4gKi8NCj4gPiA+ID4gICNkZWZpbmUgY3B1X3RvX25vZGUoY3B1KSAwDQo+
ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oIGIveGVuL2luY2x1ZGUv
eGVuL251bWEuaA0KPiA+ID4gPiBpbmRleCAxOTc4ZTJiZTFiLi4xNzMxZTFjYzZiIDEwMDY0NA0K
PiA+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9udW1hLmgNCj4gPiA+ID4gQEAgLTEyLDcgKzEyLDkgQEANCj4gPiA+ID4gICNk
ZWZpbmUgTUFYX05VTU5PREVTICAgIDENCj4gPiA+ID4gICNlbmRpZg0KPiA+ID4gPg0KPiA+ID4g
PiArI2lmbmRlZiBOUl9OT0RFX01FTUJMS1MNCj4gPiA+ID4gICNkZWZpbmUgTlJfTk9ERV9NRU1C
TEtTIChNQVhfTlVNTk9ERVMqMikNCj4gPiA+ID4gKyNlbmRpZg0KPiANCj4gVGhpcyBvbmUgd2Ug
Y2FuIHJlbW92ZSBpdCBjb21wbGV0ZWx5IHJpZ2h0Pw0KDQpIb3cgYWJvdXQgZGVmaW5lIE5SX01F
TV9CQU5LUyB0bzoNCiNpZmRlZiBDT05GSUdfTlJfTlVNQV9OT0RFUw0KI2RlZmluZSBOUl9NRU1f
QkFOS1MgKENPTkZJR19OUl9OVU1BX05PREVTICogMikNCiNlbHNlDQojZGVmaW5lIE5SX01FTV9C
QU5LUyAxMjgNCiNlbmRpZg0KZm9yIGJvdGggeDg2IGFuZCBBcm0uIEZvciB0aG9zZSBhcmNoaXRl
Y3R1cmVzIGRvIG5vdCBzdXBwb3J0IG9yIGVuYWJsZQ0KTlVNQSwgdGhleSBjYW4gc3RpbGwgdXNl
ICJOUl9NRU1fQkFOS1MgMTI4Ii4gQW5kIHJlcGxhY2UgYWxsIE5SX05PREVfTUVNQkxLUw0KaW4g
TlVNQSBjb2RlIHRvIE5SX01FTV9CQU5LUyB0byByZW1vdmUgTlJfTk9ERV9NRU1CTEtTIGNvbXBs
ZXRlbHkuDQpJbiB0aGlzIGNhc2UsIE5SX01FTV9CQU5LUyBjYW4gYmUgYXdhcmUgb2YgdGhlIGNo
YW5nZXMgb2YgQ09ORklHX05SX05VTUFfTk9ERVMuDQoNCg0KDQoNCg==

