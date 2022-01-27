Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B817B49DCA9
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261313.452299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0II-0002Dv-LP; Thu, 27 Jan 2022 08:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261313.452299; Thu, 27 Jan 2022 08:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD0II-0002BL-Hl; Thu, 27 Jan 2022 08:38:14 +0000
Received: by outflank-mailman (input) for mailman id 261313;
 Thu, 27 Jan 2022 08:38:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nD0IH-0001Z1-0I
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:38:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75f579a4-7f4c-11ec-8eb8-a37418f5ba1a;
 Thu, 27 Jan 2022 09:38:12 +0100 (CET)
Received: from AS8PR04CA0100.eurprd04.prod.outlook.com (2603:10a6:20b:31e::15)
 by VI1PR08MB4061.eurprd08.prod.outlook.com (2603:10a6:803:e7::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 08:38:09 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::89) by AS8PR04CA0100.outlook.office365.com
 (2603:10a6:20b:31e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 08:38:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:38:09 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 27 Jan 2022 08:38:09 +0000
Received: from a90e437a0a03.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 36708814-1695-4396-9234-11130ABB1756.1; 
 Thu, 27 Jan 2022 08:37:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a90e437a0a03.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:37:58 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR08MB4509.eurprd08.prod.outlook.com (2603:10a6:803:f2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Thu, 27 Jan
 2022 08:37:55 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:37:55 +0000
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
X-Inumbo-ID: 75f579a4-7f4c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffCIXkpnW1uuM+j8VKF6KFjEz58l8eDshhdQpFdWj78=;
 b=QkfitdXyF1snFNrnrzgx8I4+6Mj0Woy3zziBcFQVmpCDPbD5iwcBuCpY3NMO6BK+4mbropKY+WXZmhTojWYCFECybUbu+AZq1nzmt2qY5pHk/7fjIflz8WwutkIRtQ8eLYVE6VFyMud9yPee32CWV6WaODOEiAF5Ub+jxjDHnIw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UIEdu8CPPnvPPfISBT3OU9ty5hqqWeiyDsu3DXS+IeDhjt3k/MXnma6O0jns18DVxbSz0xnXIV9X/6HO53NIokjKz1Rb7H5yisNRDWhNFz1o+oALItmXycWP1WLuyxWpEggCF+V7yAvf4oPnsTk5up6RS7dbhKdC2rB1HVT9D/dqr8Vy5CUfbI4r9S7Ub1vvM3wqgeMjug/h1ie3E2w+R5fqRVnEeXWGKaEsSFPe5bt9x07R9a3CYaZmkteC/ErK/odalpvchtUk34HaPhGTw5KrVyk6PYrdsYaZXsrSceZahZ2TxHnai2HzDh8zO/XvtWr2UmLB9kmgI7ZRo1DHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffCIXkpnW1uuM+j8VKF6KFjEz58l8eDshhdQpFdWj78=;
 b=VPNkNsMiRKXXx57NWpkxsq6JN2NPho4EJ21D8SkpvwbvFxk8MgYejHWkJ5WvxFVuOWejvkWP0vp+6BSQca0z+pZOBcgw50qDl+Gr8yt2zrm4bQLXO7iEmWR8OP4K+qd0fkpH3ZubLzglM69HGPpXVK7vZu48TX6HoTVgvs52MV9DFdA0nLR3Cff/mqa4goBaF1Uaa5bUAARziu27B4sRdA/SvRiCrgb5BB42vPr0+79YEEr6R/9RLdpCazOpo9nn31x0D9fxEvglr29uqR1KOrvWnAsocbOnlnpd7dzoMfiBoXJUwZIEOyQH4k3QBeAxa3e4aDLnenbgOr9tYcyBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffCIXkpnW1uuM+j8VKF6KFjEz58l8eDshhdQpFdWj78=;
 b=QkfitdXyF1snFNrnrzgx8I4+6Mj0Woy3zziBcFQVmpCDPbD5iwcBuCpY3NMO6BK+4mbropKY+WXZmhTojWYCFECybUbu+AZq1nzmt2qY5pHk/7fjIflz8WwutkIRtQ8eLYVE6VFyMud9yPee32CWV6WaODOEiAF5Ub+jxjDHnIw=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 17/37] xen/x86: use CONFIG_NUMA to gate numa_scan_nodes
Thread-Topic: [PATCH 17/37] xen/x86: use CONFIG_NUMA to gate numa_scan_nodes
Thread-Index: AQHXsHMdGsr4qfVkUkOsqMTqurczg6x0SxEAgAMGQfA=
Date: Thu, 27 Jan 2022 08:37:54 +0000
Message-ID:
 <PAXPR08MB7420774EDB08DB59ADE3B6589E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-18-wei.chen@arm.com>
 <e862e6c2-8e3f-3cdd-88ce-127dd65b6255@suse.com>
In-Reply-To: <e862e6c2-8e3f-3cdd-88ce-127dd65b6255@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0C94D0CD2EF68A4AA7CA60B06189B1E2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cbc29466-93e4-47f4-5729-08d9e17058e1
x-ms-traffictypediagnostic:
	VI1PR08MB4509:EE_|AM5EUR03FT046:EE_|VI1PR08MB4061:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4061BC6A30EDA38B478DF1CF9E219@VI1PR08MB4061.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7wuDicT2PVIkhskMz3NLKiZV5RrIPcTuVtYogN/AM9Q3nXxIZqF0JOOUJl3FKMrY9Kcpj5rSapSw9Bc99VfzV1i5HSlWlgvKY9wgA3Gq+f5AIbmBKhjn1Lgn+x2wy+xFSxdoKSxB5ZNuD7aHbp890YeSiYgOcmTNKs0+go6794KtglyPNxBGYK2wxgAuUg9CMOstuijCux+od9cstT0xM3EFd8DjZNKVGLBCUVEV7lg1LRgJFN3sqdbp4jd2QPxOqgZtNmVr821rL7IWUIA6Ry1AKv1geGjV2DImTbkxI0+S5SIXpbPFUkpbHQZ5eJaYFgSnG3Mcu7+9sPlR8w+AFRS0EY4t5t1LAr4MFauKQ3aBh4l9zOZL8u5Ln10lpIOhF9MTmONDGvjI0ABd45UYUS1eXuEvpy0P7vtKAHQ80k9TNG2OMrbRQJm4FTpO8HBmXcHjtdnA2mCSrlZ+UGGnmLYCQYHB+qeov4AxE5VjA9c+m6m1PHSnYLahlr6EHTifMSXMLFo+T/ibc78T9QVjKjZaJH90biPp4d7iiyHUmiktsolLhByUANW1iZznkKUPMl8KdeRXUZuNws2MvwFUHVa/ujbFWYMN/yYSS1u3RmUsSduJ1hXa8+bCrHrh9WO8WeAjYLJFUo4hGOcik27I6TpP4svSf2DSn/RkcRC5Dk+zbyXp6zwbgYDkLRyxn/QHp6ZIO93mMfP+RFvOzR+Z5A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(7696005)(508600001)(2906002)(26005)(8936002)(71200400001)(52536014)(9686003)(66556008)(64756008)(33656002)(6916009)(186003)(5660300002)(6506007)(66476007)(54906003)(86362001)(38070700005)(8676002)(55016003)(83380400001)(53546011)(66946007)(316002)(4326008)(66446008)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4509
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c4d51f23-3e4f-4e1d-4707-08d9e170507b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rFxJhooVRhNE09NbBhMuMzqzIsTKnpd9hYS9296069Kqg7wX10/SJxsho6x8rnvofkrk/vGhRUUR+1wPyNYDrrIZbIZqQWfvQpsFSQz7FNSOgzIIMgjA3Ju+0R9uezFeuWmWnxCFWqrlQlNMMRltsqpVoSPW5ikGciGuE/LAujQ5MKyOg3Yo1VOAZC5PIrxR/6L/x2pahEFqrMJHdk+Uimw2y2lN9uWDClHa44qUesM4YfXeiWnJ0kO5IM05aYU9UiQbJ2ha8dQ/xm1eKbRr9Y2jvy58VTmGbQUF+ty2UaT7yvBhwcm+AjktYhMWwmvANP42m7J4v84oTcGwzwybGYbuwsk3NFvo9mPtuYneAPJfVOxlqMbKfypBHu3IpnpyJb482R/BT3VExAbPFEOf1XGh8RHdrebqd9QuDXVO5DaIthAnt/tue3y0E+mz1gqksF38Id0E/vuMmOe/Cwz3ZDhWpKGDk8UzYM9X3i1ihWYT29AKW5Gka5b7Hf/qVrjZ95hWHsb7BUJ8zMyfp1akxqNDcz+2fNt6gu7FQSBuCeGq1qLWv691Hb1Mm0liVC0I75e81dHy89ShWPguwPIdhUox0bsBfAq5wxsyX9Y2G92LXOe3+ytV4EhCfWhyKG5kAkcUVa2Jw2rjiv3t3o71v4BG3GFTgKK02sr3Vln3tzym2IlmUuAeWF1nRaYXfDeMFT9d+VHyOSCpalfmEeuVduir4aV3VKfuQfDnxAFGIrSSTR71w0IWTeM15yEHva5HBJYwMVP/7f975VyWIWq3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700004)(186003)(81166007)(26005)(8936002)(47076005)(7696005)(36860700001)(86362001)(8676002)(356005)(83380400001)(6506007)(70206006)(33656002)(70586007)(53546011)(5660300002)(82310400004)(54906003)(316002)(40460700003)(336012)(508600001)(6862004)(2906002)(4326008)(52536014)(9686003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:38:09.2821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc29466-93e4-47f4-5729-08d9e17058e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4061

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxODoyNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDE3LzM3XSB4ZW4veDg2OiB1c2UgQ09ORklHX05VTUEgdG8gZ2F0ZQ0KPiBu
dW1hX3NjYW5fbm9kZXMNCj4gDQo+IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVuIHdyb3Rl
Og0KPiA+IEFzIHdlIGhhdmUgdHVybmVkIG51bWFfc2Nhbl9ub2RlcyB0byBuZXV0cmFsIGZ1bmN0
aW9uLiBJZiB3ZQ0KPiA+IHN0aWxsIHVzZSBDT05GSUdfQUNQSV9OVU1BIGluIG51bWFfaW5pdG1l
bV9pbml0IHRvIGdhdGUNCj4gPiBudW1hX3NjYW5fbm9kZXMgdGhhdCBkb2Vzbid0IG1ha2Ugc2Vu
c2UuIEFzIENPTkZJR19BQ1BJX05VTUENCj4gPiB3aWxsIGJlIHNlbGVjdGVkIGJ5IENPTkZJR19O
VU1BIGZvciB4ODYuIFNvIGluIHRoaXMgcGF0Y2gsDQo+ID4gd2UgcmVwbGFjZSBDT05GSUdfQUNQ
SV9OVU1BIGJ5IENPTkZJR19OVU1BLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIENoZW4g
PHdlaS5jaGVuQGFybS5jb20+DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9udW1hLmMgfCAy
ICstDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9udW1hLmMgYi94ZW4vYXJjaC94ODYv
bnVtYS5jDQo+ID4gaW5kZXggOGE0NzEwZGYzOS4uNTA5ZDI3MzhjMCAxMDA2NDQNCj4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvbnVtYS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L251bWEuYw0KPiA+
IEBAIC0yNjAsNyArMjYwLDcgQEAgdm9pZCBfX2luaXQgbnVtYV9pbml0bWVtX2luaXQodW5zaWdu
ZWQgbG9uZw0KPiBzdGFydF9wZm4sIHVuc2lnbmVkIGxvbmcgZW5kX3BmbikNCj4gPiAgICAgIHN0
YXJ0ID0gcGZuX3RvX3BhZGRyKHN0YXJ0X3Bmbik7DQo+ID4gICAgICBlbmQgPSBwZm5fdG9fcGFk
ZHIoZW5kX3Bmbik7DQo+ID4NCj4gPiAtI2lmZGVmIENPTkZJR19BQ1BJX05VTUENCj4gPiArI2lm
ZGVmIENPTkZJR19OVU1BDQo+ID4gICAgICBpZiAoICFudW1hX29mZiAmJiAhbnVtYV9zY2FuX25v
ZGVzKHN0YXJ0LCBlbmQpICkNCj4gPiAgICAgICAgICByZXR1cm47DQo+ID4gICNlbmRpZg0KPiAN
Cj4gV2h5IGlzIHRoaXMgYSBzZXBhcmF0ZSBwYXRjaCwgcmF0aGVyIHRoYW4gcGFydCBvZiB0aGUg
b25lIHJlbmFtaW5nDQo+IHRoZSBmdW5jdGlvbj8NCg0KSSB3aWxsIG1lcmdlIHRoZXNlIHR3byBw
YXRjaGVzLg0KDQo+IA0KPiBKYW4NCg0K

