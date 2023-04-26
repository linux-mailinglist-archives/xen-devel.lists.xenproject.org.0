Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4D6EF03C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 10:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526570.818417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praXK-00073P-TW; Wed, 26 Apr 2023 08:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526570.818417; Wed, 26 Apr 2023 08:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1praXK-0006zi-Ov; Wed, 26 Apr 2023 08:30:02 +0000
Received: by outflank-mailman (input) for mailman id 526570;
 Wed, 26 Apr 2023 08:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNUB=AR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1praXI-0006kv-Vy
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 08:30:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86e879dc-e40c-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 10:29:57 +0200 (CEST)
Received: from DB6PR0301CA0085.eurprd03.prod.outlook.com (2603:10a6:6:30::32)
 by PAWPR08MB9967.eurprd08.prod.outlook.com (2603:10a6:102:358::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 08:29:21 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::cc) by DB6PR0301CA0085.outlook.office365.com
 (2603:10a6:6:30::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.54 via Frontend
 Transport; Wed, 26 Apr 2023 08:29:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.21 via Frontend Transport; Wed, 26 Apr 2023 08:29:21 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 26 Apr 2023 08:29:20 +0000
Received: from 6893e8ce4ffb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70254448-2759-4EDF-92B5-2378D5FAEBA6.1; 
 Wed, 26 Apr 2023 08:29:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6893e8ce4ffb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Apr 2023 08:29:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9560.eurprd08.prod.outlook.com (2603:10a6:10:44b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 08:29:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 08:29:08 +0000
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
X-Inumbo-ID: 86e879dc-e40c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82jgf7C7W97Gi1/0L70fqkFNer9/ST18TiwAoFIhZHA=;
 b=cLiyYFIzr5N0AjH2a4P6UlHglyQN+CZXR6hQDQ7sRqUqvf+mNVYxsRGvO663NQQQQyDeGz5Z4SD1x9MCwUt4JvZAPtUhv6dEA3De8Q9PIzTu88L/AkBXyjfko3ZnKgt/N5oOTLOXGDBqc7KcIXWyohPjgmlxSyEROQ8G4UvKMZ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OE8u2obypfE/r8UjKsD7h6MSQV28MpgHoXXzJTOclDvhi79yaY92vGXjUhzDhkqE6pqn3KwzfqOOREYadEjPvke2XSQwLkzsePvhsefnUexuENUK0rJKpSm4PVg0tRPw/U/dSpmX/ujNTcX0mZaJBMnwJgPGop8S8qmEW/HBp82vZebLMMugYOfqG4+zSsGFCUMSXyoXDJ3SAw+XcMxoWxDQXrtFynn0dJT51Xd21cGmCIQWZit/TFUHoXHJ08KO0fN7HRQYluxPMq0z0NhlpqRVvN6Yt/Br7gJdA3ObFHs6IZENfgYVW/+BhCrlUB2/SZyMAVG5Cg9Fqbjf4To2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82jgf7C7W97Gi1/0L70fqkFNer9/ST18TiwAoFIhZHA=;
 b=f+RVOkmQ2Z6L5APU0ltvZ9lXprhN+wgfrp8qymE6VaZzKlr/k1nth0/JbKbcXuIbfrCojurdzYaIdPSOyqz9S3JN/7mMvzAx0URQoH8qVFZE5sK01Fz95VidTBLqRB13OI+klvHSst/G1VBEe8FTLgxCUaeI9TF84q1ml82VXau9yrplaQm2VAYpKgQe6VNkOgRGwd1h+fQh9R919AmGjQRDgS6zwAispNnWsqjxBTA5SDqum6RAW+9cAUJ7gANAEHTK5+odLtLJdUdeY3scK0Z6lgqW7jKRzOEVtEeXMENjok4oflHYaUQExjqRe5kk5NLl/yH8LjsUcp1wh5j5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82jgf7C7W97Gi1/0L70fqkFNer9/ST18TiwAoFIhZHA=;
 b=cLiyYFIzr5N0AjH2a4P6UlHglyQN+CZXR6hQDQ7sRqUqvf+mNVYxsRGvO663NQQQQyDeGz5Z4SD1x9MCwUt4JvZAPtUhv6dEA3De8Q9PIzTu88L/AkBXyjfko3ZnKgt/N5oOTLOXGDBqc7KcIXWyohPjgmlxSyEROQ8G4UvKMZ0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Thread-Topic: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Index:
 AQHZd0ulMpqFICe/LUiDVq6+aDsW9687tFqAgAFSIKCAACZ1gIAABguQgAAM+YCAAAMWUA==
Date: Wed, 26 Apr 2023 08:29:08 +0000
Message-ID:
 <AS8PR08MB79911D9836C2954C047BECDF92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
 <AS8PR08MB7991F2DDC4C13F33390557EA92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e783d71f-cc0c-e235-28a8-7ec9ad63d41f@suse.com>
 <AS8PR08MB79919EAEDCD85073CAECE5DD92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <cebf1a46-71cb-a700-78ac-f9ee8bb64c22@suse.com>
In-Reply-To: <cebf1a46-71cb-a700-78ac-f9ee8bb64c22@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F541DB9C9283CE449860593CE3A1A199.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9560:EE_|DBAEUR03FT047:EE_|PAWPR08MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 96bedec7-387b-4584-c2df-08db4630559d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YzSdOyzCh/ICeIkJIHJlnomQZxv48ZBRWQ69VokrSl2Pcr9VS236otPg2z364hkaY9WcbqtNd+AL/Vw2QQ57BfwnsIJFKkBWea/Srce4eVawzKqA9zF4pF8PCHZ1exOvp5phL9etzlyF6+ShD0LKdu0cTCEx2SGIntbMzAtd/tzVNwA2U3GPIykf+tYJooo1cj3gM8L3t6M+L/VaTk4GCAuCSD5/+lVmmEo57wZt2SZHmEaZc3XceH2AQyfHvJ45+mor4IleIdCh5EIFc0iVwC2g8lF33BZkq+sRcdKRSjTI28e0qY1HDkHQ6W7+noe+tJ+/f+kYtrDODfqoILQ+Risa/hjTcRH2ZaZSHd4OMI0ZLFNZb7OYbfXTibvq7mrCtcwA1QOKL8xYYKfFQIFJuRN+S+qH1kUSGYBY2UBeAw1R9ET1LrerAKihMW3f/TtTC+rxGbXvvV/Co0Uj801xHuMUN8rHQvG3Dvd1/KmFabfuXRFHtuZkZgSzvNl4fpPremtwKG5zfw5SjOLvDRiurECVghDtLg4GUmPssOlj73MNyWlGxy/vduhfGzKfRawuer77uIJbGKH22Ufb8TqNmscHeli6iLT+RFlaSYnh7CLgxDbDaVfHQIi2yjAnSTCG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(6506007)(26005)(33656002)(9686003)(52536014)(86362001)(5660300002)(186003)(83380400001)(7696005)(71200400001)(54906003)(38070700005)(8936002)(8676002)(41300700001)(316002)(4744005)(38100700002)(2906002)(64756008)(66446008)(66476007)(76116006)(55016003)(66946007)(4326008)(6916009)(478600001)(122000001)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9560
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	992b0d83-db26-4217-35ad-08db46304e36
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NWFVnKHmi/VscMBpZ+GyA6n5o5cT1F/NnJqKgvBvYo9LgGmmNGjCXJdUh/RzjlY4Evsv4YYF7Qrnblsi3IartnM3r7qxzXu+CYt0V/yGEtd/3Zs5HO1glJO02kf1J19OFnU90fgGStO6NC6HEdYUXYR33cGqiP/btkfvhBiSTDZh4KZ6yvI+2qty/SxJrr+k6vOWrT1HQIVY/ms7bSUmmQZ+U8yMIc3KRUG9Uh+zF+ELLC0Nro1u+JxTfQhJlh8eIZB3xNpfBxBzWhgeGe81LjAlsYW5gmO9KNK24lXjpaf+8GRI9Mky3l5C8yD9UJOV5WeV7rN99/FGyoq7uwXi9//JL+QYl2ztvz2Y83IXevM0ncqPjqCh91sPGlontK0eL0BdodMU3NFRS7r99wJFhDnffQi+e9tZchTqIrsdI2kEW/yz9l15bqOnXmuwO3PrSxMDrxaVtbbJ5jRpUt1zpEtC74JvrJfFKtUdOlGgK5cAUAC5xpoIlVVAuIIyZoIq5ixwB1zDqucZoU/AmIbvoZuMcso0MuxIOTWietvJ97Mz5lhw0tL96v8PiA6Ta6Tdzp+F3l+7XxG0ytSK/YDwp1cM/QTRI7jQBUuFUnuifer8heUzjT+LLaEfxWWEBOysDhEmov1Uvg9gZqDZb4j0RYWqOUKRpphqGc2wu8Dr5kTIvSLwmeOu5LhzV3hfKudmmPXFJqb+UzS1YQgIpZA4HPzoz7dDjosNNA+QtQ3X3+M=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(7696005)(26005)(6506007)(9686003)(36860700001)(83380400001)(47076005)(336012)(2906002)(4744005)(40480700001)(186003)(54906003)(478600001)(34070700002)(33656002)(82310400005)(4326008)(316002)(82740400003)(6862004)(41300700001)(81166007)(40460700003)(356005)(5660300002)(70206006)(86362001)(70586007)(8676002)(8936002)(55016003)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 08:29:21.1834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96bedec7-387b-4584-c2df-08db4630559d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9967

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwOS8xN10g
eGVuL2FybTogaW50cm9kdWNlIGEgaGVscGVyIHRvIHBhcnNlIGRldmljZQ0KPiB0cmVlIE5VTUEg
ZGlzdGFuY2UgbWFwDQo+IA0KPiA+IEdyZWF0IHBvaW50cyEgVGhhbmtzIGZvciBwb2ludGluZyB0
aGUgOC1iaXQgdHJ1bmNhdGlvbiBvdXQuIFlvdSBhcmUgY29ycmVjdC4NCj4gPiBTb21laG93IG15
IGltcHJlc3Npb24gb2YgbnVtYV9zZXRfZGlzdGFuY2UoKSdzIGZpcnN0IHR3byBhcmd1bWVudHMg
YXJlDQo+ID4gYWxyZWFkeSAidW5zaWduZWQgaW50IiBzbyBJIG1pc3NlZCB0aGlzIHBhcnQuLi5T
b3JyeS4NCj4gPg0KPiA+IEluIHRoYXQgY2FzZSwgSSB0aGluayBJIHdpbGwgYWRkIGEgY2hlY2sg
YmV0d2VlbiAiZnJvbSwgdG8iIGFuZA0KPiBNQVhfTlVNTk9ERVMNCj4gPiBhcyBzb29uIGFzIHRo
ZSB2YWx1ZXMgb2YgImZyb20iIGFuZCAidG8iIGFyZSBwb3B1bGF0ZWQgYnkgZHRfbmV4dF9jZWxs
KCkuDQo+ID4gSG9wZWZ1bGx5IHRoaXMgd2lsbCBhZGRyZXNzIHlvdXIgY29uY2Vybi4NCj4gDQo+
IFdoaWxlIHRoaXMgd291bGQgYWRkcmVzcyBieSBjb25jZXJuLCBJIGRvbid0IHNlZSB3aHkgeW91
IHdhbnQgdG8gcmVwZWF0DQo+IHRoZSBjaGVja2luZyB0aGF0IG51bWFfc2V0X2Rpc3RhbmNlKCkg
YWxyZWFkeSBkb2VzLg0KDQpDb3JyZWN0LCBJIHRoaW5rIEkgd291bGQgYmV0dGVyIHRvIG1vdmUg
dGhlIGNoZWNrIGluIG51bWFfc2V0X2Rpc3RhbmNlKCkgdG8NCnRoZSBjYWxsZXIgZmR0X3BhcnNl
X251bWFfZGlzdGFuY2VfbWFwX3YxKCkgYXMgSSBiZWxpZXZlIGlmIHRoZSB0cnVuY2F0aW9uDQpy
ZWFsbHkgaGFwcGVucyBpdCBpcyB0b28gbGF0ZSB0byBjaGVjayBpbiBudW1hX3NldF9kaXN0YW5j
ZSgpLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

