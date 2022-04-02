Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD04F006B
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 12:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297776.507290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naaoc-0003l7-HX; Sat, 02 Apr 2022 10:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297776.507290; Sat, 02 Apr 2022 10:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naaoc-0003jA-E2; Sat, 02 Apr 2022 10:17:06 +0000
Received: by outflank-mailman (input) for mailman id 297776;
 Sat, 02 Apr 2022 10:17:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Uhr=UM=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1naaob-0003j4-50
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 10:17:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083aa671-b26e-11ec-a405-831a346695d4;
 Sat, 02 Apr 2022 12:17:01 +0200 (CEST)
Received: from AS9PR06CA0190.eurprd06.prod.outlook.com (2603:10a6:20b:45d::12)
 by HE1PR0802MB2394.eurprd08.prod.outlook.com (2603:10a6:3:dd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Sat, 2 Apr
 2022 10:16:52 +0000
Received: from AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::c2) by AS9PR06CA0190.outlook.office365.com
 (2603:10a6:20b:45d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.29 via Frontend
 Transport; Sat, 2 Apr 2022 10:16:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT045.mail.protection.outlook.com (10.152.17.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Sat, 2 Apr 2022 10:16:51 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Sat, 02 Apr 2022 10:16:51 +0000
Received: from c133a11b770e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2B5490A2-39A0-47D3-ADED-36153F243760.1; 
 Sat, 02 Apr 2022 10:16:45 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c133a11b770e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 02 Apr 2022 10:16:45 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by HE1PR08MB2649.eurprd08.prod.outlook.com (2603:10a6:7:2b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Sat, 2 Apr
 2022 10:16:24 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::28c0:3e8d:dd75:80be%8]) with mapi id 15.20.5123.030; Sat, 2 Apr 2022
 10:16:23 +0000
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
X-Inumbo-ID: 083aa671-b26e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDq3jqDKdD2znKf6w6nvM2pa6p9pftFfu0HJJoqqYjo=;
 b=H4XJLfd4Um4aTxu5WwWz6ukinD/t6aVRVByzBrVswEtMoCsBbY1tT/ouP5irZg3l/g+5A3vaNiNqO86NsMoBDOMF5OCbcSSOkn/ssgCYkbW4UyR4X4BmQbxNhUwbUqVlXhePl5G1dXvvko9EuYRL0CsqqxdlmGbIkHefo4XsKds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcNbVMLBlKekgN07hc5+SaSWyZBnKwFL6X0b5apuEmWVqRqZs9PfW81idtRgXsH4SdF+1jGFggvUSD3GSFaeswk4Ue2jgSFeJf+V8onDyb7WCHwLDbqzgEeUSzdEJa67C5ahZj/eurIdiQb454nbWD9rvrSvzIw/WYujpvKFSJRpqYgS6I5se3K10kp3dyViCqbd+bau9yz0uLy85cSH9R30kg49t0mq8FXUe818bIxk4kVpiRRRbfUj1FK3Co2WXumdE/0QboVv04heWYzhAjgjeYLLU3LmolwD3RpK9Q4UUZPLOcWl+NozZAVnHWsIXlUbdTf/AdolSphBYFP4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDq3jqDKdD2znKf6w6nvM2pa6p9pftFfu0HJJoqqYjo=;
 b=H9v6rbOgoU4/D5AGRy+2mqnFfh/BdHWYa0qvLw0RdVwVUluomqWq/sL97790d/x0wJcwDQuKtwQ4XDxOmLVMkthX6dqnzYWHFIbktVF9uS5X+SxZL5d7UBDRGn5y23UZz7YFdJhZcq/4lKpkP3UGuIWZ+oDt0NE67QUz/NiNr1ETp6MGYArRYZV9MrANOpsoGiZj7VhCW6ndHHEwtFYaHAExLr/35Qls+lOsYE1jhyfJ5wRiKDjRm26Yng0i/t/kSMj17kG8gXOqC8rVxWnWKUePLjcAacmDrNOjKUdVua/XfwZ04fwnFUfzXKxy5/ZPWEtZJcFELzKu9MNkjOc0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDq3jqDKdD2znKf6w6nvM2pa6p9pftFfu0HJJoqqYjo=;
 b=H4XJLfd4Um4aTxu5WwWz6ukinD/t6aVRVByzBrVswEtMoCsBbY1tT/ouP5irZg3l/g+5A3vaNiNqO86NsMoBDOMF5OCbcSSOkn/ssgCYkbW4UyR4X4BmQbxNhUwbUqVlXhePl5G1dXvvko9EuYRL0CsqqxdlmGbIkHefo4XsKds=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Thread-Topic: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
Thread-Index:
 AQHYRBnkeXnYvoANH0WdfY8GUNrlN6zXr5KAgAEgZ0CAAENNAIAAARVQgAJXEYCAANs8kA==
Date: Sat, 2 Apr 2022 10:16:21 +0000
Message-ID:
 <DU2PR08MB73256608FCF12AEF54AEAE7DF7E39@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
 <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <eba664e6-4146-426b-5119-59fe02a96bb5@suse.com>
 <DU2PR08MB7325D94A0BFFC2A3BB0AFF08F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <6ae9a1f9-4167-46d2-df9b-9d7f626fa247@xen.org>
In-Reply-To: <6ae9a1f9-4167-46d2-df9b-9d7f626fa247@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AF928C687A24A14F9451BCF188FEEFC7.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7c064529-aadb-43da-384c-08da1491e7bc
x-ms-traffictypediagnostic:
	HE1PR08MB2649:EE_|AM5EUR03FT045:EE_|HE1PR0802MB2394:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2394ACE606EAFD2CD8C0E3D1F7E39@HE1PR0802MB2394.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2lZsV+Z41hY3g/JMbm/DYV9KlTb5DTjjC609zvipCVyAv35TX2CB7mbu9sxIgt3e6k167NR+kQ+kqUaZ4BxETFzGVFoM0kuyoqgts+7DJaeekSp1BI+F1cJBtADW6pAVXrmUEwTUDy63vLErobSBDSLIVNJTGps9JhpWAPvacnL1hYU8pIY6eHZrQM7G7y4wIt6kSuFeUs3/0jcbXNj89NmgRLy22RbOaq3YwAvDE+6V2PKzjhMxX8PPz+74Ev3nRskAkmYlBe45vaSxHZbowgK9E8YBuGPhLDAQek27zR2wWkxZozI82RiImeCgCeEl5jHIexgAFt+4nVC6Tp6QdO7+nknytcJszIk+DX54y8ZbwYFtdywtaPbpYeCEF1cVzlxZ/mcCZGbFQ58+Nxpc74DzOi3PIpFOCvQD+GNihRLClJzW8jd2or/o5BZCBemnfoX5YAWq0ktUXarmk7JI4eWzvFMpkuRsdZjYqpTwlUWuxkz+yyaLJz0gNhwXneZUL2J+tleUe6oZLS8qaW7jIDo5ud7J6JGe2DijPXiW8dV4hYumApZEQwSm0e7m3+/AxEUzOGnD0ukHWB69V959noVeZEpqjgVItRF5uPMBh1lOfZRPr6oBV2PN94Mvsa/vTnK8V92VDigZSzZbXJzNhdntwLU/Da+T+rs44MuScXkciowwsYj5H1GC5dKP/D6ZyjyWItiXgaXQ4ncpogPCvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(83380400001)(8936002)(53546011)(52536014)(7696005)(6506007)(2906002)(186003)(4326008)(316002)(33656002)(86362001)(110136005)(54906003)(5660300002)(38070700005)(38100700002)(508600001)(122000001)(26005)(71200400001)(9686003)(66556008)(8676002)(66946007)(66476007)(66446008)(76116006)(64756008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2649
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	14003cdd-142f-4171-26fa-08da1491d724
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9jRuuBi/wJCuM82SQnlUtiyUVNDAhJ0G4Nsnaychcgho3ahePVBPzhFpzNbNa1xJFibtKVafF61X9h9wVBe3rNfYe3dEBlY1vA4wawp7iM1OPPWt6GJtTqBDggXtAcT5H13FmCqNv0Czm7gbFezS5nK/YMj1lED+1lEmzDeRPdmfHyX2J1RsCO8sVzgF2ksfXoRzITjbkXBGfxxoDrrpXqAZfp7YTbvwoFQA8ySanVQxgDNPq6w67JOhH9eVC9O+LbUPi5TCtm+s6RNkga70qQ2zEgjaArspQY1kX9HPX1qn/vcRNPpFBM0ZG/BeL7lpsyWkFFip4lMCO0Gsa0NHvPiO1bwaKwDxDJgVrjltcTa25tMbCE13uycYIgrE95M1xI3k4wLVVJpzgkMHfJ3Jbs0J95gvUYCl/LoeR00xUrFKS8krxF56U3ZEi4/9NuViHhSOZRypiHUliKqsjWVbsOgZ8qaUzPPaX9jgbcRw0gxwRrmOLdSdVoBkQIv71zINzXskvqGIr10Rq4k1sjY8N+pvV+QxWw1tOECtcce2hXZWY15pmUt5AjUxey71DKWSluBxU6ZXwK3J3R9ZkTrMVtrxJvMR1IUKNXirlQoyvWhAE6NTI4Nv89Jfoo7NDUXk7FEeE67y3E+jpLkwzmxue8SQqRFcNXP0OvmZUvVG3+btnN6LteaYZGMX5NKvixdL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(82310400004)(186003)(26005)(83380400001)(81166007)(36860700001)(356005)(9686003)(2906002)(47076005)(336012)(40460700003)(86362001)(70586007)(55016003)(70206006)(53546011)(110136005)(8676002)(33656002)(508600001)(316002)(52536014)(4326008)(8936002)(5660300002)(7696005)(6506007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 10:16:51.6563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c064529-aadb-43da-384c-08da1491e7bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2394

SGkgSnVsaWVuIGFuZCBKYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgQXByaWwg
MiwgMjAyMiAyOjU0IEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gQ2M6IFdlaSBDaGVuIDxXZWkuQ2hl
bkBhcm0uY29tPjsgSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsNCj4gQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXANCj4gPGdlb3Jn
ZS5kdW5sYXBAY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IFdlaQ0KPiBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSAzLzVdIHhlbi9hcm06IHVucG9wdWxh
dGUgbWVtb3J5IHdoZW4gZG9tYWluIG9uDQo+IHN0YXRpYyBhbGxvY2F0aW9uDQo+IA0KPiBIaSBQ
ZW5ueSwNCj4gDQo+IE9uIDMxLzAzLzIwMjIgMTE6MzAsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IEFub3RoZXIgcmVhc29uIEkgd2FudCB0byBrZWVwIHBhZ2UgYWxsb2NhdGVkIGlzIHRoYXQgaWYg
cHV0dGluZyBwYWdlcw0KPiA+IGluIHJlc3ZfcGFnZV9saXN0IHVwb24gZHJvcHBpbmcgdGhlIGxh
c3QgcmVmLCB3ZSBuZWVkIHRvIGRvIGEgbG90DQo+ID4gdGhpbmdzIG9uIHBhZ2VzIHRvIHRvdGFs
bHkgbGV0IGl0IGZyZWUsIGxpa2Ugc2V0IGl0cyBvd25lciB0byBOVUxMLA0KPiA+IGNoYW5naW5n
IHBhZ2Ugc3RhdGUgZnJvbSBpbl91c2UgdG8gZnJlZSwgZXRjLg0KPiBUaGlzIGlzIG5vdCBvbmx5
IGFib3V0IG9wdGltaXphdGlvbiBoZXJlLiBCYWQgdGhpbmdzIGNhbiBoYXBwZW4gaWYgeW91IGxl
dCBhDQo+IHBhZ2UgaW4gc3RhdGUgZnJlZSB0aGF0IGlzIG5vdCBtZWFudCB0byBiZSB1c2VkIGJ5
IHRoZSBidWRkeSBhbGxvY2F0b3IgKGUuZy4gaXQNCj4gd2FzIHJlc2VydmVkIGZvciBzdGF0aWMg
bWVtb3J5KS4NCj4gDQo+IEkgZGlzY292ZXJlZCBpdCBlYXJsaWVyIHRoaXMgeWVhciB3aGVuIHRy
eWluZyB0byBvcHRpbWl6ZQ0KPiBpbml0X2hlYXBfcGFnZXMoKSBmb3IgTGl2ZS1VcGRhdGUuIEl0
IHdhcyBxdWl0ZSBoYXJkIHRvIGRlYnVnIGJlY2F1c2UgdGhlDQo+IGNvcnJ1cHRpb24gdmVyeSBy
YXJlbHkgaGFwcGVuZWQuIFNvIGxldCBtZSBleHBsYWluIGl0IGJlZm9yZSB5b3UgZmFjZSB0aGUg
c2FtZQ0KPiBpc3N1ZSA6KS4NCj4gDQo+IGZyZWVfaGVhcF9wYWdlcygpIHdpbGwgdHJ5IHRvIG1l
cmdlIHRoZSBhYm91dC10by1iZS1mcmVlZCBjaHVuayB3aXRoIHRoZQ0KPiBwcmVkZWNlc3NvciBh
bmQvb3Igc3VjY2Vzc29yLiBUbyBrbm93IGlmIHRoZSBwYWdlIGNhbiBiZSBtZXJnZWQsIHRoZQ0K
PiBhbGdvcml0aG0gaXMgbG9va2luZyBhdCB3aGV0aGVyIHRoZSBjaHVuayBpcyBzdWl0YWJseSBh
bGlnbmVkIChlLmcuIHNhbWUNCj4gb3JkZXIpIGFuZCBpZiB0aGUgcGFnZSBpcyBpbiBzdGF0ZSBm
cmVlLg0KPiANCj4gQUZBSUNULCB0aGUgcGFnZXMgYmVsb25naW5nIHRvIHRoZSBidWRkeSBhbGxv
Y2F0b3IgY291bGQgYmUgcmlnaHQgbmV4dCB0bw0KPiByZWdpb24gcmVzZXJ2ZWQgbWVtb3J5LiBT
byB0aGVyZSBpcyBhIHZlcnkgc2xpbSBjaGFuY2UgdGhhdA0KPiBmcmVlX2hlYXBfcGFnZXMoKSBt
YXkgZGVjaWRlIHRvIG1lcmdlIGEgY2h1bmsgZnJvbSB0aGUgc3RhdGljIHJlZ2lvbiB3aXRoDQo+
IHRoZSBhYm91dC10by1iZS1mcmVlIGNodW5rLiBOb3RoaW5nIHZlcnkgZ29vZCB3aWxsIGVuc3Vl
Lg0KPiANCg0KT2gsLCwgdGhhdCdzIGEgdGhvdXNhbmQgdHJ1ZS4NCklmIHRoZSBmcmVlIHN0YXRp
YyByZWdpb24gaXMgdGhlIGJ1ZGR5IG9mIHRoZSBhYm91dC10by1iZS1mcmVlIGNodW5rLCBjdXJy
ZW50DQpjb2RlIHdpbGwgbWVyZ2UgdGhlIHN0YXRpYyByZWdpb24gdG8gdGhlIGhlYXAsIHdoaWNo
IGlzIHVuYWNjZXB0YWJsZS4NCg0KSSdsbCBmaXggaXQgaW4gdGhpcyBwYXRjaCBzZXJpZSB0b28g
YW5kIEknbSBhbHNvIHByZWZlcnJpbmcgb3B0aW9uIDF+DQoNCkFuZCBmb3IgdW5wb3B1bGF0aW5n
IG1lbW9yeSBvbiBydW50aW1lLCBJJ2xsIGRvIHdoYXQgSmFuIHN1Z2dlc3RzLA0KYWRkaW5nIGEg
bmV3IGxvZ2ljIG9mIG1vdmluZyB0aGUgcGFnZSBmcm9tIGQtPnBhZ2VfbGlzdCB0bw0KZC0+cmVz
dl9wYWdlX2xpc3QgaW4gYXJjaF9mcmVlX2hlYXBfcGFnZSgpIGZvciByZXNlcnZlZCBwYWdlcy4g
DQoNCj4gVGVjaG5pY2FsbHksIHRoaXMgaXMgYWxyZWFkeSBhIGJ1ZyBpbiB0aGUgYWxyZWFkeSBt
ZXJnZWQgaW1wbGVtZW50YXRpb24gb2YgdGhlDQo+IHN0YXRpYyBtZW1vcnkgYWxsb2NhdG9yLg0K
PiANCj4gSSBjYW4gc2VlIHR3byB3YXlzIHRvIGZpeCBpdDoNCj4gICAgMSkgVXBkYXRlIGZyZWVf
aGVhcF9wYWdlcygpIHRvIGNoZWNrIHdoZXRoZXIgdGhlIHBhZ2UgaGFzIFBHQ19yZXNlcnZlZA0K
PiBzZXQuDQo+ICAgIDIpIFVzZSBhIGRpZmZlcmVudCBzdGF0ZSBmb3IgcGFnZXMgdXNlZCBieSB0
aGUgc3RhdGljIGFsbG9jYXRvci4NCj4gDQo+IFNvIGZhciBteSBwcmVmZXJlbmNlIGlzIGxlYW5p
bmcgdG93YXJkcyAxLiBCdXQgSSB3b3VsZCBsaWtlIHRvIGhlYXIgb3RoZXINCj4gb3BpbmlvbnMu
DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

