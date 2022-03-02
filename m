Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CCE4C9DEF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 07:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281977.480526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPIhn-0004I7-T9; Wed, 02 Mar 2022 06:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281977.480526; Wed, 02 Mar 2022 06:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPIhn-0004GF-OS; Wed, 02 Mar 2022 06:43:23 +0000
Received: by outflank-mailman (input) for mailman id 281977;
 Wed, 02 Mar 2022 06:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d1LL=TN=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nPIhm-0004G6-JN
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 06:43:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b7c6f8d-99f4-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 07:43:19 +0100 (CET)
Received: from DB6PR0501CA0025.eurprd05.prod.outlook.com (2603:10a6:4:67::11)
 by HE1PR0801MB1769.eurprd08.prod.outlook.com (2603:10a6:3:7f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Wed, 2 Mar
 2022 06:43:16 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::31) by DB6PR0501CA0025.outlook.office365.com
 (2603:10a6:4:67::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Wed, 2 Mar 2022 06:43:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Wed, 2 Mar 2022 06:43:15 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Wed, 02 Mar 2022 06:43:15 +0000
Received: from ef8bdd70029a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DAC707AD-D9F0-4A1F-A313-F4E4AAD9E3ED.1; 
 Wed, 02 Mar 2022 06:43:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef8bdd70029a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Mar 2022 06:43:09 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7123.eurprd08.prod.outlook.com (2603:10a6:102:206::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Wed, 2 Mar
 2022 06:43:07 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::89b3:80a2:2b58:f1aa%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 06:43:07 +0000
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
X-Inumbo-ID: 0b7c6f8d-99f4-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d99pwRro3QOML7H0OZ9ZmZKoZLCKgq75MfxSO1ypTIc=;
 b=bMIbnnA/1iEuqO9RMl0klONqFIBUcQQvexJOa4B5JytKliIBff2aJYs+SP/Jeh9RLMUhdA344ylZlkhv4ABHIPMkhCrm/FBr54dFAzMkaauKShNciKyNfjbgy6GL3+JPwXmlFTX/QJglUYr+vmDscP/b5mRalMm6FGUel8DINCM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ31Zr5tlO4GjpLCRY0MG43XWDBc5Rm+yZ7qYHTzAbtGG3Sx+s40oroxIYC5B/NcvBBopuIGEEBYCrMEs9q0ATwQ9PWavK5B+uTePAqLY9qHdM+vcdJPfchxhJodnN7MfRelV35oz9H0XG2BpmaMy/iqbgcDZSAE0iXn+JVQ7Uf0IT1AHxALK6aFC3GJVpO2UmRR2N3xVm90O6lYAurX3dqZ4CZ9yFCo/63xI7GtFx2l3zG49yqfAaOUpS8A1CdNIRYtiTaMH5wnQRR3g+CArYm2lU/7jeVtVRw3KrwYS4PXJ0TP726zdU05dnf3oGcRTcltTU6wzqFIr3n602kWIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d99pwRro3QOML7H0OZ9ZmZKoZLCKgq75MfxSO1ypTIc=;
 b=Taa62mw1uAvC6djQ5JTvbH6wAGy4uIZyptOkjVWs1Q7OFds+NwX1ZMp1PaH/aRVpcnKG0oDm/VuHnkMtT/iUiNYCoz9qZ/fpwmUy4sFNXlhUVITm9edbGut+cj5PnOZ3AhCF2sk80KfyCDNo2CN+vYvpFPWZfJ9M0ctGzzdc/dnKIltB1HtjIsXuO8x74lEXXnHQ4URjBZhsOBzY992j+TWbSyktZ3P/xoiegyrUsZN+Efn7I6nazeCSpxba8BzLxjM16efZZr5VqPlPoOMbe75fRzqpA1jc0JIMUmfTrjHi+34leS/wzgw6FCQKaVHe9HcmM602XMltf7q+/rMrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d99pwRro3QOML7H0OZ9ZmZKoZLCKgq75MfxSO1ypTIc=;
 b=bMIbnnA/1iEuqO9RMl0klONqFIBUcQQvexJOa4B5JytKliIBff2aJYs+SP/Jeh9RLMUhdA344ylZlkhv4ABHIPMkhCrm/FBr54dFAzMkaauKShNciKyNfjbgy6GL3+JPwXmlFTX/QJglUYr+vmDscP/b5mRalMm6FGUel8DINCM=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
Subject: RE: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Topic: Proposal for Porting Xen to Armv8-R64 - DraftA
Thread-Index:
 AdgpQxtXwh7LkfydTgiYk9bhMgU+ogAn0mUAABEK2UAAF1ylAACsO9YwAA5uZgAAI3g7sA==
Date: Wed, 2 Mar 2022 06:43:06 +0000
Message-ID:
 <PAXPR08MB7420B367FFEB4FD3A7C88EB79E039@PAXPR08MB7420.eurprd08.prod.outlook.com>
References:
 <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2202241606450.239973@ubuntu-linux-20-04-desktop>
 <AS1PR08MB74269923288B75097392BDD99E3E9@AS1PR08MB7426.eurprd08.prod.outlook.com>
 <4c558f8f-56d4-0445-32d4-169bc5d0a3bc@xen.org>
 <PAXPR08MB74200F4B0B4EFFD5BE1A6E699E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
In-Reply-To: <7260f050-9022-4adf-618b-a8b271aca8c3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 32B2944F5526F64A92C3528439773948.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2842dfa8-c121-4c6d-1408-08d9fc17edf5
x-ms-traffictypediagnostic:
	PAXPR08MB7123:EE_|DB5EUR03FT045:EE_|HE1PR0801MB1769:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1769A881ED925A4960DBBDB09E039@HE1PR0801MB1769.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KiXgAiG9pXI4YVQjM4OCmkUhKHIdWTlZfwlfQwpJRKDe2bwXdn0fv19FWWGQyv5IQ4zbnL51Rkf81BWIGBSrJt/0PWQrHdT//Z4M3Pguuk4OuEfQw0WSqO82lsR9F3Y72RcAt0I+ZllskTNC6E25gn3zI5fpRvVtbOI5EfdtyBh0QaBAcG5vyVEoNOzJZwXGVXsaSNOZCSkVcAMfMusEu1xjpY4ZirNEJD17OgV3B37flaxnTkUjpbIFoAgQNfWZcyTPzu10XwzZDrunMfjuktFG/TvPILRbnZ7RVUbtT4cfPSuOeY/2w0oFoEn64+miuCOf0l5taKTJAnBtUIZhZf94Qp2lUv8gn/MyrNTI7JPUUtSLvtjT1YE8e5Z0FHBxdd+29U93tEhfmFDLbWLANTpMH99KsAfy0dwKMtgQmYQPUgu+a6aSQVEIbZ1C/p7yr9bo3pDJl0l9ugxnq80Tf3zB+/ii8lK4X9yejGWnL3vp+fCxY9h6g2ibzuiiGT3977DCNQk8/GagnrVmTLDJuwJF5CG5k4FXSa3oK8OecX6NBygiz8yZQBBJ7faSFFPnkrNXX+c2WR2DtHt9Rn820zZyQy6L9wzoWIrJ8XXSa3sdUl4iFnBIJY0AXpWtPRT928zSKiJnxXPwRtIz1EoYTY/2S5ovH5Oe4V/WetX/eWc/Fc/LYTLN0PwUwYZeyGzdFwXQBQoq2WOTTt93cU0Apw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(54906003)(8936002)(5660300002)(110136005)(186003)(26005)(52536014)(66476007)(66556008)(64756008)(76116006)(66946007)(71200400001)(33656002)(508600001)(66446008)(122000001)(38070700005)(6506007)(53546011)(7696005)(38100700002)(55016003)(4326008)(316002)(8676002)(2906002)(83380400001)(9686003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3932a1f5-edf3-4c9f-3da7-08d9fc17e8fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PiHeeDm2q8L0ih/d+FgYrBLq8hlSNAURKGYzj19t6gDYJEv1eRZp8Npuh6Vs05wOwroQ0AUQLwCB+pD0Nv4/ASy/EBo739KnL9yyV28zeWLgt4/YT1z7Qc4ifpKKiLuakyaJljoaVSHCw10Zf+hGmVZfeyoGh/z5xP8Vir7A+dav/4YG4OzYN+XJQ89AOuzehgsemj+zIxgOmQe1XUeix0B/2FShj25tgKRoi74b9MbAP4EPCGFBxWdsC/lmeaeuIXPbOJR6yumIO9k35VLxAOP/addNXGrx4+CQFZJnt9riiFfyfvNV35jrLJrrPmrXxFp2OD3yMvRh1JQHHR74oWOIckOJStJ9MtaV7NEQRf+KKqWFSO3HB7D+wVxypcKqA0IvTNhnSGbSbM4j8qGm3k5y0H1eRq7BpFJZk96paGJ+BJpeWyXZCJTKX4+SGPAuF5TCxORIo8xyz9VHouKM6mGR3foMmy8u0wFYEdYorIp6Od/It4Y0x8KXPNsMJW8QoDL1vZQshqvDOwMd4ldyMqDL6b97nPZfUuRZO09SiDJw1+IqRdf2+wMypDzqTf32LfzzsQgRktRMljm3L5eVgCSpkAG1n84Z3t541cVhCR0ur2UzKWAAmUWujdhU6aJwXS4bmBMn7J9xj2MlunBzLXmiAIwkZ0NexUOcQOlBht0TtQrIyYln7g6z5PD3Sbct
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(110136005)(316002)(8936002)(52536014)(4326008)(8676002)(5660300002)(2906002)(26005)(54906003)(40460700003)(86362001)(508600001)(70206006)(70586007)(36860700001)(55016003)(9686003)(7696005)(53546011)(356005)(81166007)(6506007)(33656002)(82310400004)(336012)(47076005)(83380400001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 06:43:15.6344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2842dfa8-c121-4c6d-1408-08d9fc17edf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1769

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjLlubQz5pyIMeaXpSAyMToxNw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFBl
bm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgSGVucnkgV2FuZw0KPiA8SGVucnkuV2Fu
Z0Bhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBQcm9wb3NhbCBmb3Ig
UG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJhZnRBDQo+IA0KPiBPbiAwMS8wMy8yMDIyIDA2
OjI5LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBIaSBKdWxpZW4sDQo+IA0KPiBIaSwNCj4gDQo+ID4+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+DQo+ID4+IFNlbnQ6IDIwMjLlubQy5pyIMjbml6UgNDoxMg0KPiA+PiBUbzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPj4gPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPj4gPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47
IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgSGVucnkNCj4gV2FuZw0KPiA+PiA8
SGVucnkuV2FuZ0Bhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBQ
cm9wb3NhbCBmb3IgUG9ydGluZyBYZW4gdG8gQXJtdjgtUjY0IC0gRHJhZnRBDQo+ID4+DQo+ID4+
IEhpIFdlaSwNCj4gPj4NCj4gPj4gT24gMjUvMDIvMjAyMiAxMDo0OCwgV2VpIENoZW4gd3JvdGU6
DQo+ID4+Pj4+ICDCoMKgwqDCoCBBcm12OC1SNjQgY2FuIHN1cHBvcnQgbWF4IHRvIDI1NiBNUFUg
cmVnaW9ucy4gQnV0IHRoYXQncyBqdXN0DQo+ID4+Pj4gdGhlb3JldGljYWwuDQo+ID4+Pj4+ICDC
oMKgwqDCoCBTbyB3ZSBkb24ndCB3YW50IHRvIGRlZmluZSBgcHJfdCBtcHVfcmVnaW9uc1syNTZd
YCwgdGhpcyBpcyBhDQo+ID4+IG1lbW9yeQ0KPiA+Pj4+IHdhc3RlDQo+ID4+Pj4+ICDCoMKgwqDC
oCBpbiBtb3N0IG9mIHRpbWUuIFNvIHdlIGRlY2lkZWQgdG8gbGV0IHRoZSB1c2VyIHNwZWNpZnkg
dGhyb3VnaA0KPiBhDQo+ID4+Pj4gS2NvbmZpZw0KPiA+Pj4+PiAgwqDCoMKgwqAgb3B0aW9uLiBg
Q09ORklHX0FSTV9NUFVfRUwxX1BST1RFQ1RJT05fUkVHSU9OU2AgZGVmYXVsdCB2YWx1ZQ0KPiBj
YW4NCj4gPj4gYmUNCj4gPj4+PiBgMzJgLA0KPiA+Pj4+PiAgwqDCoMKgwqAgaXQncyBhIHR5cGlj
YWwgaW1wbGVtZW50YXRpb24gb24gQXJtdjgtUjY0LiBVc2VycyB3aWxsDQo+IHJlY29tcGlsZQ0K
PiA+PiBYZW4NCj4gPj4+PiB3aGVuDQo+ID4+Pj4+ICDCoMKgwqDCoCB0aGVpciBwbGF0Zm9ybSBj
aGFuZ2VzLiBTbyB3aGVuIHRoZSBNUFUgY2hhbmdlcywgcmVzcGVjaWZ5aW5nDQo+IHRoZQ0KPiA+
Pj4+IE1QVQ0KPiA+Pj4+PiAgwqDCoMKgwqAgcHJvdGVjdGlvbiByZWdpb25zIG51bWJlciB3aWxs
IG5vdCBjYXVzZSBhZGRpdGlvbmFsIHByb2JsZW1zLg0KPiA+Pj4+DQo+ID4+Pj4gSSB3b25kZXIg
aWYgd2UgY291bGQgcHJvYmUgdGhlIG51bWJlciBvZiBNUFUgcmVnaW9ucyBhdCBydW50aW1lIGFu
ZA0KPiA+Pj4+IGR5bmFtaWNhbGx5IGFsbG9jYXRlIHRoZSBtZW1vcnkgbmVlZGVkIHRvIHN0b3Jl
IHRoZW0gaW4gYXJjaF92Y3B1Lg0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gV2UgaGF2ZSBjb25zaWRl
cmVkIHRvIHVzZWQgYSBwcl90IG1wdV9yZWdpb25zWzBdIGluIGFyY2hfdmNwdS4gQnV0IGl0DQo+
ID4+IHNlZW1zDQo+ID4+PiB3ZSB3aWxsIGVuY291bnRlciBzb21lIHN0YXRpYyBhbGxvY2F0ZWQg
YXJjaF92Y3B1IHByb2JsZW1zIGFuZCBzaXplb2YNCj4gPj4gaXNzdWUuDQo+ID4+DQo+ID4+IERv
ZXMgaXQgbmVlZCB0byBiZSBlbWJlZGRlZCBpbiBhcmNoX3ZjcHU/IElmIG5vdCwgdGhlbiB3ZSBj
b3VsZA0KPiBhbGxvY2F0ZQ0KPiA+PiBtZW1vcnkgb3V0c2lkZSBhbmQgYWRkIGEgcG9pbnRlciBp
biBhcmNoX3ZjcHUuDQo+ID4+DQo+ID4NCj4gPiBXZSBoYWQgdGhvdWdodCB0byB1c2UgYSBwb2lu
dGVyIGluIGFyY2hfdmNwdSBpbnN0ZWFkIG9mIGVtYmVkZGluZw0KPiBtcHVfcmVnaW9ucw0KPiA+
IGludG8gYXJjaF92Y3B1LiBCdXQgd2Ugbm90aWNlZCB0aGF0IGFyY2hfdmNwdSBoYXMgYSBfX2Nh
Y2hlbGluZV9hbGlnbmVkDQo+ID4gYXR0cmlidXRlLCB0aGlzIG1heSBiZSBiZWNhdXNlIG9mIGFy
Y2hfdmNwdSB3aWxsIGJlIHVzZWQgdmVyeSBmcmVxdWVudGx5DQo+ID4gaW4gc29tZSBjcml0aWNh
bCBwYXRoLiBTbyBpZiB3ZSB1c2UgdGhlIHBvaW50ZXIgZm9yIG1wdV9yZWdpb25zLCBtYXkNCj4g
Y2F1c2UNCj4gPiBzb21lIGNhY2hlIG1pc3MgaW4gdGhlc2UgY3JpdGljYWwgcGF0aCwgZm9yIGV4
YW1wbGUsIGluIGNvbnRleHRfc3d0aWNoLg0KPiANCj4gIEZyb20gbXkgdW5kZXJzdGFuZGluZywg
dGhlIGlkZWEgYmVoaW5kIGBgY2FjaGVsaW5lX2FsaWduZWRgYCBpcyB0bw0KPiBhdm9pZCB0aGUg
c3RydWN0IHZjcHUgdG8gYmUgc2hhcmVkIHdpdGggb3RoZXIgZGF0YXN0cnVjdHVyZS4gT3RoZXJ3
aXNlDQo+IHlvdSBtYXkgZW5kIHVwIHRvIGhhdmUgdHdvIHBDUFVzIHRvIGZyZXF1ZW50bHkgd3Jp
dGUgdGhlIHNhbWUgY2FjaGVsaW5lDQo+IHdoaWNoIGlzIG5vdCBpZGVhbC4NCj4gDQo+IGFyY2hf
dmNwdSBzaG91bGQgZW1iYmVkIGFueXRoaW5nIHRoYXQgd2lsbCBiZSBhY2Nlc3NlZCBvZnRlbiAo
ZS5nLg0KPiBlbnRyeS9leGl0KSB0byBjZXJ0YWluIHBvaW50LiBGb3IgaW5zdGFuY2UsIG5vdCBl
dmVyeXRoaW5nIHJlbGF0ZWQgdG8NCj4gdGhlIHZHSUMgYXJlIGVtYmJlZCBpbiB0aGUgdkNQVS9E
b21haW4gc3RydWN0dXJlLg0KPiANCj4gSSBhbSBhIGJpdCBzcGxpdCByZWdhcmRpbmcgdGhlIG1w
dV9yZWdpb25zLiBJZiB0aGV5IGFyZSBtYWlubHkgdXNlZCBpbg0KPiB0aGUgY29udGV4dF9zd2l0
Y2goKSB0aGVuIEkgd291bGQgYXJndWUgdGhpcyBpcyBhIHByZW1hdHVyZSBvcHRpbWl6YXRpb24N
Cj4gYmVjYXVzZSB0aGUgc2NoZWR1bGluZyBkZWNpc2lvbiBpcyBwcm9iYWJseSBnb2luZyB0byB0
YWtlIGEgbG90IG1vcmUNCj4gdGltZSB0aGFuIHRoZSBjb250ZXh0IHN3aXRjaCBpdHNlbGYuDQoN
Cm1wdV9yZWdpb25zIGluIGFyY2hfdmNwdSBhcmUgdXNlZCB0byBzYXZlIGd1ZXN0J3MgRUwxIE1Q
VSBjb250ZXh0LiBTbywgeWVzLA0KdGhleSBhcmUgbWFpbmx5IHVzZWQgaW4gY29udGV4dF9zd2l0
Y2guIEluIHRlcm1zIG9mIHRoZSBudW1iZXIgb2YgcmVnaXN0ZXJzLA0KaXQgd2lsbCBzYXZlL3Jl
c3RvcmUgbW9yZSB3b3JrIHRoYW4gdGhlIG9yaWdpbmFsIFY4QS4gQW5kIG9uIFY4UiB3ZSBhbHNv
IG5lZWQNCnRvIGtlZXAgbW9zdCBvZiB0aGUgb3JpZ2luYWwgVjhBIHNhdmUvcmVzdG9yZSB3b3Jr
LiBTbyBpdCB3aWxsIHRha2UgbG9uZ2VyDQp0aGFuIHRoZSBvcmlnaW5hbCBWOEEgY29udGV4dF9z
d2l0Y2guIEFuZCBJIHRoaW5rIHRoaXMgaXMgZHVlIHRvIGFyY2hpdGVjdHVyZSdzDQpkaWZmZXJl
bmNlLiBTbyBpdCdzIGltcG9zc2libGUgZm9yIHVzIG5vdCB0byBzYXZlL3Jlc3RvcmUgRUwxIE1Q
VSByZWdpb24NCnJlZ2lzdGVycyBpbiBjb250ZXh0X3N3aXRjaC4gQW5kIHdlIGhhdmUgZG9uZSBz
b21lIG9wdGltaXphdGlvbiBmb3IgRUwxIE1QVQ0Kc2F2ZS9yZXN0b3JlOg0KMS4gQXNzZW1ibHkg
Y29kZSBmb3IgRUwxIE1QVSBjb250ZXh0X3N3aXRjaA0KMi4gVXNlIHJlYWwgTVBVIHJlZ2lvbnMg
bnVtYmVyIGluc3RlYWQgb2YgQ09ORklHX0FSTV9NUFVfRUwxX1BST1RFQ1RJT05fUkVHSU9OUw0K
ICAgaW4gY29udGV4dF9zd2l0Y2guIENPTkZJR19BUk1fTVBVX0VMMV9QUk9URUNUSU9OX1JFR0lP
TlMgaXMgZGVmaW5lZCB0aGUgTWF4DQogICBzdXBwb3J0ZWQgRUwxIE1QVSByZWdpb25zIGZvciB0
aGlzIFhlbiBpbWFnZS4gQWxsIHBsYXRmb3JtcyB0aGF0IGltcGxlbWVudA0KICAgRUwxIE1QVSBy
ZWdpb25zIGluIHRoaXMgcmFuZ2UgY2FuIHdvcmsgd2VsbCB3aXRoIHRoaXMgWGVuIEltYWdlLiBC
dXQgaWYgdGhlDQogICBpbXBsZW1lbnRlZCBFTDEgTVBVIHJlZ2lvbiBudW1iZXIgZXhjZWVkcyBD
T05GSUdfQVJNX01QVV9FTDFfUFJPVEVDVElPTl9SRUdJT05TLA0KICAgdGhpcyBYZW4gaW1hZ2Ug
Y291bGQgbm90IHdvcmsgd2VsbCBvbiB0aGlzIHBsYXRmb3JtLg0KICANCj4gDQo+IE5vdGUgdGhh
dCBmb3IgdGhlIFAyTSB3ZSBhbHJlYWR5IGhhdmUgdGhhdCBpbmRpcmVjdGlvbiBiZWNhdXNlIGl0
IGlzDQo+IGVtYmJlZCBpbiB0aGUgc3RydWN0IGRvbWFpbi4NCg0KSXQncyBkaWZmZXJlbnQgd2l0
aCBWOEEgUDJNIGNhc2UuIEluIFY4QSBjb250ZXh0X3N3aXRjaCB3ZSBqdXN0IG5lZWQgdG8NCnNh
dmUvcmVzdG9yZSBWVFRCUiwgd2UgZG9uJ3QgbmVlZCB0byBkbyBQMk0gdGFibGUgd2Fsay4gQnV0
IG9uIFY4Uiwgd2UNCm5lZWQgdG8gYWNjZXNzIHZhbGlkIG1wdV9yZWdpb25zIGZvciBzYXZlL3Jl
c3RvcmUuDQoNCj4gDQo+IFRoaXMgcmFpc2VzIG9uZSBxdWVzdGlvbiwgd2h5IGlzIHRoZSBNUFVz
IHJlZ2lvbnMgd2lsbCBiZSBwZXItdkNQVQ0KPiByYXRoZXIgcGVyIGRvbWFpbj8NCj4gDQoNCkJl
Y2F1c2UgdGhlcmUgaXMgYSBFTDEgTVBVIGNvbXBvbmVudCBmb3IgZWFjaCBwQ1BVLiBXZSBjYW4n
dCBhc3N1bWUgZ3Vlc3QNCnRvIHVzZSB0aGUgc2FtZSBFTDEgTVBVIGNvbmZpZ3VyYXRpb24gZm9y
IGFsbCB2Q1BVLg0KDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

