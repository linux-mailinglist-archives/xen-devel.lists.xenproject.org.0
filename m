Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C25493505
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 07:34:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258718.445892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA4Xx-0006Ns-Q0; Wed, 19 Jan 2022 06:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258718.445892; Wed, 19 Jan 2022 06:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA4Xx-0006Kp-M6; Wed, 19 Jan 2022 06:34:17 +0000
Received: by outflank-mailman (input) for mailman id 258718;
 Wed, 19 Jan 2022 06:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CaTf=SD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nA4Xw-0006KT-DH
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 06:34:16 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1821cfa-78f1-11ec-9bbc-9dff3e4ee8c5;
 Wed, 19 Jan 2022 07:34:15 +0100 (CET)
Received: from DB7PR05CA0053.eurprd05.prod.outlook.com (2603:10a6:10:2e::30)
 by DB7PR08MB3114.eurprd08.prod.outlook.com (2603:10a6:5:1b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Wed, 19 Jan
 2022 06:34:07 +0000
Received: from DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::30) by DB7PR05CA0053.outlook.office365.com
 (2603:10a6:10:2e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Wed, 19 Jan 2022 06:34:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT009.mail.protection.outlook.com (10.152.20.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 06:34:07 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 19 Jan 2022 06:34:07 +0000
Received: from 11f1ef9620da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23D8AF84-32CD-483F-BB6B-E60A44FA8448.1; 
 Wed, 19 Jan 2022 06:34:01 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11f1ef9620da.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 06:34:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VE1PR08MB4975.eurprd08.prod.outlook.com (2603:10a6:803:10d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 06:33:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 06:33:58 +0000
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
X-Inumbo-ID: d1821cfa-78f1-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axrDoozhRsWwFXPY+RsC9c2DcNVIDRbpT9/kt++voIM=;
 b=NFc29Fpmx5DHvbsKejYuNWOjaHcwLiFLBYMP8+c7pYCpk5n2SQP9PZn9aeAfNF7BBGoiLZQ6jH2E8jjvJL9GKPwEiKMuvoLnuJXTbs7c06UdCI5UgsyvaS3bXvMwHESaKY+RiC8PurAmPMp9dx1U5QTiDHd/xNyw58uiOXz30xo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIccQifoY6xYbE1Wv7non/RGhXxkdKCptTVE8fJzrczMnrq4+em3p7Q2K5YRYCvxWIIiTHIWoSqtRPdf5m45WL+lq9vhDId6JslZaDJ/WEoCnLxO1mzFQX0vxSZHUyJrzSaHuDP04i6tqFenfddqJ8bLi6yv/llRxeC1UktvSQ0dplXLRfh2ybGeAzZWgXnhrCs1V5zLCp1a4Y/qbeFtGwgzSlvNu17QzJI2x3N8uGG3/qyjqsbweKhAUxirWzWEFGP37MgMODmh67EV7pATSegq57bN/XFLm+EJZIK3i95W0pt5cbqhvqLGPF/qLicjNcS63TZPiZgqBrYjsP5CJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axrDoozhRsWwFXPY+RsC9c2DcNVIDRbpT9/kt++voIM=;
 b=nlVy+fBn+GH98E372dlzan/jmsk36CcI0G5SbmCr7D9qqhOSMgFYTfPvGeTemWO461wExdCX1xghxo9rAbUke+L3GBjlH57ZojUHlfKe90Z5bTQWm2F38r74PfktAg2XW4MXwuhPQv7AAYX/q/hk9JRuMS82B9WmNdw42PELgVfTXJeE9vqD5+jrYSEV4oS6bCN1Y9xMos4kDkqBmr1gcFJrKUK5+57iicmO9ERPWKaMzC8Mump9kDxpLkH4HkHHJk2d1d9hBf1Fk3j88CNx2Cv878r2vTuPFoGIpsbt4aBfgccuJ/0QzUvccrIGuqzj/g+dWf3zFPx4JXnWgz50sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axrDoozhRsWwFXPY+RsC9c2DcNVIDRbpT9/kt++voIM=;
 b=NFc29Fpmx5DHvbsKejYuNWOjaHcwLiFLBYMP8+c7pYCpk5n2SQP9PZn9aeAfNF7BBGoiLZQ6jH2E8jjvJL9GKPwEiKMuvoLnuJXTbs7c06UdCI5UgsyvaS3bXvMwHESaKY+RiC8PurAmPMp9dx1U5QTiDHd/xNyw58uiOXz30xo=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
Thread-Topic: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node
 structure
Thread-Index: AQHXsHMRNGZeupZbtEeYycYXK8HrbKxpnZqAgAD0aqA=
Date: Wed, 19 Jan 2022 06:33:58 +0000
Message-ID:
 <PAXPR08MB7420654893AFC5E9941C398A9E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-8-wei.chen@arm.com>
 <a1d96556-5da4-0c73-0d87-f24758866d7d@suse.com>
In-Reply-To: <a1d96556-5da4-0c73-0d87-f24758866d7d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7B009E28DEC3224CA61A94088790E2D6.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1dffafb5-c36d-4c68-338e-08d9db15b1e7
x-ms-traffictypediagnostic:
	VE1PR08MB4975:EE_|DB5EUR03FT009:EE_|DB7PR08MB3114:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB311429922EEEE063E46CC2069E599@DB7PR08MB3114.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KRlgN5MDk/RKCHwESetL1gUtYpJKm5UtZaWCjeSnxLRrxraWHf0kcZZpByukFq6cW4re+Ws8md6/Xx2+t9TXom1ETPk5VJzo6OHAHk3r+CT7lX/YyeAj4WNZxkbPhvzdQw1CE8J8jLjWmhfb3h9A1kXED8YGtahCxP2qcHS17rn5E0nctjceA6J04+/2yaU5WcLHsDzY+dijFdRTHlJZuwxI0fLFJ+HkVPzjB49ZlTCJicgrF7sx+uLTW973DGCX2HYZNGQv2lh2tT8Frb8im1BijEhuYunxN4HWeN/e7/umBBw656i3yDXzHuw12thQTVD1try9mSy9ihp6tU38yewop7DDS3COS4qWqsPXcNPuwwesJIKTm6GbFvBiIM6r9pMt77Z8Xma6jgGusLCQ59DQ5x6FCf3LYA/gWN8g/wGa3vqEJ5nBvdv39ZG09OU8f5VAt/QH8H10bxtMKScJEB89wKd4+ifclrQuCNw0d/WhbyWQf+T7EgVrEqkD7Sw1T2YM8S95kdcFasczXqSVckZkoERr26CrWQ+m5qMevMm2llSLHFv6I52Hvj3ZVI9uqqYyM5x5/ij51JZ4fLQUzhWn8rhplXGyyJkXjJ1VuTrdJm71yl4iLNjlLn97+zgf1PZrhqSGajUd54Fz+6suVf90a7G9sQgvik6FmK5wB8QUXFKoXQ+fqh4m2lN+V6DaZzNlze1GeE8c5GVv6fZ/eA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(8676002)(9686003)(54906003)(33656002)(53546011)(55016003)(5660300002)(26005)(86362001)(6916009)(71200400001)(2906002)(38100700002)(66946007)(83380400001)(316002)(66446008)(186003)(4326008)(508600001)(52536014)(8936002)(76116006)(38070700005)(66556008)(122000001)(66476007)(6506007)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4975
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99603d2c-e6cf-4e83-a748-08d9db15ac7f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/O4WOyONDAo8HVdvZkoStgIq10kGLrXxLlxdRM8iPrMnWgToytKPaXSQ6yLABpi3Q7nvv5HZeQdB32TYCThm3cPP1KGnRmX9gjuccW5Ra3+4oPBUS2ukfr8XrjjVArnMipUz/Qrwn+cMRqaosRyJyGwHgfydLMvmt15Foc4GwLSrHIVkXaSWSOXO+C4FHTwohl3A9d0+sJfmrXW9hHN+A/ErNrz28s4jeJgxm2SKtAk4Xy6pvDNcSac7Vf+iOJ7Yz7E0MdkQUVODoRlkdRCtxCOIwtRq988Siz8//DEFoqNxcYQ1mC3eOXKYvvFjIQbfW24i5MQ4NjHWkKPSfq85G5erstO4LLdoHBJHCjVxA4rHR/14/nn0zt8NVQCH3WkEvFTqBdpEZrPtMVxiEAtncZmgEb0R0CfINyhYs0/ytsoZunoDd/V9uaCoV14irXUgAqaTWQKgZYpEmT1UAkFEjbWlOWTGjCOGGN1ZVf3dG4Rkvsw8wwcJhiB7pnLIgJ+kMuoRUMP4B5ESSXhfzwb7wl2Lgq4/A+MXg2Bdhj1lGqUtRrykGDL9SKV+pe3FLkQSlE7H/x3ywN55IBg2rsO6urWD9kyKkCmlbByw+sUMtX8aLbdE1axMAoFSUh5wJ50rWZFuoIX68RfUsym230yjE7+1X5HjJkVrWg3MWqoCPbXtjNWJrUMEedIT2+5pLnA2phuB44TrMOcVZ6hZ9sHaMrxPTf7p1fQK+b7haXBGUpAehT836KwP8K9VLI3v5H6Rd/pfvZWw0q9FKT10L53tw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(40470700002)(36840700001)(8676002)(54906003)(86362001)(2906002)(47076005)(336012)(6506007)(33656002)(8936002)(316002)(7696005)(40460700001)(53546011)(26005)(186003)(55016003)(52536014)(6862004)(508600001)(82310400004)(9686003)(81166007)(70586007)(70206006)(4326008)(83380400001)(5660300002)(36860700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 06:34:07.5151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dffafb5-c36d-4c68-338e-08d9db15b1e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3114

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOOaXpSAyMzoyMw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA3LzM3XSB4ZW4veDg2OiB1c2UgcGFkZHJfdCBmb3IgYWRkcmVzc2VzIGlu
IE5VTUEgbm9kZQ0KPiBzdHJ1Y3R1cmUNCj4gDQo+IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBD
aGVuIHdyb3RlOg0KPiA+IEBAIC0yMDEsMTEgKzIwMSwxMiBAQCB2b2lkIF9faW5pdCBudW1hX2lu
aXRfYXJyYXkodm9pZCkNCj4gPiAgc3RhdGljIGludCBudW1hX2Zha2UgX19pbml0ZGF0YSA9IDA7
DQo+ID4NCj4gPiAgLyogTnVtYSBlbXVsYXRpb24gKi8NCj4gPiAtc3RhdGljIGludCBfX2luaXQg
bnVtYV9lbXVsYXRpb24odTY0IHN0YXJ0X3BmbiwgdTY0IGVuZF9wZm4pDQo+ID4gK3N0YXRpYyBp
bnQgX19pbml0IG51bWFfZW11bGF0aW9uKHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLA0KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm4pDQo+
ID4gIHsNCj4gPiAgICAgIGludCBpOw0KPiA+ICAgICAgc3RydWN0IG5vZGUgbm9kZXNbTUFYX05V
TU5PREVTXTsNCj4gPiAtICAgIHU2NCBzeiA9ICgoZW5kX3BmbiAtIHN0YXJ0X3Bmbik8PFBBR0Vf
U0hJRlQpIC8gbnVtYV9mYWtlOw0KPiA+ICsgICAgdTY0IHN6ID0gcGZuX3RvX3BhZGRyKGVuZF9w
Zm4gLSBzdGFydF9wZm4pIC8gbnVtYV9mYWtlOw0KPiANCj4gTml0OiBQbGVhc2UgY29udmVydCB0
byB1aW50NjRfdCAoYW5kIGFsaWtlKSB3aGVuZXZlciB5b3UgdG91Y2ggYSBsaW5lDQo+IGFueXdh
eSB0aGF0IHVzZXMgYmVpbmctcGhhc2VkLW91dCB0eXBlcy4NCj4gDQoNCk9rLCBJIHdpbGwgZG8g
aXQuDQoNCj4gPiBAQCAtMjQ5LDI0ICsyNTAsMjYgQEAgc3RhdGljIGludCBfX2luaXQgbnVtYV9l
bXVsYXRpb24odTY0IHN0YXJ0X3BmbiwNCj4gdTY0IGVuZF9wZm4pDQo+ID4gIHZvaWQgX19pbml0
IG51bWFfaW5pdG1lbV9pbml0KHVuc2lnbmVkIGxvbmcgc3RhcnRfcGZuLCB1bnNpZ25lZCBsb25n
DQo+IGVuZF9wZm4pDQo+ID4gIHsNCj4gPiAgICAgIGludCBpOw0KPiA+ICsgICAgcGFkZHJfdCBz
dGFydCwgZW5kOw0KPiA+DQo+ID4gICNpZmRlZiBDT05GSUdfTlVNQV9FTVUNCj4gPiAgICAgIGlm
ICggbnVtYV9mYWtlICYmICFudW1hX2VtdWxhdGlvbihzdGFydF9wZm4sIGVuZF9wZm4pICkNCj4g
PiAgICAgICAgICByZXR1cm47DQo+ID4gICNlbmRpZg0KPiA+DQo+ID4gKyAgICBzdGFydCA9IHBm
bl90b19wYWRkcihzdGFydF9wZm4pOw0KPiA+ICsgICAgZW5kID0gcGZuX3RvX3BhZGRyKGVuZF9w
Zm4pOw0KPiANCj4gTml0OiBXb3VsZCBiZSBzbGlnaHRseSBuZWF0ZXIgaWYgdGhlc2Ugd2VyZSB0
aGUgaW5pdGlhbGl6ZXJzIG9mIHRoZQ0KPiB2YXJpYWJsZXMuDQoNCkJ1dCBpZiB0aGlzIGZ1bmN0
aW9uIHJldHVybnMgaW4gbnVtYV9mYWtlICYmICFudW1hX2VtdWxhdGlvbiwNCndpbGwgdGhlIHR3
byBwZm5fdG9fcGFkZHIgb3BlcmF0aW9ucyBiZSB3YXN0ZT8NCg0KPiANCj4gPiAgI2lmZGVmIENP
TkZJR19BQ1BJX05VTUENCj4gPiAtICAgIGlmICggIW51bWFfb2ZmICYmICFhY3BpX3NjYW5fbm9k
ZXMoKHU2NClzdGFydF9wZm4gPDwgUEFHRV9TSElGVCwNCj4gPiAtICAgICAgICAgKHU2NCllbmRf
cGZuIDw8IFBBR0VfU0hJRlQpICkNCj4gPiArICAgIGlmICggIW51bWFfb2ZmICYmICFhY3BpX3Nj
YW5fbm9kZXMoc3RhcnQsIGVuZCkgKQ0KPiA+ICAgICAgICAgIHJldHVybjsNCj4gPiAgI2VuZGlm
DQo+ID4NCj4gPiAgICAgIHByaW50ayhLRVJOX0lORk8gIiVzXG4iLA0KPiA+ICAgICAgICAgICAg
IG51bWFfb2ZmID8gIk5VTUEgdHVybmVkIG9mZiIgOiAiTm8gTlVNQSBjb25maWd1cmF0aW9uDQo+
IGZvdW5kIik7DQo+ID4NCj4gPiAtICAgIHByaW50ayhLRVJOX0lORk8gIkZha2luZyBhIG5vZGUg
YXQgJTAxNiJQUkl4NjQiLSUwMTYiUFJJeDY0IlxuIiwNCj4gPiAtICAgICAgICAgICAodTY0KXN0
YXJ0X3BmbiA8PCBQQUdFX1NISUZULA0KPiA+IC0gICAgICAgICAgICh1NjQpZW5kX3BmbiA8PCBQ
QUdFX1NISUZUKTsNCj4gPiArICAgIHByaW50ayhLRVJOX0lORk8gIkZha2luZyBhIG5vZGUgYXQg
JTAxNiJQUklwYWRkciItJTAxNiJQUklwYWRkciJcbiIsDQo+ID4gKyAgICAgICAgICAgc3RhcnQs
IGVuZCk7DQo+IA0KPiBXaGVuIHN3aXRjaGluZyB0byBQUklwYWRkciBJIHN1cHBvc2UgeW91IGRp
ZCBsb29rIHVwIHdoYXQgdGhhdCBvbmUNCj4gZXhwYW5kcyB0bz8gSU9XIC0gcGxlYXNlIGRyb3Ag
dGhlIDAxNiBmcm9tIGhlcmUuDQoNCk9oLCB5ZXMsIEkgZm9yZ290IHRvIGRyb3AgdGhlIGR1cGxp
Y2F0ZWQgMDE2LiBJIHdvdWxkIGRvIGl0Lg0KDQo+IA0KPiA+IEBAIC00NDEsNyArNDQxLDcgQEAg
dm9pZCBfX2luaXQgc3JhdF9wYXJzZV9yZWdpb25zKHU2NCBhZGRyKQ0KPiA+ICAJICAgIGFjcGlf
dGFibGVfcGFyc2UoQUNQSV9TSUdfU1JBVCwgYWNwaV9wYXJzZV9zcmF0KSkNCj4gPiAgCQlyZXR1
cm47DQo+ID4NCj4gPiAtCXNyYXRfcmVnaW9uX21hc2sgPSBwZHhfaW5pdF9tYXNrKGFkZHIpOw0K
PiA+ICsJc3JhdF9yZWdpb25fbWFzayA9IHBkeF9pbml0X21hc2soKHU2NClhZGRyKTsNCj4gDQo+
IEkgZG9uJ3Qgc2VlIHRoZSBuZWVkIGZvciBhIGNhc3QgaGVyZS4NCj4gDQoNCmN1cnJlbnQgYWRk
ciB0eXBlIGhhcyBiZWVuIGNoYW5nZWQgdG8gcGFkZHJfdCwgYnV0IHBkeF9pbml0X21hc2sNCmFj
Y2VwdCBwYXJhbWV0ZXIgdHlwZSBpcyB1NjQuIEkga25vdyBwYWRkcl90IGlzIGEgdHlwZWRlZiBv
Zg0KdTY0IG9uIEFybTY0LzMyLCBvciB1bnNpbmdlZCBsb25nIG9uIHg4Ni4gSW4gY3VycmVudCBz
dGFnZSwNCnRoZWlyIG1hY2hpbmUgYnl0ZS1sZW5ndGhzIGFyZSB0aGUgc2FtZS4gQnV0IGluIGNh
c2Ugb2YgZnV0dXJlDQpjaGFuZ2VzIEkgdGhpbmsgYW4gZXhwbGljaXQgY2FzZSBoZXJlIG1heWJl
IGJldHRlcj8gDQoNCj4gPiBAQCAtNDg5LDcgKzQ4OSw3IEBAIGludCBfX2luaXQgYWNwaV9zY2Fu
X25vZGVzKHU2NCBzdGFydCwgdTY0IGVuZCkNCj4gPiAgCS8qIEZpbmFsbHkgcmVnaXN0ZXIgbm9k
ZXMgKi8NCj4gPiAgCWZvcl9lYWNoX25vZGVfbWFzayhpLCBhbGxfbm9kZXNfcGFyc2VkKQ0KPiA+
ICAJew0KPiA+IC0JCXU2NCBzaXplID0gbm9kZXNbaV0uZW5kIC0gbm9kZXNbaV0uc3RhcnQ7DQo+
ID4gKwkJcGFkZHJfdCBzaXplID0gbm9kZXNbaV0uZW5kIC0gbm9kZXNbaV0uc3RhcnQ7DQo+ID4g
IAkJaWYgKCBzaXplID09IDAgKQ0KPiANCj4gUGxlYXNlIHRha2UgdGhlIG9wcG9ydHVuaXR5IGFu
ZCBhZGQgdGhlIG1pc3NpbmcgYmxhbmsgbGluZSBiZXR3ZWVuDQo+IGRlY2xhcmF0aW9ucyBhbmQg
c3RhdGVtZW50cy4NCj4gDQoNCk9rDQoNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L251
bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbnVtYS5oDQo+ID4gQEAgLTE2LDcg
KzE2LDcgQEAgZXh0ZXJuIGNwdW1hc2tfdCAgICAgbm9kZV90b19jcHVtYXNrW107DQo+ID4gICNk
ZWZpbmUgbm9kZV90b19jcHVtYXNrKG5vZGUpICAgIChub2RlX3RvX2NwdW1hc2tbbm9kZV0pDQo+
ID4NCj4gPiAgc3RydWN0IG5vZGUgew0KPiA+IC0JdTY0IHN0YXJ0LGVuZDsNCj4gPiArCXBhZGRy
X3Qgc3RhcnQsZW5kOw0KPiANCj4gUGxlYXNlIHRha2UgdGhlIG9wcG9ydHVuaXR5IGFuZCBhZGQg
dGhlIG1pc3NpbmcgYmxhbmsgYWZ0ZXIgdGhlIGNvbW1hLg0KPiANCg0KT2sNCg0KPiBKYW4NCg0K

