Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B549DC35
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:06:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261277.452193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCznb-0002Ic-Ix; Thu, 27 Jan 2022 08:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261277.452193; Thu, 27 Jan 2022 08:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCznb-0002G0-FR; Thu, 27 Jan 2022 08:06:31 +0000
Received: by outflank-mailman (input) for mailman id 261277;
 Thu, 27 Jan 2022 08:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xPLH=SL=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nCzna-0002Fu-Fl
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:06:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07c9924a-7f48-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:06:29 +0100 (CET)
Received: from AM6P193CA0114.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::19)
 by DBBPR08MB4792.eurprd08.prod.outlook.com (2603:10a6:10:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:06:25 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::7c) by AM6P193CA0114.outlook.office365.com
 (2603:10a6:209:85::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 27 Jan 2022 08:06:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 08:06:24 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Thu, 27 Jan 2022 08:06:24 +0000
Received: from 85703f28e5ea.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B21AD918-B19F-4721-AB9F-74D4D07A1518.1; 
 Thu, 27 Jan 2022 08:06:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 85703f28e5ea.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 08:06:14 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PR2PR08MB4843.eurprd08.prod.outlook.com (2603:10a6:101:24::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 08:06:12 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 08:06:12 +0000
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
X-Inumbo-ID: 07c9924a-7f48-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzkYhBh25GyKcBuErLDPSNPnUiG+lvDCA0kKw38c57Y=;
 b=ZTsB8UuFvX+4Bhx8FBHspndt7gmjoHzrc4z+xMR+7bDbUTHLRGMENm+rtdNa6IpbDlEZfNJqxUeoc0OMwovv/zRzpw3/ODXt8wQKfZr6mv+JR4alH/VwoMGTC2bMs2W2GhYJo967N2Qfsp/Yx5go3a36jr0wUmZAPN9wqKa5+Ao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ee3xJ0Sg30VlWaufo1IHAVuFMPopXc6ihhoJgZXh8tMrIHO/MhjuHk9LhuQpxr9c6EL+awG6cydZeH19f4Ze7B5BGiA6DDJTz+O7lkG/89oVHKt8oFnCSI1mlXFF03pIzSFi2W3ll7MkVBBl6Nm8aos07U1b0bT+mM4s/56nIUwVlULeGk76GPPPMrYBoxdC1uvRDrfz6XgmXdrTT3C1qmKWk9uKs8D2nOYnMrDRLnrYx2Wa+/otbNoj/TOUBPGUUZlCm5E43un0cwjg9h40xd6t44H2D2YlYaB2o6/3Ptfmp1LlD6a9o8Ibukp+yF/Tx3vyCHGaogt1jIGxUu/wWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzkYhBh25GyKcBuErLDPSNPnUiG+lvDCA0kKw38c57Y=;
 b=aOoimM8BjxQcr/uqq1ExrEg6e7F3xupV+iFNQM5QujePtUPytZ/FWRYeRParPxbLL4VP0dD7lKNeB4oIMnAkDt1Mw7ExSgaV00Psqw7MKWuPI2FvXx9FMi8O2Fi0mMO1HaK5j4Hz07ejgIjhxp7o673Dj/h8JdEiJyYFDiLeELtYs/CqCbrSRRA52DdxJFSkZK8d3p7NzcUZVKkBMHCTo2thlDAGjylon8ZHU7l9Js1tXWbRdWDblHqxXSEbTpic3nMkX4TbjZRjlJccM220YIRucwqlECGQxlZ0jT7VBiWq6YooStRoOSvS+CXrJp+AwwTSViF6joiP5UnkIKGkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzkYhBh25GyKcBuErLDPSNPnUiG+lvDCA0kKw38c57Y=;
 b=ZTsB8UuFvX+4Bhx8FBHspndt7gmjoHzrc4z+xMR+7bDbUTHLRGMENm+rtdNa6IpbDlEZfNJqxUeoc0OMwovv/zRzpw3/ODXt8wQKfZr6mv+JR4alH/VwoMGTC2bMs2W2GhYJo967N2Qfsp/Yx5go3a36jr0wUmZAPN9wqKa5+Ao=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 13/37] xen/x86: decouple processor_nodes_parsed from acpi
 numa functions
Thread-Topic: [PATCH 13/37] xen/x86: decouple processor_nodes_parsed from acpi
 numa functions
Thread-Index: AQHXsHMSdKhLEbfZMUSB+hDEcZc+16x0QMkAgAMHpwA=
Date: Thu, 27 Jan 2022 08:06:12 +0000
Message-ID:
 <PAXPR08MB742089B2F0A35EB51AB594DF9E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-14-wei.chen@arm.com>
 <8df7606b-bf0d-bc6e-5393-09d187539e26@suse.com>
In-Reply-To: <8df7606b-bf0d-bc6e-5393-09d187539e26@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: BBD609408C36F24B8B92F974F9C13D8B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 895a3e6a-eda0-4d7f-c21c-08d9e16be9c6
x-ms-traffictypediagnostic:
	PR2PR08MB4843:EE_|AM5EUR03FT031:EE_|DBBPR08MB4792:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB479233266EA360A5EBC9129B9E219@DBBPR08MB4792.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RQX4c6PmqEuYoRDf2pFpN5pnvCE0/XRKU+CW/w8oFx9MgFj85lmsb5NQoveUABPc2CEjHeBamNrXXYwkTN2NTCeLaOpUZfTxg5HmHJaaxswTePEVO28LOU0JyTYeTRJSeKO99INKEkGmgEChr1ta7V0/7YAbA2YnVpKMM48mjVtcjU+ZK4EJZHK2fAq21F2w87XXYp4rvEEznP1jjgTR4UnW1Xc1t/LpCUC/Qe2+YY89b+yorxplwcil6YHlHq9xuXzsiLql6DdG/8UA0Ax52+UG6sirx6HKZnF0Qq4mYbzcggDycW2PCuYWWwR6WiOo8g1b5zc2bsIKCVuTZrRO9luzl8vkW8LBxh++pexlbCg4o37CF+ItdrJ6xNwf6ExnS5wvsyFm9+BEuyi5UOAWepqqOqf5bY8AzSnDtWs408b029nMT6v2KrTPq3vy+oqIuHbj9IBsuYqu98jSSIYK1bjBWqz+q4QB/JP9a7lae5J7Ifbusr5eYtf4tXxeayOhEGy4FNoe3JFD5makdJLKDnTVR2LtjJ1Ty0SwYJkCpTnatUQ88IgGIf/mrnFJYnTN5gqjCac7QtdTL/2XseGZkMNxI4gXd0kLtUQi/S+kzsOQ3mJcTJo5KCUi6quRIM2SpCKQCHuSBBJW7Tn/dcXCM8EpJGmSE0Mrz1e9fvVZuG/oQ+6bv8cTWEEzKhsLRQuk4IW/BDDisVRNCDHgnEmwHw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(54906003)(2906002)(52536014)(53546011)(186003)(26005)(6506007)(6916009)(33656002)(316002)(9686003)(508600001)(7696005)(86362001)(55016003)(83380400001)(64756008)(66946007)(66556008)(66476007)(66446008)(76116006)(8676002)(4326008)(8936002)(122000001)(5660300002)(38100700002)(38070700005)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4843
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be1a4346-cff7-4ce3-afc1-08d9e16be285
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZFJ8XfENEPXdNhYe2MA6PfjEbqU8lzPNznow2yZCEIU6kv0CvwAFxF+5a8IJBmyt8AYrUPrS+2j1cWKig55LPIAbxry9m7q9o63zXk9LChORU5kKdYknwc1xjnAF1MUHSN7o5IUeDDvFP+Y6/S4bX5rWb4ZaqivUfvSP8RA3MltYM9J04C/ufZnUfJmMYhs9n8M4Lo+tmecFF2VlOKWztTpEK1bK6pTbfQHPP/hR88jx3gIkodSP8+SiwgWUKWc8c+EN3XHfXLPJvgSF5s+JkQftkEySIHP5WsBS2xrMM58v5/rlYa+jfSTtCPygv3jkgnIAm9Mzh0CJ8i+IwLKWG6EliucZaPKJnFZvKyVilJhmQK3TFvFWclGpzFw6X6YGjDq/8pjk0kkOVjM3ECZQxbwKmxhmn0aAB+iPXxWP0hDQoGGTEGMHRM2a3xSpkPkzKWJc+xANw4wd6SETtJWa4PhPOyMDK5yD/tcK4khQnF5jXGYR4p/nEnzkWrARvbbS05ucbQMJm/5jEjC/IwllD7zblMjutlEQk8zqvsG3qPVL+oTZBhivHIgtPGUiFgV+lWJmJrfw2dw8c7cPpVKRmP4i7zLWpJ2Q0riMpnHOaTJO+1ST98kEG3CXhQyaFzWrxXdh9MPZuA+4NyVhD1pOMnXRKyP31VNOfL98PAEVMPswyxHDYAGSCjDCVT48sbg/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(36860700001)(40460700003)(54906003)(2906002)(52536014)(53546011)(186003)(26005)(6506007)(33656002)(316002)(9686003)(508600001)(7696005)(86362001)(55016003)(83380400001)(82310400004)(6862004)(336012)(70206006)(70586007)(8676002)(4326008)(8936002)(47076005)(81166007)(5660300002)(356005)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:06:24.8878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 895a3e6a-eda0-4d7f-c21c-08d9e16be9c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4792

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAxNzo0OQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDEzLzM3XSB4ZW4veDg2OiBkZWNvdXBsZSBwcm9jZXNzb3Jfbm9kZXNfcGFy
c2VkIGZyb20NCj4gYWNwaSBudW1hIGZ1bmN0aW9ucw0KPiANCj4gT24gMjMuMDkuMjAyMSAxNDow
MiwgV2VpIENoZW4gd3JvdGU6DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L3NyYXQuYw0KPiA+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiBAQCAtMTA0LDYgKzEwNCwxMSBAQCBub2RlaWRf
dCBzZXR1cF9ub2RlKHVuc2lnbmVkIHB4bSkNCj4gPiAgCXJldHVybiBub2RlOw0KPiA+ICB9DQo+
ID4NCj4gPiArdm9pZCAgX19pbml0IG51bWFfc2V0X3Byb2Nlc3Nvcl9ub2Rlc19wYXJzZWQobm9k
ZWlkX3Qgbm9kZSkNCj4gDQo+IEJlc2lkZXMgKG5pdCkgdGhlIHN0cmF5IGJsYW5rIGhlcmUsIGVh
cmxpZXIgY29tbWVudHMgYXBwbHkuIFRoZSB3YXkgeW91DQo+IGRvIHRoZSByZWFycmFuZ2VtZW50
IGl0IGlzIGNsb3NlIHRvIGltcG9zc2libGUgdG8gc2VlIHRoZSBhY3R1YWwgIndoeSINCj4gYmVo
aW5kIHRoZSBjaGFuZ2VzLiBFdmVuIGlmIGl0IHdvdWxkIG1ha2UgZm9yIGEgYmlnZ2VyIHBhdGNo
LCBJIHRoaW5rDQo+IHlvdSB3YW50IHRvIGNvbGxhcHNlIHBhdGNoZXMgYW5kIG1vdmUgdGhpbmdz
IG91dCBvZiBzcmF0LmMgY29kZSB3aGlsZQ0KPiB5b3Ugc3BsaXQgb3V0IGdlbmVyaWNhbGx5IHVz
YWJsZSBmdW5jdGlvbmFsaXR5LiBPciwgaWYgdGhlIHJlc3VsdCB3YXMNCj4gZGVlbWVkIHRvIGxh
cmdlIGEgcGF0Y2ggdG8gaGF2ZSBhbGwgaW4gb25lIGdvLCBtYWtlIHRoZSBtb3ZlbWVudCBvZg0K
PiBpbmRpdmlkdWFsIHN0YXRpYyB2YXJpYWJsZXMgdGhlIHRvcGljIG9mIGVhY2ggcGF0Y2gsIGlu
dHJvZHVjaW5nDQo+IGFjY2Vzc29yIGZ1bmN0aW9ucyBsaWtlIHRoZSBvbmUgaGVyZS4NCj4gDQoN
ClRoYW5rcywgSSB3aWxsIGZpeCB0aGVtIGluIG5leHQgdmVyc2lvbi4NCg0KPiBKYW4NCg0K

