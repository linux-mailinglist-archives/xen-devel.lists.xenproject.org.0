Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E8676F171
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 20:07:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576561.902829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRcit-0002Zr-85; Thu, 03 Aug 2023 18:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576561.902829; Thu, 03 Aug 2023 18:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRcit-0002XL-51; Thu, 03 Aug 2023 18:06:55 +0000
Received: by outflank-mailman (input) for mailman id 576561;
 Thu, 03 Aug 2023 18:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3G/A=DU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qRcir-0002XF-So
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 18:06:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84f67584-3228-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 20:06:51 +0200 (CEST)
Received: from AS9P250CA0020.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::22)
 by AS8PR08MB8088.eurprd08.prod.outlook.com (2603:10a6:20b:54d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 18:06:40 +0000
Received: from AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::60) by AS9P250CA0020.outlook.office365.com
 (2603:10a6:20b:532::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20 via Frontend
 Transport; Thu, 3 Aug 2023 18:06:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT033.mail.protection.outlook.com (100.127.140.129) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Thu, 3 Aug 2023 18:06:39 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Thu, 03 Aug 2023 18:06:39 +0000
Received: from 2e2846a2a2f2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C3B7C74-AF05-451D-9674-82FD4823A748.1; 
 Thu, 03 Aug 2023 18:05:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2e2846a2a2f2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Aug 2023 18:05:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9737.eurprd08.prod.outlook.com (2603:10a6:20b:607::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 18:05:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 18:05:53 +0000
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
X-Inumbo-ID: 84f67584-3228-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0NtMGP5Ni8N6PrPUiOBVIbo4Ed4wZldRchR3+VrtTE=;
 b=LnAHnzioTRSuoJfVu0jfG4WDc9/Hdt4ti+oIJXvRkbzVT83NIwFojKVp5vWFZC2x9XRTLdn+xQARNBDwv15PWBDw/xfCVMbBT1t8pRXAWhTQ5MyZ0kc8tWclBsapFXZDZ1svjIEaQDKwoV5VDI6TW3xezzjY/NdJ+F1CozIcV30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 204ea91710035784
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwqhfP3G9aRsrME8GbCft44S5za4Apnwfd3qqf7aETi+XpYhl9me9grfj4fsLMDzbi4cID4sTft80c7qR0wcxx++kixfIp9jHj/5uI2DDPLjP+iKWfNprkMfgRjgE5iOEImQ/fOM37I88Nd+zKhj28du2VbW9SApeVD1aS+51+mJiiU0wF+DrLdexropt5u+fxdpHdBWljJDmmfzJrANmBZGxISiewKn0gtD0Ut8f84P9XYLCxxkxHtVcLFNnLQ0bWo6HxxoWENUvBGCR/P3GzikimykauYvJNW+RqOMy/+JS4e2WJtADl/2XGzTwCWREV1XYhkRS8xED168a3PNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0NtMGP5Ni8N6PrPUiOBVIbo4Ed4wZldRchR3+VrtTE=;
 b=ZGVv2yjOBsmvKkDhIMcEa7urmMTNMMUqCNCjliQv4hua1xaknrFVEDCCdrpXuk42m33brLXSYtZNyxRUfJ9R47vUm7S91hcV/fLU9nb90b6PcqHiRGgMjU6YvIJD+ayLs5U7JMZkOtdUYMDtvw4mXcRFmbe9gKjEwQ1xeNMfPPtQVyT53vJKlP7FFO0oMikAcF+JVn8WXn4hwtjmwFu6YPuJHuJXbHP/4qzEyW+FpSwfKi0JQ2O/t2/kYQnlnqHWE/+7OFbGIZPbTLwK+tP/6SlK3jKNPG7bAKWzMlIN+JgL7KYsWwEvKnLQrDaLK69ObAzfuagxYoRaGVme6ZDZNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0NtMGP5Ni8N6PrPUiOBVIbo4Ed4wZldRchR3+VrtTE=;
 b=LnAHnzioTRSuoJfVu0jfG4WDc9/Hdt4ti+oIJXvRkbzVT83NIwFojKVp5vWFZC2x9XRTLdn+xQARNBDwv15PWBDw/xfCVMbBT1t8pRXAWhTQ5MyZ0kc8tWclBsapFXZDZ1svjIEaQDKwoV5VDI6TW3xezzjY/NdJ+F1CozIcV30=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Topic: [PATCH v2 2/2] fdt: make fdt handling reusable across arch
Thread-Index: AQHZxfetD3iMBVO78kiKHyDm3xOwK6/Y3kwA
Date: Thu, 3 Aug 2023 18:05:52 +0000
Message-ID: <CA8E22A7-D7E4-43E8-BE4E-D2C2B41D921C@arm.com>
References: <20230803104438.24720-1-dpsmith@apertussolutions.com>
 <20230803104438.24720-3-dpsmith@apertussolutions.com>
In-Reply-To: <20230803104438.24720-3-dpsmith@apertussolutions.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB9737:EE_|AM7EUR03FT033:EE_|AS8PR08MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: a387b45c-033a-45e0-ddef-08db944c62b7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XWC3wZBQLrbJLJ37zhcd5WFCAj/a4zDdzncRJsYDyC6q1vNDGm8H0MzHNu9ImQYdd6qtR+Xg9s+fhts/dS5iCPxJ/WNoETyYTF8Gg8NreioMBprp8eBIyCmZd42KD8/Z+ksCCU8V4EXl1tNr1PVcNR4EnT9TGVgiSmOwS6iWHXrDjqHAPz++WH7/0TNJzyay3MbYxlCq6fIuDmgIAm3x0IuHJzOaIDCEptSulhBALxzO+yNA2dnp0jPiqP3RR8homtMW3/QBE2uUbVQpt1uFqwqJR8PmbZN3QsplZGGZt+CRMugvHSAV4srhxZvaUMM+mFdNWseFdFOiHpm9XbXxnwSM36V/AQ4Ds7PQRwShf9O75r24kSyvOJ/wgFdoQkCF0JfVi2zCgYSThMkk6z7wYlmqWxMJXgzu4NAAl3Kx0rzVW+QnxTrUmv4RHRz9e0vzweO4ndlO1NNUbRl2kQ6RPLcUUrU1/vZ/UanPFAUDGAXH6AKAiMA4jsav2eKeGXQG9ABWiyaBKMOZYo1vGgmjrZAinxMhKndsYJlGBzvnAk4bLCL2+bxcj0jyHMo9HhKSCdfjvXVkLsCRnaieXnvoH7WIY1pZ6wy4u7wQ+tJuom4Kjah7OL/LtiNoo1IL1lSsj2R3rLt1tZINFXAv99UVlwbnGuBVl/R0DxvOcGmBlgk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(451199021)(2616005)(6506007)(41300700001)(26005)(186003)(8676002)(8936002)(66556008)(2906002)(91956017)(4326008)(76116006)(64756008)(66946007)(5660300002)(6916009)(316002)(66446008)(66476007)(6486002)(71200400001)(6512007)(478600001)(54906003)(38100700002)(122000001)(33656002)(86362001)(36756003)(38070700005)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <738C3F0E0AA8A24E8E19EB4F09354148@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9737
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7508740e-ef7b-4d1f-a759-08db944c46bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1U/z/7Pc3YcfiqBBehOnFP6/GEhSVQc7zK8GY+yRndkrZu1GPXhPVGxy442SxGGWXi6DRdhpJLwXz6pq/xCr5JFLanFL2RyifLwno2tzZNePz+ZAxjCyHem2qL6hMCmp9kWNsPRSIcjtVh+do5eghPjtWw0SqZdB33E4rte+F0deZuL6FslDDM1FbGF7Pb3EsYq6wp45Az8y81Ls9BunSfOekgDfqbg9NBieEMWVPlxZ3sdrTHTZguYQj5claq8gRhqEXqKGmf+Yfe8UZOjDdEa+49pgVgLAOPHrcKrp38arUzKj6LgmzlyUSNQpcJngMHPBycn/0ulgeRcPd9J9K/EbLlL9M9GqDi2BF7JoBt+v7V+/NY79ZYPvne/TtDY7YB+NHy/ym3u+RwFni7zWgGvJqezPQQiVuFd3vQt3eFN7eQJirAyUyPnrN701v0WTyspwXaVmoMmQGOouj6F9gOEs1SECv1e9zjRqyxF8MSGP/YsoHHVUCO/H39opo8EN3iOIMUtukwVRSPeEybdlDsq35zEJXwzTWB2z2kuX2TSVoqE7VtjG/ET7EU+oNZljpoYZ0UgzJs6XhTYrQJWS5JzL5PSmBfrR3bo9d9us3bYYDxQk4gc+ZYakwJSF1itf0orli6rcd4yOeGthajm6qOdKC1JcVdNpeY1K2Wk1yJWoeGRJ88Z2u6lujWmZ9/NuQX+iQW9pvkzSDnokPI3kiQQwq3YysDQ/bPpVgrYAcJnqbt55F5Db8KM975n8kwPr
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(36756003)(33656002)(86362001)(82740400003)(40460700003)(40480700001)(54906003)(478600001)(81166007)(356005)(47076005)(2616005)(6506007)(336012)(186003)(26005)(6862004)(41300700001)(8936002)(8676002)(6512007)(6486002)(316002)(36860700001)(70586007)(4326008)(5660300002)(70206006)(2906002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 18:06:39.7230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a387b45c-033a-45e0-ddef-08db944c62b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8088

SGkgRGFuaWVsLA0KDQpbLi4uXQ0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9mZHQuYyBiL3hl
bi9jb21tb24vZmR0LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAw
MC4uOGQ3YWNhYWE0Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3hlbi9jb21tb24vZmR0LmMN
Cj4gQEAgLTAsMCArMSwxNTMgQEANCj4gKy8qDQo+ICsgKiBGbGF0dGVuZWQgRGV2aWNlIFRyZWUN
Cj4gKyAqDQo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTItMjAxNCBDaXRyaXggU3lzdGVtcywgSW5j
Lg0KPiArICoNCj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJl
ZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5DQo+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIHZlcnNpb24gMiBhcw0KPiArICogcHVibGlz
aGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uDQo+ICsgKi8NCg0KQ2FuIHlvdSBh
ZGQgYW4gZW1wdHkgbGluZSBoZXJlLCBJIHRoaW5rIGl0IGltcHJvdmVzIHJlYWRhYmlsaXR5LCBJ
IGtub3cgdGhhdCBzb21lIG90aGVyDQpoZWFkZXJzIGRvbuKAmXQgYWRkIGl0IHVuZm9ydHVuYXRl
bHkNCg0KPiArI2luY2x1ZGUgPHhlbi9mZHQuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0K
PiArI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4gKyNpbmNsdWRlIDx4ZW4vbGliZmR0L2xpYmZkdC5o
Pg0KPiArI2luY2x1ZGUgPHhlbi90eXBlcy5oPg0KPiArDQo+ICtib29sIF9faW5pdCBkZXZpY2Vf
dHJlZV9ub2RlX21hdGNoZXMoDQo+ICsgICAgY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwgY29u
c3QgY2hhciAqbWF0Y2gpDQo+ICt7DQpbLi4uXQ0KDQpFbXB0eSBsaW5lDQoNCj4gKyNpZm5kZWYg
X19YRU5fRkRUX0hfXw0KPiArI2RlZmluZSBfX1hFTl9GRFRfSF9fDQo+ICsNCj4gKyNpbmNsdWRl
IDx4ZW4vaW5pdC5oPg0KPiArI2luY2x1ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+DQo+ICsjaW5j
bHVkZSA8eGVuL3R5cGVzLmg+DQoNCkZvciB0aGUgbmV3IGZpbGVzLCBhcGFydCBmcm9tIE1pY2hh
bOKAmXMgY29tbWVudHMsIGlmIEkgcmVtZW1iZXIgY29ycmVjdGx5IGluIHRoZSBwYXN0IEkgd2Fz
IGFza2VkDQp0byBhZGQgdGhlc2UgbGluZXMgdG8gdGhlIGVuZCBvZiB0aGUgZmlsZToNCg0KLyoN
CiogTG9jYWwgdmFyaWFibGVzOg0KKiBtb2RlOiBDDQoqIGMtZmlsZS1zdHlsZTogIkJTRCINCiog
Yy1iYXNpYy1vZmZzZXQ6IDQNCiogaW5kZW50LXRhYnMtbW9kZTogbmlsDQoqIEVuZDoNCiovDQoN
ClJlZ2FyZGluZyB0aGUgY29kaW5nIHN0eWxlLCBJIHRoaW5rIGl04oCZcyBiZXR0ZXIgdG8ga2Vl
cCB0aGUgc3R5bGUgeW914oCZdmUgZm91bmQgaW4gdGhlIG9yaWdpbmFsIGZpbGUsDQphbmQgY2hh
bmdlIG9ubHkgc29tZSBiaXRzIHdoZW4gdGhlIGNvZGUgaXMgbm90IGZvbGxvd2luZyBpdC4NCg0K
SSBrbm93IHRoZXJlIGlzIG5vdGhpbmcgZW5mb3JjaW5nIHBhcmFtZXRlcnMgb24gdGhlIHNhbWUg
bGluZSBvZiB0aGUgZnVuY3Rpb24gZGVmaW5pdGlvbiBhdCB0aGUNCm1vbWVudCwgYnV0IGl0IGlz
IGhvdyBpdOKAmXMgZG9uZSBmcm9tIHRoZSBvcmlnaW5hbCBmaWxlIHNvIEkgd291bGQgc3RpY2sg
d2l0aCBpdC4NCg0KUmVnYXJkaW5nIHRoZSB1MzIvdTY0IHR5cGVzLCBtYXliZSBzaW5jZSB5b3Ug
YXJlIG1vdmluZyB0aGUgY29kZSBpdCBjYW4gYmUgdGhlIG9jY2FzaW9uIHRvDQpjb252ZXJ0IHRo
ZW0sIGJ1dCBjaGVjayB3aXRoIHRoZSBtYWludGFpbmVyIGJlZm9yZS4NCg0KSeKAmXZlIGFsc28g
dGVzdGVkIHRoaXMgc2VyaWUgYW5kIGl0IHdvcmtzIGZpbmUhIEnigJltIG5vdCBsZWF2aW5nIGFu
eSB0YWcgYmVjYXVzZSB0aGlzIHBhdGNoIGlzIGdvaW5nIHRvDQpjaGFuZ2UgYW55d2F5Lg0KDQpD
aGVlcnMsDQpMdWNhDQoNCg==

