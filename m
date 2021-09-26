Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B6A418812
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 12:15:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196052.348900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mURBs-0003n6-BC; Sun, 26 Sep 2021 10:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196052.348900; Sun, 26 Sep 2021 10:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mURBs-0003js-80; Sun, 26 Sep 2021 10:15:24 +0000
Received: by outflank-mailman (input) for mailman id 196052;
 Sun, 26 Sep 2021 10:15:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ODXE=OQ=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mURBq-0003jU-Dg
 for xen-devel@lists.xenproject.org; Sun, 26 Sep 2021 10:15:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84e73a0c-a8f2-4fec-82dc-7ba967fc7fed;
 Sun, 26 Sep 2021 10:15:19 +0000 (UTC)
Received: from AS9PR06CA0162.eurprd06.prod.outlook.com (2603:10a6:20b:45c::31)
 by DB6PR0801MB1942.eurprd08.prod.outlook.com (2603:10a6:4:75::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Sun, 26 Sep
 2021 10:15:16 +0000
Received: from AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::f0) by AS9PR06CA0162.outlook.office365.com
 (2603:10a6:20b:45c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Sun, 26 Sep 2021 10:15:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT010.mail.protection.outlook.com (10.152.16.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 10:15:16 +0000
Received: ("Tessian outbound 45760a30af4a:v103");
 Sun, 26 Sep 2021 10:15:14 +0000
Received: from d607cf8b24d8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F088FCA-A6D7-468F-BD34-F179FD51BFFA.1; 
 Sun, 26 Sep 2021 10:15:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d607cf8b24d8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 26 Sep 2021 10:15:04 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4569.eurprd08.prod.outlook.com (2603:10a6:10:b2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Sun, 26 Sep
 2021 10:15:02 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Sun, 26 Sep 2021
 10:15:02 +0000
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
X-Inumbo-ID: 84e73a0c-a8f2-4fec-82dc-7ba967fc7fed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU3RDnxrdTOUAgDVbK7ldLobqqH5q0xYX1mf8P19fkk=;
 b=WRt5FNbFFCHUlWbhOe7PC/VSPM4VMrQiG9XedMRQnEFxOss09Rm29Bep6H22gjIucqBrxD3Od6AbkZjUbLQfnNPt6wvt/hM1Ou7FD0mJvW0MCGMTENQFl8aRzqr0xxk0m1g9FA/OvIBqiqDUO6HLM/8fFZJFjKAyq5tckhZMHl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GV3Zx5QNSuPkCEt6egP1Xribt9Yvd1OHGqtyPgslRBkg+S6+CvNA30/rsapaKSKsD4nAObbSqy4Kby9zWSQUTpJ/hBHl/LRp9SgxI2M+1SwnB/3aYtN7I4Bsu/F9KXQjc00Ys8i/Po6RxNLeJjpcoUBvL32Q/nfwnyiTdGeTMcIUdAqNoGnGHCZTsTcQtJ+M3Z7XYQePUteMV5CwUYqIOCEs4miBIDuZsUtYaYNJ4fmnMK/NvXqrwI3l+lcniFNIVwKm0rqDevzPhU9MCgz53/3Vpp1XrjIx5av2pSZMUgT+0CcGn6KBG4/kkcAQ+UP3NpgFR9L73i2OLweRuF97Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EU3RDnxrdTOUAgDVbK7ldLobqqH5q0xYX1mf8P19fkk=;
 b=iHU5Y+XxJxqCzlI0qd5G3p1qbh+RlufHgw38tHvrZGuENCX2xQOlpxO9PQaBLsSIgB+TVAV7xU1vkxG3ThKb9h+buwz/2gQemjHZv1lFBExeIRoB1bSqmJmxPFhJ4gvsB6ypdbpXXpG+DA1K4/0XjYjqiLr6ZYt4V9xnDy1Wnu9cKZDM58qYfQsdsMKpduJnkVQx0cT+17D+3LEfZD86yCZgEKQ1bkFAlW8SsTelkddZS8KDPlwUCed8dWrSvqwgpws/A8wXDoAO4EencEhGXgZmxubL9U9ncEqWmhK5SMQU6d2gfymPD2bcttBKkP0WR7ys1hTcr2+Vyzf5nqfTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EU3RDnxrdTOUAgDVbK7ldLobqqH5q0xYX1mf8P19fkk=;
 b=WRt5FNbFFCHUlWbhOe7PC/VSPM4VMrQiG9XedMRQnEFxOss09Rm29Bep6H22gjIucqBrxD3Od6AbkZjUbLQfnNPt6wvt/hM1Ou7FD0mJvW0MCGMTENQFl8aRzqr0xxk0m1g9FA/OvIBqiqDUO6HLM/8fFZJFjKAyq5tckhZMHl4=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
Thread-Index: AQHXsHMu1eZPzfhk6EKVEGWM7eNLZ6uyayoAgAAvnmCAAPsvgIACh1gw
Date: Sun, 26 Sep 2021 10:15:02 +0000
Message-ID:
 <DB9PR08MB68578B994BD167A105BACE939EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231843530.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB68571BAA4C8B07BB2061C8579EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109241233590.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109241233590.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: ECA1477DF674ED479E9407B7F83C3E1C.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3e5e4d77-075b-49a8-9280-08d980d68929
x-ms-traffictypediagnostic: DB8PR08MB4569:|DB6PR0801MB1942:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB194204DE817EBCA2A925FA0B9EA69@DB6PR0801MB1942.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6GGQZfwBiDsGKkZh3ZATinUcf7lSZy7VVXf5i9GyiMKChXduVggryxTUng5iHghmNuSZqSNkgyrSQUQlG1cWC8LjFq+wnqX0OdE8ndHaIu81udg4r/nlNRCQgRIQQjHabET7ZIRo8NsoUieoquJMkiVc1BGRtRDnquH2jdD5575+GEWkiD+PlqybzkJuGHRz2mmtHJKIy0McSs0oRddXYlpjj5yeFbT+eFvgfL9F4AmmAUW4pOJwGDCld9griPyQz56GfDsf7MSu3upIUsyX68HSWihzuRdEjz79oEMLXPqWKQSXZ3XwF7pRx2g+NNyL4rKasKmjIyFfHxzLKIevU57T7Q0sDqoLJaL1tRBlIapasGeka3KtgFTeHKDqMrIaBSlTnNHcWFnfAHWknOenlfwYR34rjEeo8cgIBcOl7kiV58o2jvHziYZkSaWGRAuM7d39pUZynWqO6i9/QSNPuFp36RkDx/IERvi43XFpnREePC328hQ08hsHncZ7pWUXBLDFI/aIkT615VKFTPzyZuGMzRn5Ixbvp6QQJgqOhHCbjId6E0CR2HwNNBT+3agJmJC2oVQhpq7aynLwODnU0vLXU/EgHRpjh6hijQ18l/Id+Nnt4UkfTdn2C7+ZheSSYAtdfe7A9xpWbVsMU8EXrALLtar2nI/Nsi1KmVVAfOkJ/a7LAt1nbTQvEjs5J34aauyJFCpWN/72A1csp0KEoCrsttRQ+LTNWOXbrH8MU3e0TmP6oZA86AhTfs2MTdawl9iUslz+kNDR6IxWR7CvWc4pWl3XNHmpJZgeqdKw4KYQ5R0VJo3xcVH3mKcT2nt0
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(122000001)(4326008)(71200400001)(33656002)(186003)(8676002)(38100700002)(6916009)(83380400001)(5660300002)(508600001)(26005)(76116006)(8936002)(2906002)(7696005)(86362001)(64756008)(52536014)(66556008)(66946007)(66476007)(53546011)(6506007)(66446008)(54906003)(55016002)(38070700005)(316002)(2004002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4569
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	623be939-30f4-4383-f6a4-08d980d680d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HGFg+yyqK/iahVHYRdjkLJf7mxHYNEmFODYNAbz6aHP9QPS4RTuBH6wfgUEEnDvHACENH2eVM63KzPP7ts3J2MLwCvUM8uG88+LLwyz/96zIoyY6eH1QZZxC/o8QFn9jyrcmeLoH7WEGuuAfZWNxd6wE63kq3PmjTh7EwSfZk2Z5cV8GKId1ZW/BWBsd07xXdrj72wp5D5p31T5+SuNXU1KRh9Fp3yHqTpyfmd91+1kgjKMczmC5tacEQ92QwP474BhgDRp6XRV3dnNcHcyNMcom0FBpjbsdDqayUwgkemCHWyr7fW8g4nJxFcGGpWREcIDLoGPVBXXrckm/22MynVS6jYUCdFv3syo84j/fpcY5ToipdZUoAsCsbX1u8zE3zW+kyRueX7YUET72mC0ItyMpGUfFJvNVC9bhd/IuMFn7LnfuFCcf4eH7KH4OiaAo9bIdegEMG+SNF3+m5TvyZ0VE37jmc3QTnXDeT4tZlOY62tefYufNh+s5Rd4vRlK4WblnViobC8s2sszt/JujJiCa8W/SgJyU6e4cNhgbaJxUXAruVnw2KWZcoMDDCEiXktZX3LQoMVNRZAt1G5S5Gvw6Ss+YUFiKuYANMPb+NsQUaukY+cgta0wAUWcrfHbFCIb7casxvEv3qYaEHtlPI4bGMrLB+hxPj4qWI+tZekMUAA0yh88DJDjTHLa5H5IY3XELtRAg9aFvkIHUe6kKZMuAWn6dbd1Qw0g8IMPZd6R1vC4CiCOIFzX6J7bS77tsFKPeYmpxkkirCse6pSUY4Lt+CtW6KpIzCKAlSxdwsGuokSqQu3hnb4jekB0RvxZd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(70206006)(336012)(26005)(52536014)(6862004)(36860700001)(81166007)(316002)(86362001)(508600001)(54906003)(2906002)(33656002)(83380400001)(9686003)(186003)(53546011)(55016002)(8936002)(6506007)(47076005)(8676002)(5660300002)(356005)(82310400003)(4326008)(7696005)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 10:15:16.1375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5e4d77-075b-49a8-9280-08d980d68929
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1942

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMeW5tDnmnIgyNeaXpSAzOjM2
DQo+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7IGp1bGllbkB4ZW4ub3JnOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+DQo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggMjMvMzddIHhlbi9hcm06IGlt
cGxlbWVudCBub2RlIGRpc3RhbmNlIGhlbHBlcnMgZm9yDQo+IEFybQ0KPiANCj4gT24gRnJpLCAy
NCBTZXAgMjAyMSwgV2VpIENoZW4gd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPiA+ID4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSA5OjQ3DQo+ID4gPiBUbzogV2VpIENo
ZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+ID4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOw0KPiBqdWxpZW5AeGVuLm9yZzsNCj4gPiA+
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gPiA+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMjMvMzddIHhlbi9hcm06IGltcGxlbWVudCBub2RlIGRpc3RhbmNlIGhl
bHBlcnMNCj4gZm9yDQo+ID4gPiBBcm0NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIDIzIFNlcCAyMDIx
LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiA+ID4gV2Ugd2lsbCBwYXJzZSBOVU1BIG5vZGVzIGRpc3Rh
bmNlcyBmcm9tIGRldmljZSB0cmVlIG9yIEFDUEkNCj4gPiA+ID4gdGFibGUuIFNvIHdlIG5lZWQg
YSBtYXRyaXggdG8gcmVjb3JkIHRoZSBkaXN0YW5jZXMgYmV0d2Vlbg0KPiA+ID4gPiBhbnkgdHdv
IG5vZGVzIHdlIHBhcnNlZC4gQWNjb3JkaW5nbHksIHdlIHByb3ZpZGUgdGhpcw0KPiA+ID4gPiBu
b2RlX3NldF9kaXN0YW5jZSBBUEkgZm9yIGRldmljZSB0cmVlIG9yIEFDUEkgdGFibGUgcGFyc2Vy
cw0KPiA+ID4gPiB0byBzZXQgdGhlIGRpc3RhbmNlIGZvciBhbnkgdHdvIG5vZGVzIGluIHRoaXMg
cGF0Y2guDQo+ID4gPiA+IFdoZW4gTlVNQSBpbml0aWFsaXphdGlvbiBmYWlsZWQsIF9fbm9kZV9k
aXN0YW5jZSB3aWxsIHJldHVybg0KPiA+ID4gPiBOVU1BX1JFTU9URV9ESVNUQU5DRSwgdGhpcyB3
aWxsIGhlbHAgdXMgYXZvaWQgZG9pbmcgcm9sbGJhY2sNCj4gPiA+ID4gZm9yIGRpc3RhbmNlIG1h
eHRyaXggd2hlbiBOVU1BIGluaXRpYWxpemF0aW9uIGZhaWxlZC4NCj4gPiA+ID4NCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogV2VpIENoZW4gPHdlaS5jaGVuQGFybS5jb20+DQo+ID4gPiA+IC0tLQ0K
PiA+ID4gPiAgeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgfCAgMSArDQo+ID4gPiA+ICB4ZW4v
YXJjaC9hcm0vbnVtYS5jICAgICAgICB8IDY5DQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gPiA+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCB8IDEzICsr
KysrKysNCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKQ0KPiA+ID4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9udW1hLmMNCj4gPiA+ID4NCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9NYWtlZmlsZSBiL3hlbi9hcmNoL2FybS9NYWtl
ZmlsZQ0KPiA+ID4gPiBpbmRleCBhZTRlZmJmNzZlLi40MWNhMzExYjZiIDEwMDY0NA0KPiA+ID4g
PiAtLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gPiA+ID4gKysrIGIveGVuL2FyY2gvYXJt
L01ha2VmaWxlDQo+ID4gPiA+IEBAIC0zNSw2ICszNSw3IEBAIG9iai0kKENPTkZJR19MSVZFUEFU
Q0gpICs9IGxpdmVwYXRjaC5vDQo+ID4gPiA+ICBvYmoteSArPSBtZW1fYWNjZXNzLm8NCj4gPiA+
ID4gIG9iai15ICs9IG1tLm8NCj4gPiA+ID4gIG9iai15ICs9IG1vbml0b3Iubw0KPiA+ID4gPiAr
b2JqLSQoQ09ORklHX05VTUEpICs9IG51bWEubw0KPiA+ID4gPiAgb2JqLXkgKz0gcDJtLm8NCj4g
PiA+ID4gIG9iai15ICs9IHBlcmNwdS5vDQo+ID4gPiA+ICBvYmoteSArPSBwbGF0Zm9ybS5vDQo+
ID4gPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbnVtYS5jIGIveGVuL2FyY2gvYXJtL251
bWEuYw0KPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiBpbmRleCAwMDAwMDAw
MDAwLi4zZjA4ODcwZDY5DQo+ID4gPiA+IC0tLSAvZGV2L251bGwNCj4gPiA+ID4gKysrIGIveGVu
L2FyY2gvYXJtL251bWEuYw0KPiA+ID4gPiBAQCAtMCwwICsxLDY5IEBADQo+ID4gPiA+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ID4gPiArLyoNCj4gPiA+ID4gKyAq
IEFybSBBcmNoaXRlY3R1cmUgc3VwcG9ydCBsYXllciBmb3IgTlVNQS4NCj4gPiA+ID4gKyAqDQo+
ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjEgQXJtIEx0ZA0KPiA+ID4gPiArICoNCj4gPiA+
ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0
ZSBpdCBhbmQvb3INCj4gbW9kaWZ5DQo+ID4gPiA+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMg0KPiBhcw0KPiA+ID4gPiAr
ICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uDQo+ID4gPiA+ICsg
Kg0KPiA+ID4gPiArICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRo
YXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+ID4gPiA+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFO
VFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPiA+ID4gPiArICogTUVS
Q0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRo
ZQ0KPiA+ID4gPiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWls
cy4NCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBj
b3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMNCj4gTGljZW5zZQ0KPiA+ID4gPiArICogYWxv
bmcgd2l0aCB0aGlzIHByb2dyYW0uIElmIG5vdCwgc2VlDQo+IDxodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4NCj4gPiA+ID4gKyAqDQo+ID4gPiA+ICsgKi8NCj4gPiA+ID4gKyNpbmNsdWRl
IDx4ZW4vaW5pdC5oPg0KPiA+ID4gPiArI2luY2x1ZGUgPHhlbi9udW1hLmg+DQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK3N0YXRpYyB1aW50OF90IF9fcmVhZF9tb3N0bHkNCj4gPiA+ID4gK25vZGVfZGlz
dGFuY2VfbWFwW01BWF9OVU1OT0RFU11bTUFYX05VTU5PREVTXSA9IHsNCj4gPiA+ID4gKyAgICB7
IDAgfQ0KPiA+ID4gPiArfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArdm9pZCBfX2luaXQgbnVtYV9z
ZXRfZGlzdGFuY2Uobm9kZWlkX3QgZnJvbSwgbm9kZWlkX3QgdG8sIHVpbnQzMl90DQo+ID4gPiBk
aXN0YW5jZSkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKyAgICBpZiAoIGZyb20gPj0gTUFYX05VTU5P
REVTIHx8IHRvID49IE1BWF9OVU1OT0RFUyApDQo+ID4gPiA+ICsgICAgew0KPiA+ID4gPiArICAg
ICAgICBwcmludGsoS0VSTl9XQVJOSU5HDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAiTlVNQTog
aW52YWxpZCBub2RlczogZnJvbT0lIlBSSXU4IiB0bz0lIlBSSXU4Ig0KPiA+ID4gTUFYPSUiUFJJ
dTgiXG4iLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgZnJvbSwgdG8sIE1BWF9OVU1OT0RFUyk7
DQo+ID4gPiA+ICsgICAgICAgIHJldHVybjsNCj4gPiA+ID4gKyAgICB9DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKyAgICAvKiBOVU1BIGRlZmluZXMgMHhmZiBhcyBhbiB1bnJlYWNoYWJsZSBub2RlIGFu
ZCAwLTkgYXJlDQo+IHVuZGVmaW5lZA0KPiA+ID4gKi8NCj4gPiA+ID4gKyAgICBpZiAoIGRpc3Rh
bmNlID49IE5VTUFfTk9fRElTVEFOQ0UgfHwNCj4gPiA+ID4gKyAgICAgICAgKGRpc3RhbmNlID49
IE5VTUFfRElTVEFOQ0VfVURGX01JTiAmJg0KPiA+ID4gPiArICAgICAgICAgZGlzdGFuY2UgPD0g
TlVNQV9ESVNUQU5DRV9VREZfTUFYKSB8fA0KPiA+ID4gPiArICAgICAgICAoZnJvbSA9PSB0byAm
JiBkaXN0YW5jZSAhPSBOVU1BX0xPQ0FMX0RJU1RBTkNFKSApDQo+ID4gPiA+ICsgICAgew0KPiA+
ID4gPiArICAgICAgICBwcmludGsoS0VSTl9XQVJOSU5HDQo+ID4gPiA+ICsgICAgICAgICAgICAg
ICAiTlVNQTogaW52YWxpZCBkaXN0YW5jZTogZnJvbT0lIlBSSXU4IiB0bz0lIlBSSXU4Ig0KPiA+
ID4gZGlzdGFuY2U9JSJQUkl1MzIiXG4iLA0KPiA+ID4gPiArICAgICAgICAgICAgICAgZnJvbSwg
dG8sIGRpc3RhbmNlKTsNCj4gPiA+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+ID4gPiArICAgIH0N
Cj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIG5vZGVfZGlzdGFuY2VfbWFwW2Zyb21dW3RvXSA9IGRp
c3RhbmNlOw0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+ICt1aW50OF90IF9fbm9kZV9k
aXN0YW5jZShub2RlaWRfdCBmcm9tLCBub2RlaWRfdCB0bykNCj4gPiA+ID4gK3sNCj4gPiA+ID4g
KyAgICAvKiBXaGVuIE5VTUEgaXMgb2ZmLCBhbnkgZGlzdGFuY2Ugd2lsbCBiZSB0cmVhdGVkIGFz
IHJlbW90ZS4gKi8NCj4gPiA+ID4gKyAgICBpZiAoIHNyYXRfZGlzYWJsZWQoKSApDQo+ID4gPg0K
PiA+ID4gR2l2ZW4gdGhhdCB0aGlzIGlzIEFSTSBzcGVjaWZpYyBjb2RlIGFuZCBzcGVjaWZpYyB0
byBBQ1BJLCBJIGRvbid0DQo+IHRoaW5rDQo+ID4gPiB3ZSBzaG91bGQgaGF2ZSBhbnkgY2FsbCB0
byBzb21ldGhpbmcgY2FsbGVkICJzcmF0X2Rpc2FibGVkIi4NCj4gPiA+DQo+ID4gPiBJIHN1Z2dl
c3QgdG8gZWl0aGVyIHJlbmFtZSBzcmF0X2Rpc2FibGVkIHRvIG51bWFfZGlzdGFuY2VfZGlzYWJs
ZWQuDQo+ID4gPg0KPiA+ID4gT3RoZXIgdGhhbiB0aGF0LCB0aGlzIHBhdGNoIGxvb2tzIE9LIHRv
IG1lLg0KPiA+ID4NCj4gPg0KPiA+IHNyYXQgc3RhbmRzIGZvciBzdGF0aWMgcmVzb3VyY2UgYWZm
aW5pdHkgdGFibGUsIEkgdGhpbmsgZHRiIGFsc28gY2FuIGJlDQo+ID4gdHJlYXRlZCBhcyBhIHN0
YXRpYyByZXNvdXJjZSBhZmZpbml0eSB0YWJsZS4gU28gSSBrZWVwIFNSQVQgaW4gdGhpcw0KPiBw
YXRjaA0KPiA+IGFuZCBvdGhlciBwYXRjaGVzLiBJIGhhdmUgc2VlbiB5b3VyIGNvbW1lbnQgaW4g
cGF0Y2gjMjUuIEJlZm9yZSB4ODYNCj4gbWFpbnRhaW5lcnMNCj4gPiBnaXZlIGFueSBmZWVkYmFj
aywgY2FuIHdlIHN0aWxsIGtlZXAgc3JhdCBoZXJlPw0KPiANCj4gSmFuIGFuZCBJIHJlcGxpZWQg
aW4gdGhlIG90aGVyIHRocmVhZC4gSSB0aGluayB0aGF0IGluIHdhcm5pbmcgbWVzc2FnZXMNCj4g
IlNSQVQiIHNob3VsZCBub3QgYmUgbWVudGlvbmVkIHdoZW4gYm9vdGluZyBmcm9tIERULiBJZGVh
bGx5IGZ1bmN0aW9ucw0KPiBuYW1lcyBhbmQgdmFyaWFibGVzIHNob3VsZCBiZSByZW5hbWVkIHRv
byB3aGVuIHNoYXJlZCBiZXR3ZWVuIEFDUEkgYW5kDQo+IERUIGJ1dCBpdCBpcyBsZXNzIGNyaXRp
Y2FsLCBhbmQgaXQgaXMgZmluZSBpZiB5b3UgZG9uJ3QgZG8gdGhhdCBpbiB0aGUNCj4gbmV4dCB2
ZXJzaW9uLg0KDQpUaGFua3MuIEknbGwgbGVhdmUgaXQgYXMgaXQgaXMsIGlmIEkgZG8gbm90IGhh
dmUgYSBiZXR0ZXIgbmFtZS4NCg==

