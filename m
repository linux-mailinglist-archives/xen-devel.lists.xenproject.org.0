Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0C36E73E1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 09:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523196.813026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp28C-0006DH-No; Wed, 19 Apr 2023 07:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523196.813026; Wed, 19 Apr 2023 07:21:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp28C-0006BR-KE; Wed, 19 Apr 2023 07:21:32 +0000
Received: by outflank-mailman (input) for mailman id 523196;
 Wed, 19 Apr 2023 07:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pp28B-0006BL-50
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 07:21:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdbf7391-de82-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 09:21:30 +0200 (CEST)
Received: from DB9PR06CA0030.eurprd06.prod.outlook.com (2603:10a6:10:1db::35)
 by AS8PR08MB10027.eurprd08.prod.outlook.com (2603:10a6:20b:63b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 07:21:27 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::1e) by DB9PR06CA0030.outlook.office365.com
 (2603:10a6:10:1db::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 07:21:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 07:21:27 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Wed, 19 Apr 2023 07:21:26 +0000
Received: from 1a5e34f44208.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C26D933-B6F2-43F4-9B4C-3D816DCC898E.1; 
 Wed, 19 Apr 2023 07:21:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1a5e34f44208.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 07:21:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9434.eurprd08.prod.outlook.com (2603:10a6:102:318::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:21:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 07:21:06 +0000
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
X-Inumbo-ID: cdbf7391-de82-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMg3ZPl2fYI3hMPRJtCOP9wN1cxUOVBWkBIJKA0EJfk=;
 b=4fLtBDBBhDzZI/zrA+D+R1qUAelkUF9VeCYT9U2UoAlVWUkvp4I/u74m59xsFLHDHH+NkgzsEYMCv8lvrluZETh0Udhos03qjMPHHmu2vLcuN67fjO+PdUYLqg7S7stlUx+bGkr8zXIxUaWvDomIrDXURuWkhOZGIyiCFJ5zkIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: aaf4216b1bde690a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBripDd4xF5cBIonh4MA4r2zPuyJ6ObaQ+7H4EB0x2j+4VoJ661ChRT1OWWn3BK/pHTZgLjs/MzULH6QbJOfM/UKFpP910UfU5vNaqHcdnr8A8IYx/OI5J3YXTOi0aowFPGv4bi21wh1z8BuoHJyFi/lGC3xOr580ev6fy7laeFKcHXszAYYqMRsO7gYRHLcuTnropSChI2ETzqOnGb2xLjSrIVllxfvscBetCMaDn/L6E0qBlTXWPjEjGyBrdQlcUG57MxC6KOFpQWS/SZGTNdVWLniAXsApYlLRGUg2oru4TDXk4cw42oJORPfNzmsiO1TXkg9YVIHOcdEINH1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMg3ZPl2fYI3hMPRJtCOP9wN1cxUOVBWkBIJKA0EJfk=;
 b=A+TkcPYMJ3G5rHo9hW1BY+zar6TLXN0B3amESMuQk5+MBKUXSIcU8UTrF/hcl2BWt87l8f1hImyEMZqPSGVmkSleG59y28Hhaxdr63Ulb9iGdGDZlEn5qpEOak4Sadj6vmaIauQAD+p9WNS/DIZdBAGUwHwu9wSNz8kyeaVfX7HWvTFnFXWWjSG2k02/kGfz90Ch+dRaje5FOYT4r4c2anBTKNJS/ZZCSOclvrVwqGR3qgxnOLZTPCIOV7TIhsu9a9AaZ+0mXb2k9dWRq6JuMFuwJ6V1wzHzacve94AHc3+kFawUaTTVU3mO/mweTDMIXlwItCsJiIDii3lH3yImtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMg3ZPl2fYI3hMPRJtCOP9wN1cxUOVBWkBIJKA0EJfk=;
 b=4fLtBDBBhDzZI/zrA+D+R1qUAelkUF9VeCYT9U2UoAlVWUkvp4I/u74m59xsFLHDHH+NkgzsEYMCv8lvrluZETh0Udhos03qjMPHHmu2vLcuN67fjO+PdUYLqg7S7stlUx+bGkr8zXIxUaWvDomIrDXURuWkhOZGIyiCFJ5zkIA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v5 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZbSQxHdlbNP/OhU+SnBXlOek6la8xDZGAgAE1nQCAAAF/gA==
Date: Wed, 19 Apr 2023 07:21:06 +0000
Message-ID: <3DE2B914-FA6E-49EF-8748-BB8DE4B2CC11@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-8-luca.fancellu@arm.com>
 <2833DC4A-95F0-482A-AD0F-3E942D1DA223@arm.com>
 <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
In-Reply-To: <F30CEF99-693A-4218-AC80-433A183DE866@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9434:EE_|DBAEUR03FT022:EE_|AS8PR08MB10027:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b617a79-77a0-4b95-9166-08db40a6b060
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0trHPcvmc9rX+/5a/jeocExLmvnMQFWYAdqbpZsnbaLIpkWawD9tHYz73cXjmP7HXZC+pWXfoXw3JIVNmX3QHPIro+nClfVkZcXsWKQAWrInePaSyWLSJPJfyMi+ggXtZghtEhZZCGefcMlsqvMGNioHXTOPjS0mVGpLH0Y3lnXxeDThXkE/ECBd6+ozWoOHLlT4f4O4K52u0LLVyDd1UH4STN9LM97FW5CHoRPlEmqIDEZqaqWJTDNzsnFFQksyaXMpekX8baCZtbpqhuTvEO7+7zB0neKr6E5E/rMc5s+NqUxt3CiVBwUNbY0SIMXKndD9Ui0615UdsW9QCDTzy4TBBvLfNIVk3RnfeA8PS3rk4SyjLmcrvRb+P9OYYEUXtoiPAg8LgKA5aiabOFddPSvF7ziKuFf0DYaweWCSeCQaWpWEEBniPmOWbsSnMKRgcBOVKoAvZ7UCpqD4IKz9jkVzjKL88kQGNG/6/cpPjhukul2MJ0Nnrk2ghUmlXS6PxeQgRYcM/EqSY4TGPFb0jSHEZjEaYaQf8fXC0XpyqpjIUqS99AQCMozkj79lcZlbz3K0Wl3N/3wC8qFhozpSy7p5TuvJtrY8tPT1HdvtX3TBXzsixA0fkNTkM6waGtBEsbYD1KTOS9oc1lnp2uLNvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(451199021)(122000001)(6506007)(6512007)(38100700002)(478600001)(6486002)(66446008)(66946007)(66556008)(66476007)(64756008)(6636002)(76116006)(36756003)(4326008)(71200400001)(86362001)(41300700001)(316002)(37006003)(91956017)(54906003)(83380400001)(186003)(38070700005)(53546011)(8676002)(8936002)(2906002)(33656002)(5660300002)(6862004)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <918E763527C09046887CEE950C910D32@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9434
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f5b2eb8d-f243-4d00-c64c-08db40a6a3d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GmWHQyKyn6EWaaXTTjFbSScgiUN2t3NDykCHbidw+YAR3hRv9kBrgrUly2XXlqnr63R4up+1caUiRmlGe/u+SDlL2xqV50NC411L0MEmXdxmAkmDFG8kuIDLZe3nJdDfm19bT35nuAXRCWtZjVjB8lWZ+1+NK1LdDN2y0UuiyRCDOa+fgu1STtoCAn0G1y8rMRTxlC4+dRdOyAkBB3+wubg/ftlxH/uTt9kSjHQwyuPGt0SuwyS9Qogbg0VqP/3piJKWk1M+8VJNi0Q/fpW6WqGqUI8QTim7Qv0sZJkjpyGw+Lq4pS196hvF6/69XSOOLN1knrRo4N0zNARTWr7krnutQViRNknRS7GHjKdA+F27zOYYcdlIll7ejI7OxZLuORjRDmS50kQNSoI8tYpCa/C0L3dkXTh/5OliQeSR1XxhCVjpswyRkmgMiFjRr+GQ9F0LiSPC7xY3iabrBzfOk/iXmySSb2PgKGjR4rGVbUdbpUEByPQLrJWTR0V+cm+U4ew/F0c7+XJd+AbuqLcZmTpZx+YczW3hIQjjKQtqHP2tzNrZyGbBIG4Rb0U4PjbZFTPZgA3GmQIJZLmLtRXN0oCpMlrDHw/hXjqSZW6w3ZSrZEJOYEFJ1HQKktoh3MHPTWj7d4LZOefHHZaiKNrlApICnGqKpdA7eAd47yUjF3CCYfilSTUQB6cHv42dVMLkGkEova9NCFsmG9PlwRw0hA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(40460700003)(33656002)(36756003)(2906002)(6862004)(8676002)(8936002)(86362001)(40480700001)(5660300002)(70206006)(70586007)(81166007)(356005)(41300700001)(82310400005)(82740400003)(4326008)(2616005)(47076005)(83380400001)(336012)(54906003)(6506007)(107886003)(6636002)(37006003)(186003)(316002)(26005)(53546011)(6512007)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:21:27.0768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b617a79-77a0-4b95-9166-08db40a6b060
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10027

SGkgTHVjYSwNCg0KPiBPbiAxOSBBcHIgMjAyMywgYXQgMDk6MTUsIEx1Y2EgRmFuY2VsbHUgPEx1
Y2EuRmFuY2VsbHVAYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+Pj4g
DQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYyBiL3hlbi9hcmNoL2Fy
bS9hcm02NC9zdmUuYw0KPj4+IGluZGV4IDU0ODU2NDg4NTBhMC4uYWQ1ZGI2MmUxODA1IDEwMDY0
NA0KPj4+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9zdmUuYw0KPj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9hcm02NC9zdmUuYw0KPj4+IEBAIC05LDYgKzksOSBAQA0KPj4+ICNpbmNsdWRlIDx4ZW4v
c2l6ZXMuaD4NCj4+PiAjaW5jbHVkZSA8YXNtL2FybTY0L3N2ZS5oPg0KPj4+IA0KPj4+ICsvKiBv
cHRfZG9tMF9zdmU6IGFsbG93IERvbTAgdG8gdXNlIFNWRSBhbmQgc2V0IG1heGltdW0gdmVjdG9y
IGxlbmd0aC4gKi8NCj4+PiAraW50IF9faW5pdGRhdGEgb3B0X2RvbTBfc3ZlOw0KPj4+ICsNCj4+
PiBleHRlcm4gdW5zaWduZWQgaW50IHN2ZV9nZXRfaHdfdmwodm9pZCk7DQo+Pj4gZXh0ZXJuIHZv
aWQgc3ZlX3NhdmVfY3R4KHVpbnQ2NF90ICpzdmVfY3R4LCB1aW50NjRfdCAqcHJlZ3MsIGludCBz
YXZlX2Zmcik7DQo+Pj4gZXh0ZXJuIHZvaWQgc3ZlX2xvYWRfY3R4KHVpbnQ2NF90IGNvbnN0ICpz
dmVfY3R4LCB1aW50NjRfdCBjb25zdCAqcHJlZ3MsDQo+Pj4gQEAgLTExOCwzICsxMjEsMjEgQEAg
dm9pZCBzdmVfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdikNCj4+PiANCj4+PiAgIHN2ZV9s
b2FkX2N0eChzdmVfY3R4X3pyZWdfZW5kLCB2LT5hcmNoLnZmcC5mcHJlZ3MsIDEpOw0KPj4+IH0N
Cj4+PiArDQo+Pj4gK2ludCBfX2luaXQgc3ZlX3Nhbml0aXplX3ZsX3BhcmFtKGludCB2YWwsIHVu
c2lnbmVkIGludCAqb3V0KQ0KPj4+ICt7DQo+Pj4gKyAgICAvKg0KPj4+ICsgICAgICogTmVnYXRp
dmUgU1ZFIHBhcmFtZXRlciB2YWx1ZSBtZWFucyB0byB1c2UgdGhlIG1heGltdW0gc3VwcG9ydGVk
DQo+Pj4gKyAgICAgKiB2ZWN0b3IgbGVuZ3RoLCBvdGhlcndpc2UgaWYgYSBwb3NpdGl2ZSB2YWx1
ZSBpcyBwcm92aWRlZCwgY2hlY2sgaWYgdGhlDQo+Pj4gKyAgICAgKiB2ZWN0b3IgbGVuZ3RoIGlz
IGEgbXVsdGlwbGUgb2YgMTI4IGFuZCBub3QgYmlnZ2VyIHRoYW4gdGhlIG1heGltdW0gdmFsdWUN
Cj4+PiArICAgICAqIDIwNDgNCj4+PiArICAgICAqLw0KPj4+ICsgICAgaWYgKCB2YWwgPCAwICkN
Cj4+PiArICAgICAgICAqb3V0ID0gZ2V0X3N5c192bF9sZW4oKTsNCj4+PiArICAgIGVsc2UgaWYg
KCAoKHZhbCAlIFNWRV9WTF9NVUxUSVBMRV9WQUwpID09IDApICYmICh2YWwgPD0gU1ZFX1ZMX01B
WF9CSVRTKSApDQo+Pj4gKyAgICAgICAgKm91dCA9IHZhbDsNCj4+IA0KPj4gU2hvdWxkbid0IHlv
dSBhbHNvIGNoZWNrIGlmIGl0IGlzIG5vdCBncmVhdGVyIHRoYW4gdGhlIG1heGltdW0gdmVjdG9y
IGxlbmd0aCA/DQo+IA0KPiBJIGRvbuKAmXQgdW5kZXJzdGFuZCwgSSBhbSBjaGVja2luZyB0aGF0
IHRoZSB2YWx1ZSBpcyBiZWxvdyBvciBlcXVhbCB0byBTVkVfVkxfTUFYX0JJVFMsDQo+IElmIHlv
dSBtZWFuIGlmIGl0IHNob3VsZCBiZSBjaGVja2VkIGFsc28gYWdhaW5zdCB0aGUgbWF4aW11bSBz
dXBwb3J0ZWQgbGVuZ3RoIGJ5IHRoZSBwbGF0Zm9ybSwNCj4gSSB0aGluayB0aGlzIGlzIG5vdCB0
aGUgcmlnaHQgcGxhY2UsIHRoZSBjaGVjayBpcyBhbHJlYWR5IGluIGFyY2hfc2FuaXRpc2VfZG9t
YWluX2NvbmZpZygpLCBpbnRyb2R1Y2VkDQo+IGluIHBhdGNoICMyDQoNCklmIHRoaXMgaXMgbm90
IHRoZSByaWdodCBwbGFjZSB0byBjaGVjayBpdCB0aGVuIHdoeSBjaGVja2luZyB0aGUgcmVzdCBo
ZXJlID8NCg0KRnJvbSBhIHVzZXIgb3IgYSBkZXZlbG9wZXIgcG9pbnQgb2YgdmlldyBJIHdvdWxk
IGV4cGVjdCB0aGUgdmFsaWRpdHkgb2YgdGhlIGlucHV0IHRvIGJlIGNoZWNrZWQgb25seQ0KaW4g
b25lIHBsYWNlLg0KSWYgaGVyZSBpcyBub3QgdGhlIHBsYWNlIGZvciB0aGF0IGl0IGlzIG9rIGJ1
dCB0aGVuIGkgd291bGQgY2hlY2sgZXZlcnl0aGluZyBpbiBhcmNoX3Nhbml0aXNlX2RvbWFpbl9j
b25maWcNCihtdWx0aXBsZSwgbWluIGFuZCBzdXBwb3J0ZWQpIGluc3RlYWQgb2YgZG9pbmcgaXQg
cGFydGx5IGluIDIgcGxhY2VzLg0KDQo+IA0KPj4gDQo+Pj4gKyAgICBlbHNlDQo+Pj4gKyAgICAg
ICAgcmV0dXJuIC0xOw0KPj4+ICsNCj4+PiArICAgIHJldHVybiAwOw0KPj4+ICt9DQo+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYw0KPj4+IGluZGV4IGVlYjQ2NjJmMGVlZS4uM2YzMGVmNWMzN2I2IDEwMDY0NA0K
Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+ICsrKyBiL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYw0KPj4+IEBAIC0yNiw2ICsyNiw3IEBADQo+Pj4gI2luY2x1ZGUg
PGFzbS9wbGF0Zm9ybS5oPg0KPj4+ICNpbmNsdWRlIDxhc20vcHNjaS5oPg0KPj4+ICNpbmNsdWRl
IDxhc20vc2V0dXAuaD4NCj4+PiArI2luY2x1ZGUgPGFzbS9hcm02NC9zdmUuaD4NCj4+PiAjaW5j
bHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4NCj4+PiAjaW5jbHVkZSA8YXNtL2RvbWFpbl9idWlsZC5o
Pg0KPj4+ICNpbmNsdWRlIDx4ZW4vZXZlbnQuaD4NCj4+PiBAQCAtNjEsNiArNjIsMjEgQEAgY3Vz
dG9tX3BhcmFtKCJkb20wX21lbSIsIHBhcnNlX2RvbTBfbWVtKTsNCj4+PiANCj4+PiBpbnQgX19p
bml0IHBhcnNlX2FyY2hfZG9tMF9wYXJhbShjb25zdCBjaGFyICpzLCBjb25zdCBjaGFyICplKQ0K
Pj4+IHsNCj4+PiArICAgIGxvbmcgbG9uZyB2YWw7DQo+Pj4gKw0KPj4+ICsgICAgaWYgKCAhcGFy
c2Vfc2lnbmVkX2ludGVnZXIoInN2ZSIsIHMsIGUsICZ2YWwpICkNCj4+PiArICAgIHsNCj4+PiAr
I2lmZGVmIENPTkZJR19BUk02NF9TVkUNCj4+PiArICAgICAgICBpZiAoICh2YWwgPj0gSU5UX01J
TikgJiYgKHZhbCA8PSBJTlRfTUFYKSApDQo+Pj4gKyAgICAgICAgICAgIG9wdF9kb20wX3N2ZSA9
IHZhbDsNCj4+PiArICAgICAgICBlbHNlDQo+Pj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0df
SU5GTyAiJ3N2ZT0lbGxkJyB2YWx1ZSBvdXQgb2YgcmFuZ2UhXG4iLCB2YWwpOw0KPj4+ICsjZWxz
ZQ0KPj4+ICsgICAgICAgIG5vX2NvbmZpZ19wYXJhbSgiQVJNNjRfU1ZFIiwgInN2ZSIsIHMsIGUp
Ow0KPj4+ICsjZW5kaWYNCj4+IA0KPj4gQ29ycmVjdCBtZSBpZiBteSB1bmRlcnN0YW5kaW5nIGlz
IHdyb25nIGJ1dCBoZXJlIHlvdSBqdXN0IGlnbm9yZSB0aGUgc3ZlDQo+PiBwYXJhbWV0ZXIgaWYg
U1ZFIGlzIG5vdCBzdXBwb3J0ZWQgYnkgWGVuID8NCj4+IA0KPj4gSSBhbSBhIGJpdCB3b25kZXJp
bmcgaWYgd2Ugc2hvdWxkIG5vdCBqdXN0IHJlZnVzZSBpdCBoZXJlIGFzIHRoZSB1c2VyIG1pZ2h0
DQo+PiB3cm9uZ2x5IHRoaW5rIHRoYXQgaGlzIHBhcmFtZXRlciBoYWQgc29tZSBlZmZlY3QuDQo+
PiANCj4+IE9yIGlzIGl0IGEgdXN1YWwgd2F5IHRvIGhhbmRsZSB0aGlzIGNhc2UgPw0KPiANCj4g
SmFuIHN1Z2dlc3RlZCB0aGlzIGFwcHJvYWNoLCBhcyBpdCBzaG91bGQgYmUgdGhlIHByZWZlcnJl
ZCB3YXkgdG8gaGFuZGxlIHRoZSBjYXNlLA0KPiBsb29raW5nIGludG8gdGhlIHg4NiBjb2RlIGl0
IHNlZW1zIHNvLg0KPiANCg0KVGhpcyBpcyBzb21laG93IGdvaW5nIGFyb3VuZCB0aGUgZ2xvYmFs
IGRpc2N1c3Npb246IGlzIGl0IHJlYWxseSBvayB0byBpZ25vcmUgc3ZlIA0KcGFyYW0gaWYgaXQg
aXMgbm90IHN1cHBvcnRlZC4gTGV0J3MgaGF2ZSB0aGlzIGRpc2N1c3Npb24gb24gdGhlIG90aGVy
IHRocmVhZCBpbnN0ZWFkLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0K

