Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82A75007B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 09:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562023.878576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUgB-0002uL-Ix; Wed, 12 Jul 2023 07:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562023.878576; Wed, 12 Jul 2023 07:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJUgB-0002sg-GB; Wed, 12 Jul 2023 07:54:31 +0000
Received: by outflank-mailman (input) for mailman id 562023;
 Wed, 12 Jul 2023 07:54:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhes=C6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qJUg9-0002sa-Ve
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 07:54:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52db6c40-2089-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 09:54:27 +0200 (CEST)
Received: from AS9PR06CA0511.eurprd06.prod.outlook.com (2603:10a6:20b:49d::6)
 by DBAPR08MB5688.eurprd08.prod.outlook.com (2603:10a6:10:1a0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 07:54:24 +0000
Received: from AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::7) by AS9PR06CA0511.outlook.office365.com
 (2603:10a6:20b:49d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Wed, 12 Jul 2023 07:54:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT013.mail.protection.outlook.com (100.127.140.191) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 07:54:23 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145");
 Wed, 12 Jul 2023 07:54:23 +0000
Received: from 628d3ca79134.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A5866A66-DBA0-4B49-915C-E0BD451859EB.1; 
 Wed, 12 Jul 2023 07:54:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 628d3ca79134.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 07:54:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB8287.eurprd08.prod.outlook.com (2603:10a6:20b:556::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 07:54:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 07:54:08 +0000
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
X-Inumbo-ID: 52db6c40-2089-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnlctAjr5Jvm4SoPjOjsnN6dP+IB7PYrJf0H4xTjeeE=;
 b=4pXRxhBUTbUK9LI5zuYnrYK6TPTuix+Zd+bNLWFF0VagQ1xxFbYdgiCWOVKQVDH3gy5tPESA0qukDh8Pq+R933vANtfE8YCFqfDsbs0stgBiJYLNWXebKdsBnYU9zFxVBZke9mTeyhB2MRD2MCXBAdV7IShqqlotXWVmYw3kx68=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d0a0b0df6e182c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoMZ9cxmYXeY4i4+bKtvtgFjaWbh1s85jZ4h2vg94e6b0O0G0rMmzpbFmuiwsU3RF8ld0jW4jfaZgdiEIkQxKj8wSGKyhJ2x7SuwqfLi/3sjEMg6YOUTdRPH8OMFKozE6Cz5UPf3/Pb7iRRUEctkXK6rEZ/iICXf9kL2fpIqiRzv9sU4EmpjyHiHIONovtkqUchG92gYAi+ol+FrRdtgqpBZ2EIaHki7nljAB1w0zmCSkSK2NPqTXoPICc55AkuXe4zMxWuj2O4lI2/no+LtFx8TxR6eEkwjg6sG7n44dJBKhPHNcICXyfkF/VqfmrhCs2Kpxealcq1nOHa/teHCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnlctAjr5Jvm4SoPjOjsnN6dP+IB7PYrJf0H4xTjeeE=;
 b=KkEDKZuWoi2x4sXTW0EvoCj9NfC62liR59Yc7EwK5C+uKIkKRZDCLLO73KeR0gKVIsKEEz8/8C0bpO4D+y3W3WhBJVcl5nHVj76Uei6LgP2zGZirG03orfkNGQvS+ljGksEmpyr/gAr7HVeBxWI273eL3PVVHvoIKmaRw7+Y/lamTqzIprDQ9375W+Cm2QRkETUMYj0B5cws19mZmKZzD/1KlYyJMxlQnw9b3qb6qZg5a50LczZieP8hdWXUcq7ktzxBrJxwkTEWc8mQw/micmsz5KFuRxuZR4ermRpAsqYdPtkMqTGGI3LotSXkAeEuGMwGATvLekWGYg6DUwXFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnlctAjr5Jvm4SoPjOjsnN6dP+IB7PYrJf0H4xTjeeE=;
 b=4pXRxhBUTbUK9LI5zuYnrYK6TPTuix+Zd+bNLWFF0VagQ1xxFbYdgiCWOVKQVDH3gy5tPESA0qukDh8Pq+R933vANtfE8YCFqfDsbs0stgBiJYLNWXebKdsBnYU9zFxVBZke9mTeyhB2MRD2MCXBAdV7IShqqlotXWVmYw3kx68=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<JBeulich@suse.com>
Subject: Re: [XEN PATCH v9 01/24] xen: Introduce arch_domain_teardown()
Thread-Topic: [XEN PATCH v9 01/24] xen: Introduce arch_domain_teardown()
Thread-Index: AQHZryQJ2IQLjJDZP0Styerrsqvhxa+1zb2A
Date: Wed, 12 Jul 2023 07:54:08 +0000
Message-ID: <96CCDC08-9CC2-4449-AD3B-CD96BAEE57D0@arm.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-2-jens.wiklander@linaro.org>
In-Reply-To: <20230705093433.2514898-2-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB8287:EE_|AM7EUR03FT013:EE_|DBAPR08MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: dded81c4-69b8-4813-142e-08db82ad3561
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1p8hu57tqGOEFKmXRO2433kuOxqNE1S9QWgmmTbys5qjjkiZJjymJWfPWAQXcV5AczTDt36YMQNYjllvGNzp1tLIt8m/lirRxwveJlaWLalLj+RN+6zSCgWptBGmsUz9J+e8JxVJr6yBk7RUFO2hKj7ydkYgHBfaPhpWQAdg1SWYwlOigimbrkCJNiOGJR4LIDi+vHRFqMPFWPwxMXQxSo81csvW7XjeWsf0e5gRFVKlHrzmuQJkVEz5d35Rf/4uahFA+KIJJCOeIzKGnntA5nAoRyyo8TSCDmjrvrb9/kbOBKUwQxx+hU7YcOsjf8VRIJBtHqtRSkNrKJ06e5nMt0LmLzgOwklxy1Wfd7Zudeuqn8PI4C+6AZVaofDY4Gy2tj1u7jRUISdyYdwT97i3rMogPpkvmLxuCxmoh/G1ChdR4pbquq3ySGMRbRVJCoNwnmLUuCCFEomgRwmeaK94KG+gQoOtg1uaFzLJru746JSnG22yfcaV2NL90keQz50PvoTDwzzDddC1tpywwRGVlDUDsiji+O7VoomCoiOPeDvsDHCbyTnQp75hdckAfLsZfy1VCramf/ydktLNSbW5xqezi0GTBk8xd/8V+aGHz/hkH96WDjOXDlaPw+FYGHhm90hdh3NEy/JgmZMSUnwqFA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(76116006)(6486002)(478600001)(91956017)(71200400001)(54906003)(6506007)(53546011)(186003)(66946007)(2906002)(6512007)(8676002)(41300700001)(7416002)(6916009)(66476007)(5660300002)(66446008)(4326008)(8936002)(316002)(64756008)(38100700002)(66556008)(122000001)(86362001)(33656002)(38070700005)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3787300095C7E2488A2EA7F6C970B7EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8287
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e8374a21-e91f-4c1a-3704-08db82ad2c15
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WnPMSt6cv9ldWLvklibwRZVORK+SJD5242c07XgLghOts86rYTGythQsPrAmH5toEg4GHIe/L80IU4mxqhrLJC+zRyORZ7HvMKj89z1sHjR8yYdye5j4Vg58LxHcHj9SbJ3U/Cbq2X4Tsguf8tbrTpu4/sDz6VLfve5Jzzp2NbRMVPfcNw5Kycw+vRFL+wL/08jIWkvkzkRnjsdZk0T3sW3hTctmtPXOOTTRdYGJ3rFcQNn04S4OBNB+XwFlTyLnT90DrUR7vX3ctknG5R1poHyGdqkg5Rt2CcMuZlh+hE1FDVIsyUt9zr4EXhb/uQNbsk6pvSExdmoogJVLHG0OMWDVaNNn7CQCsI2yUmgtBMoIXw5bmAfqHFNID4u/mq70Y6jHKjMPGA5YWFeSEyaA25kJjR5imRmTJ60YjZ0P6RyHNHd5eh53xNA610PzwW0Do2B7q8Mr3Qgjkt5QyQ8f1opEYulDnqGcUfJhZc8EfqznFcBgIzrRxMjBmjvyFZQ3h4WW78SHYIM+qdNvAmF4d9c1v8dFmHBaAWDrVaLujQIzB5FQibdMpHGQFZrWWC+KgqgmMwyufR0vfLzB7sDMU/Sj2GhEsC3e5SEKw/z0MvVLYZeTgQ91GroC/YAq4azUne180g1H6/pbhRUe8qMEadUdCX7L015cJ9dB5NDVITnuevRNtE3WaOgRNLa7xHSNkri9dA93e1eWI4ldmKrlYjogMWTcy9omOtIiOtA/fNXM3lm1k/3SGvn72wNNrB7U
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(86362001)(82310400005)(70206006)(33656002)(54906003)(36860700001)(356005)(47076005)(336012)(82740400003)(81166007)(2906002)(2616005)(36756003)(4326008)(70586007)(6486002)(316002)(6512007)(41300700001)(186003)(40480700001)(6862004)(53546011)(8936002)(8676002)(40460700003)(107886003)(6506007)(26005)(5660300002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 07:54:23.8783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dded81c4-69b8-4813-142e-08db82ad3561
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5688

SGkgSmVucywNCg0KPiBPbiA1IEp1bCAyMDIzLCBhdCAxMTozNCwgSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4gDQo+IFBsdW1iIGl0IGludG8gZG9tYWlu
X3RlYXJkb3duKCkuICBQcm92aWRlIGFyY2hfdmFsIGluIHRoZSB0ZWFyZG93bg0KPiBjb250aW51
YXRpb24gaW5mb3JtYXRpb24gZm9yIHVzZSBieSBhcmNoX2RvbWFpbl90ZWFyZG93bigpLg0KPiAN
Cj4gTm8gcHJhY3RpY2FsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEplbnMgV2lr
bGFuZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogQmVydHJh
bmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KDQpDaGVlcnMNCkJlcnRyYW5k
DQoNCj4gLS0tDQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+DQo+IENDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+DQo+IENDOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5v
cmc+DQo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDQzogVm9sb2R5bXly
IEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBDQzogQmVydHJhbmQgTWFy
cXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPiBDQzogSmVucyBXaWtsYW5kZXIgPGpl
bnMud2lrbGFuZGVyQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMg
ICAgfCA1ICsrKysrDQo+IHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICB8IDUgKysrKysNCj4geGVu
L2NvbW1vbi9kb21haW4uYyAgICAgIHwgNiArKysrKysNCj4geGVuL2luY2x1ZGUveGVuL2RvbWFp
bi5oIHwgMSArDQo+IHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICB8IDEgKw0KPiA1IGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
ZG9tYWluLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gaW5kZXggOGMxOGU5MjA3OTA3Li4x
NWQ5NzA5YTk3ZDIgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW4uYw0KPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gQEAgLTc5Myw2ICs3OTMsMTEgQEAgZmFpbDoNCj4g
ICAgIHJldHVybiByYzsNCj4gfQ0KPiANCj4gK2ludCBhcmNoX2RvbWFpbl90ZWFyZG93bihzdHJ1
Y3QgZG9tYWluICpkKQ0KPiArew0KPiArICAgIHJldHVybiAwOw0KPiArfQ0KPiArDQo+IHZvaWQg
YXJjaF9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWluICpkKQ0KPiB7DQo+ICAgICAvKiBJT01N
VSBwYWdlIHRhYmxlIGlzIHNoYXJlZCB3aXRoIFAyTSwgYWx3YXlzIGNhbGwNCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPiBpbmRl
eCAzOWMyMTUzMTY1NDYuLjVmNjZjMmFlMzNkNyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2
L2RvbWFpbi5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYw0KPiBAQCAtODg4LDYgKzg4
OCwxMSBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICBy
ZXR1cm4gcmM7DQo+IH0NCj4gDQo+ICtpbnQgYXJjaF9kb21haW5fdGVhcmRvd24oc3RydWN0IGRv
bWFpbiAqZCkNCj4gK3sNCj4gKyAgICByZXR1cm4gMDsNCj4gK30NCj4gKw0KPiB2b2lkIGFyY2hf
ZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkNCj4gew0KPiAgICAgaWYgKCBpc19odm1f
ZG9tYWluKGQpICkNCj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tYWluLmMgYi94ZW4vY29t
bW9uL2RvbWFpbi5jDQo+IGluZGV4IGNhYWE0MDI2Mzc5Mi4uMzA0YWEwNGZhNmNiIDEwMDY0NA0K
PiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jDQo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMN
Cj4gQEAgLTQzOSw2ICs0MzksNyBAQCBzdGF0aWMgaW50IGRvbWFpbl90ZWFyZG93bihzdHJ1Y3Qg
ZG9tYWluICpkKQ0KPiAgICAgICAgICAgICBQUk9HX25vbmUsDQo+ICAgICAgICAgICAgIFBST0df
Z250dGFiX21hcHBpbmdzLA0KPiAgICAgICAgICAgICBQUk9HX3ZjcHVfdGVhcmRvd24sDQo+ICsg
ICAgICAgICAgICBQUk9HX2FyY2hfdGVhcmRvd24sDQo+ICAgICAgICAgICAgIFBST0dfZG9uZSwN
Cj4gICAgICAgICB9Ow0KPiANCj4gQEAgLTQ1OSw2ICs0NjAsMTEgQEAgc3RhdGljIGludCBkb21h
aW5fdGVhcmRvd24oc3RydWN0IGRvbWFpbiAqZCkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBy
YzsNCj4gICAgICAgICB9DQo+IA0KPiArICAgIFBST0dSRVNTKGFyY2hfdGVhcmRvd24pOg0KPiAr
ICAgICAgICByYyA9IGFyY2hfZG9tYWluX3RlYXJkb3duKGQpOw0KPiArICAgICAgICBpZiAoIHJj
ICkNCj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4gKw0KPiAgICAgUFJPR1JFU1MoZG9uZSk6
DQo+ICAgICAgICAgYnJlYWs7DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2Rv
bWFpbi5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oDQo+IGluZGV4IDFkZjhmOTMzZDA3Ni4u
ZDM1YWYzNDg0MTBjIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vZG9tYWluLmgNCj4g
KysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oDQo+IEBAIC04MSw2ICs4MSw3IEBAIGludCBh
cmNoX2RvbWFpbl9jcmVhdGUoc3RydWN0IGRvbWFpbiAqZCwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZywNCj4gICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpOw0KPiANCj4gK2ludCBhcmNoX2RvbWFp
bl90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKTsNCj4gdm9pZCBhcmNoX2RvbWFpbl9kZXN0cm95
KHN0cnVjdCBkb21haW4gKmQpOw0KPiANCj4gdm9pZCBhcmNoX2RvbWFpbl9zaHV0ZG93bihzdHJ1
Y3QgZG9tYWluICpkKTsNCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIv
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gaW5kZXggODUyNDJhNzNkMzc0Li44NTRmM2UzMmMw
MGUgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+ICsrKyBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oDQo+IEBAIC01ODksNiArNTg5LDcgQEAgc3RydWN0IGRvbWFpbg0K
PiAgICAgICovDQo+ICAgICBzdHJ1Y3Qgew0KPiAgICAgICAgIHVuc2lnbmVkIGludCB2YWw7DQo+
ICsgICAgICAgIHVuc2lnbmVkIGludCBhcmNoX3ZhbDsNCj4gICAgICAgICBzdHJ1Y3QgdmNwdSAq
dmNwdTsNCj4gICAgIH0gdGVhcmRvd247DQo+IA0KPiAtLSANCj4gMi4zNC4xDQo+IA0KDQo=

