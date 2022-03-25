Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42B4E7520
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 15:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294802.501445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXl2p-00063Z-6m; Fri, 25 Mar 2022 14:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294802.501445; Fri, 25 Mar 2022 14:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXl2p-000616-3X; Fri, 25 Mar 2022 14:36:03 +0000
Received: by outflank-mailman (input) for mailman id 294802;
 Fri, 25 Mar 2022 14:36:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXl2n-000610-NQ
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 14:36:01 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c82654-ac48-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 15:36:01 +0100 (CET)
Received: from AM6P191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::20)
 by AM8PR08MB5617.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 14:35:48 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::de) by AM6P191CA0043.outlook.office365.com
 (2603:10a6:209:7f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18 via Frontend
 Transport; Fri, 25 Mar 2022 14:35:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 14:35:47 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Fri, 25 Mar 2022 14:35:47 +0000
Received: from 43d7e1c9a2f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97B7A767-8456-4529-858F-05931D91F917.1; 
 Fri, 25 Mar 2022 14:35:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43d7e1c9a2f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 14:35:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4647.eurprd08.prod.outlook.com (2603:10a6:10:f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 14:35:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 14:35:39 +0000
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
X-Inumbo-ID: e3c82654-ac48-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMsahgJoPgSUBzoOQKip4Nt31Wd5X598W91iqKan1rk=;
 b=6X5R14mh8avjkD02CinaUt7F0+fEkiFULFiopS24gjEQsR3SBZkfMqLE+vdNF8MtkQxHt+DD7Xp9YphkD048vcnhx46uQwZFQ3d4PqbeTA32X7XDGdulti+nIDPa0CiUpLloNW81+7RFKh+gdHlfE5CpNdC3mfDfWzh5cOeSZPQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f01c872413269bbc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntaPAXQjPKmp43sFpw0A3agh9V8IP7JzUZ73NhXThh+N0kJizsMnCFEy3GTZ5a6SVaXK2l83ocJ4EtCaFfBk4HkcCJXvxnwSvvuwdCi1Xsa8lyex1U6/7lRU7nyy98znVQO/XyY6VeXkOByMOfq2HdV32vnEoZR4vCzZM+jmjZR3BcnKw5cujGfe4rrvUw8KoEsdW6DlNimPECpGN8QjVepNee1RtDDy9P0kxOEwI2OyHrK63738dRgUr+N//KBhYhpeJFBgkihDwwJjoKruo2rsLmqh7t4s7fIfN/PJmgtl3WIBxY8jg5vL9Kw6ZVkmFxbGhYWuoFOFh5ik53fptA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMsahgJoPgSUBzoOQKip4Nt31Wd5X598W91iqKan1rk=;
 b=b99+CnMCOdbchPjFgeUgcRKCqoYQir9kgG86WGA7sULYbAHYLULvc5CYjNJucKEXNOep5bUa9cD9bOFp4ddDvALU9CFtDwZQGzgrkNU6Occg624uK5T1+EOhyNSu+chDG4cjhH6i7lLQ4S+APb0rCaAoprnF+csNlNuK4LCL0LRuOQ32WC4+KBFwK/bxvOWS74hP2vJ99mMvpXexc475DBACorFOQkCDocM3mUnL79dWGrX9bWgjL3gDVED2NGhF21060c8ZuoEj71G+TwQ+yDXPb/nhb/keiNVChY/78C7Z6D0rMGQdDFpEy0oBTSheiuIPdUAZ6H6zOFKh6jtkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMsahgJoPgSUBzoOQKip4Nt31Wd5X598W91iqKan1rk=;
 b=6X5R14mh8avjkD02CinaUt7F0+fEkiFULFiopS24gjEQsR3SBZkfMqLE+vdNF8MtkQxHt+DD7Xp9YphkD048vcnhx46uQwZFQ3d4PqbeTA32X7XDGdulti+nIDPa0CiUpLloNW81+7RFKh+gdHlfE5CpNdC3mfDfWzh5cOeSZPQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Topic: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Index: AQHYM6fbReeSkSu3okSScrrMlkjRu6zQNoyAgAAKUgCAAAMDAA==
Date: Fri, 25 Mar 2022 14:35:38 +0000
Message-ID: <7069C935-A275-4D1A-80EF-C20DE1D3103C@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
 <9673f201-080b-8800-65a2-144d21b030fd@xen.org>
In-Reply-To: <9673f201-080b-8800-65a2-144d21b030fd@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 897746ee-9414-47ff-7e49-08da0e6cc0ab
x-ms-traffictypediagnostic:
	DBBPR08MB4647:EE_|AM5EUR03FT029:EE_|AM8PR08MB5617:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5617CFCE9870B5ED23A43DBD9D1A9@AM8PR08MB5617.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BRREWAw8S4E9bC4Qx3GdemdUl+gBv0Rh1Lvem5la5wob68h+P4hQ9eedV+rOnAobobnSHyEbaTtnmbhwE7+fcN2FGtcKHKPZJ5XicL5jRlcIqig7enakVnT/ChgJ0Ei4lmFQyNKjDAfN25Gws+XBcRjLTu7337U0kN9g1CiLX0sDt1dlgNceKHIO0MDVQnQdUOQAHMe0ILjMCdOrUfVDo3AV4gqEtBi2112qFpeRqXHwD6uhcHWc8wY9vvJi3/K+6ztt5uZEf5vvUNAHF1AAwvgveQs6bFbt/cd0SgVaIxP5GTUf85wMWbg0BOPvweLac+iLr54w7gAQqea1aCiP7xr3DrDmXTi4WL4FpXr8G/+wTyOuF54R5w5Nv18PeYDJxBwp5kujrknHDJqUERgy1BGD8QCp7vDYvG6oYAs5C1ohYXJs/EmxFTf2C8exMiVCDvXkH/gMsZzc2uoGVDY40P9ISoyUrPYEq3obScAdhrQHts9nRIedJo7MDU4Qz23Ku7ZSTzrU1sY6WJRAnqjR8qKvJsYt9ez6ZzIEYsXHpnc5CVw6TGwuDT3u8+ru2j2IHuD5E1isk7KEmW0wb3zPjCdZ0hzyJGHIzRFb+AKAh1jLIjjSrMkCWKcUc4Xw435c4UrDF9cYfVh4DOjvOgZPhAmWYSUS2sJZgfbWIXvaUQq/bwwfd0jra4x1APL+GfXtZ1eI8jKp98oFs6HgM9DE6bA0qUalGmkT5jUdAjKm/xe+ACgV3ER5RK+EsXQUo9CC
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(26005)(6512007)(186003)(53546011)(91956017)(2616005)(38070700005)(66556008)(83380400001)(8936002)(2906002)(5660300002)(8676002)(64756008)(508600001)(66446008)(66946007)(76116006)(71200400001)(6486002)(66476007)(54906003)(4326008)(6916009)(316002)(36756003)(122000001)(38100700002)(86362001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF3CC7E9E6653441AADB48DC10A154D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4647
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c222c24-4caf-48cd-f0c0-08da0e6cbb85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k5z5tjMy5aREpWiXkJr0N8pEdcVbVfp2GcpYO8iDfSvvPHRCwEVY3eE5j1DHecP3eISS4Vziye6l874hMqJRfxonfI9fWTLm/xPzhLrzkusHEZPDkh5E7yWjTv6Bj8tul1PYVVQSGFBAPv0TAuAqIWqYbi0ehpk08atlY2NNFN2o/t1GrX7J2EglYcqqQtq6kmPNha9vqCqws3EOmCGLq9ERbksZTzm6xOeeU8C3pUXGq+zmzKFaHzsJx8i8YFs674dNNcSAgxpXW1FR2g+tVVmYx0V2s0CmaG7WRa4JRFQnO6TnaK4jXn/WY6p3Z3VcAA9IyPKAq0Jv2emQdui7yR6FeYoFhbXSMdYlPdaN9y0003ceT3juv3nFHBnsN51eAF1lEmWcWguuZ9cTp43/p6DdOwtniBSRBvoh0v7sQ76aRwEl6aXmBiEXn+anWSWd35YvpLjRMprKzekKJOA8qwt0Edc1nXhKnNR0+qJ48Vozf2Krk3rS2hQLSWfLlD72qohIoKAm8AFDeni57Q4sb7eW5I/9DuZjLY845HPFG/8VSAN5HXkg4MPpcBnIo/qllYTfGXEtpXwhaKDImp4Na/+XL13NhIgk7RDAXA6+pAX+Hw6P8RCX+eWrxURa9OOqWQVu1iu1kJaeZjJDWKeUfwPf6VAiXbZc+fqpI9rA68ZxyInhLFEO9n+ozmP2yHkw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(70206006)(316002)(86362001)(508600001)(70586007)(47076005)(36860700001)(4326008)(336012)(6506007)(107886003)(6486002)(2616005)(8676002)(83380400001)(40460700003)(33656002)(36756003)(2906002)(8936002)(356005)(6862004)(26005)(5660300002)(186003)(54906003)(53546011)(6512007)(81166007)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:35:47.7442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 897746ee-9414-47ff-7e49-08da0e6cc0ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5617

SGkgSnVsaWVuLA0KDQo+IE9uIDI1IE1hciAyMDIyLCBhdCAxNToyNCwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI1LzAzLzIwMjIgMTM6NDcs
IEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+IA0KPiBIaSBCZXJ0cmFu
ZCwNCj4gDQo+Pj4gT24gOSBNYXIgMjAyMiwgYXQgMTI6MjAsIEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+DQo+Pj4gDQo+Pj4gQXQgdGhlIG1vbWVudCwgc3dpdGNoX3R0YnIoKSBpcyBzd2l0
Y2hpbmcgdGhlIFRUQlIgd2hpbHN0IHRoZSBNTVUgaXMNCj4+PiBzdGlsbCBvbi4NCj4+PiANCj4+
PiBTd2l0Y2hpbmcgVFRCUiBpcyBsaWtlIHJlcGxhY2luZyBleGlzdGluZyBtYXBwaW5ncyB3aXRo
IG5ldyBvbmVzLiBTbw0KPj4+IHdlIG5lZWQgdG8gZm9sbG93IHRoZSBicmVhay1iZWZvcmUtbWFr
ZSBzZXF1ZW5jZS4NCj4+PiANCj4+PiBJbiB0aGlzIGNhc2UsIGl0IG1lYW5zIHRoZSBNTVUgbmVl
ZHMgdG8gYmUgc3dpdGNoZWQgb2ZmIHdoaWxlIHRoZQ0KPj4+IFRUQlIgaXMgdXBkYXRlZC4gSW4g
b3JkZXIgdG8gZGlzYWJsZSB0aGUgTU1VLCB3ZSBuZWVkIHRvIGZpcnN0DQo+Pj4ganVtcCB0byBh
biBpZGVudGl0eSBtYXBwaW5nLg0KPj4+IA0KPj4+IFJlbmFtZSBzd2l0Y2hfdHRicigpIHRvIHN3
aXRjaF90dGJyX2lkKCkgYW5kIGNyZWF0ZSBhbiBoZWxwZXIgb24NCj4+PiB0b3AgdG8gdGVtcG9y
YXJ5IG1hcCB0aGUgaWRlbnRpdHkgbWFwcGluZyBhbmQgY2FsbCBzd2l0Y2hfdHRicigpDQo+Pj4g
dmlhIHRoZSBpZGVudGl0eSBhZGRyZXNzLg0KPj4+IA0KPj4+IHN3aXRjaF90dGJyX2lkKCkgaXMg
bm93IHJld29ya2VkIHRvIHRlbXBvcmFyaWx5IHR1cm4gb2ZmIHRoZSBNTVUNCj4+PiBiZWZvcmUg
dXBkYXRpbmcgdGhlIFRUQlIuDQo+Pj4gDQo+Pj4gV2UgYWxzbyBuZWVkIHRvIG1ha2Ugc3VyZSB0
aGUgaGVscGVyIHN3aXRjaF90dGJyKCkgaXMgcGFydCBvZiB0aGUNCj4+PiBpZGVudGl0eSBtYXBw
aW5nLiBTbyBtb3ZlIF9lbmRfYm9vdCBwYXN0IGl0Lg0KPj4+IA0KPj4+IFRha2UgdGhlIG9wcG9y
dHVuaXR5IHRvIGluc3RydWN0aW9uIGNhY2hlIGZsdXNoIGFzIHRoZSBvcGVyYXRpb24gaXMNCj4+
PiBvbmx5IG5lY2Vzc2FyeSB3aGVuIHRoZSBtZW1vcnkgaXMgdXBkYXRlZC4NCj4+IFlvdXIgY29k
ZSBpcyBhY3R1YWxseSByZW1vdmUgdGhlIGluc3RydWN0aW9uIGNhY2hlIGludmFsaWRhdGlvbiBz
bw0KPj4gdGhpcyBzZW50ZW5jZSBpcyBhIGJpdCBtaXNsZWFkaW5nLg0KPiANCj4gSSBmb3Jnb3Qg
dG8gYWRkIHRoZSB3b3JkICJyZW1vdmUiIGluIHRoZSBzZW50ZW5jZS4NCg0KT2sgKG15IHNlbnRl
bmNlIHdhcyBhbHNvIHdyb25nIGJ5IHRoZSB3YXkpDQoNCj4gDQo+PiBBbHNvIGFuIG9wZW4gcXVl
c3Rpb246IHNob3VsZG7igJl0IHdlIGZsdXNoIHRoZSBkYXRhIGNhY2hlID8NCj4gRG8geW91IG1l
YW4gY2xlYW4vaW52YWxpZGF0ZSB0byBQb0MvUG9VPyBTb21ldGhpbmcgZWxzZT8NCg0KWWVzLCBw
cm9iYWJseSB0byBQb1UuDQoNCj4gDQo+PiBBcyB3ZSBzd2l0Y2ggZnJvbSBvbmUgVFRCUiB0byBh
biBvdGhlciwgdGhlcmUgbWlnaHQgYmUgc29tZSBkYXRhDQo+PiBpbiB0aGUgY2FjaGUgZGVwZW5k
ZW50IHRoYXQgY291bGQgYmUgZmx1c2hlZCB3aGlsZSB0aGUgTU1VIGlzIG9mZiANCj4gDQo+IEkg
YW0gYSBiaXQgY29uZnVzZWQuIFRob3NlIGZsdXNoIGNvdWxkIGFsc28gaGFwcGVuIHdpdGggdGhl
IE1NVSBvbi4gU28gaG93IHR1cm5pbmcgb2ZmIHRoZSBNTVUgd291bGQgcmVzdWx0IHRvIGEgcHJv
YmxlbT8gTm90ZSB0aGF0IHRoZSBkYXRhIGNhY2hlIGlzIHN0aWxsIGVuYWJsZWQgZHVyaW5nIHRo
ZSBzd2l0Y2guDQoNCklmIHRoZSBmaXJzdCBsZXZlbCBvZiBjYWNoZSBpcyBWSVBUIGFuZCB3ZSB0
dXJuIG9mZiB0aGUgTU1VLCBJIGFtIHdvbmRlcmluZyBpZiB0aGlzIGNvdWxkIG5vdCBjcmVhdGUg
dHJvdWJsZXMgYW5kIGNvdWxkIHJlcXVpcmUgdGhlIGNhY2hlIHRvIGJlIGZsdXNoZWQgYmVmb3Jl
IHR1cm5pbmcgdGhlIE1NVSBvZmYuDQpJIGhhdmUgbm8gaWRlYSBpZiB0aGlzIGlzIGEgcHJvYmxl
bSBvciBub3QsIGp1c3QgcmFpc2luZyB0aGUgcXVlc3Rpb24uDQpJIGNhbiB0cnkgdG8gZGlnIG9u
IHRoYXQgYXQgQXJtIHdoZW4gSSBhbSBiYWNrIGluIDEwIGRheXMuIA0KDQo+IA0KPj4gb3INCj4+
IHRoYXQgd291bGQgaGF2ZSBubyBtYXBwaW5nIG9uY2UgaXQgaXMgcmVhY3RpdmF0ZWQuDQo+IFRo
ZSBjYWNoZSBsaW5lIHdpbGwgYmUgZmx1c2hlZCBhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUu
IEkgd291bGQgYXJndWUgaWYgdGhlIGNhbGxlciBuZWVkIGl0IGVhcmxpZXIsIHRoZW4gaXQgc2hv
dWxkIG1ha2Ugc3VyZSB0byBpc3N1ZSB0aGUgZmx1c2ggYmVmb3JlIHN3aXRjaF90dGJyKCkuDQpP
ay4NCg0KSSB3aWxsIHN0aWxsIHRyeSB0byBjaGVjayBpZiB0aGVyZSBpcyBzb21lIGtpbmQgb2Yg
cmVjb21tYW5kYXRpb24gdG8gdHVybiB0aGUgTU1VIG9mZi4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0K
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

