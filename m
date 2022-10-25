Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D26F60C11C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 03:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429473.680480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8sl-0002cg-ML; Tue, 25 Oct 2022 01:37:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429473.680480; Tue, 25 Oct 2022 01:37:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on8sl-0002aC-IL; Tue, 25 Oct 2022 01:37:31 +0000
Received: by outflank-mailman (input) for mailman id 429473;
 Tue, 25 Oct 2022 01:37:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBMn=22=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1on8sj-0002a1-Qs
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 01:37:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92570e43-5405-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 03:37:26 +0200 (CEST)
Received: from AM6P195CA0057.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::34)
 by PAXPR08MB6655.eurprd08.prod.outlook.com (2603:10a6:102:15d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 01:37:19 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::b8) by AM6P195CA0057.outlook.office365.com
 (2603:10a6:209:87::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27 via Frontend
 Transport; Tue, 25 Oct 2022 01:37:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Tue, 25 Oct 2022 01:37:18 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Tue, 25 Oct 2022 01:37:18 +0000
Received: from 75660960c6f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48317792-CA1D-427C-8AB9-D97FFCBDDB56.1; 
 Tue, 25 Oct 2022 01:37:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 75660960c6f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 01:37:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9954.eurprd08.prod.outlook.com (2603:10a6:20b:638::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 01:37:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Tue, 25 Oct 2022
 01:37:10 +0000
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
X-Inumbo-ID: 92570e43-5405-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EtSECTB1te3b9s3gd4DEiNURB83Ihwxpqc/GIlTsvPmheR6f9/Msv+4JR+MN6YwB6ggZXAgeOd3gwE/I5/aL26/oZ5u2sFBIEshtG29wJOhUkjXaZ8p16zYmrB3E0Cypz7JrJJUKExIcagf3DMh+qwyoA/o9hGFWZQT/e8FsxgYxNmydaXRJh+gKwZ/5axfGvDZKpTXqBaPzFCB+EiZtExtpuZPJn5Ye7Jla0E/qIwcY9hzXaFSr24Z/xgR0YsOOrBB0p47eluKjVWAFJqCpRbdzyF88Woso2Ticat+3AsxEl5TTuW4aBHYxCLVQ8cSe8FVPySX8D9oKJTIsiJK/RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sy4GetQrtuFJxe2BCgivJMT2+U89l6xSoj67JwFAm3g=;
 b=UgixAHEsZBMZIi38JVAmWk12t0c1nIybDNCYAvhZKVocOyBhocz+fae1Dsl0Ri/+uP6lRBUsGqX5wFTeMkOocs/1u8+sfi7SC15sfEsvIMRRZV+20cSwksVe0e3C3us1ZAoUo/GImc0UkS/wTSjc/EdZ/qfiZsVpkIyg18j1y4gESPy2lzUgnDMMrqwCguiQZAuSQ1rHJ5UFTu4tM2Il6xeWGkurq/zNIsaIIIBU9Weugq8PQe6KKcKq7E3gpHko63ivP+QGIn+0ed3x8yTieKgR/olMgiAfS1UJ8sdtEFyWSP+yt1dDJOtmqC5llb4mzCdw2AJybdTamCzunJ6ESA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy4GetQrtuFJxe2BCgivJMT2+U89l6xSoj67JwFAm3g=;
 b=1442AuybxYy1wYuSnudn66QsxXnuZxnY99sWTXs4dRqUWZmKo6tJOXd/GEjL96qCpTNkEge1aK9XeIOFJR3MhZ2n0YXBsn1XNtmgMpAYnmNcit4YSL8E0c+nQhUoU7CsqviQLSLjsRUcXJwIVl0EQuKhRfZAK3q2/jWw5z3YjZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZGQQIkixQSqSlIR94hrKwabnRmS5pdQD7/9fbYM7oLRkcANLbzmU4m1mkR/W4POLWGIrFRDTqKgfr5uTH2kVcOFDFlULoCzDrvkJEflm2gf5ScLNeAwpy0WrNRsM0xJIg/J20eObhGExkuziOVcrRJEqCVkesQIHeh8Jzorf5UVi/CWNQ4ut2sBSz1WMYkShRizeprtBwQFYO2DI/Rj8ZEbBCQHiMVPbtqfEfIvG6st4PlwnDbRsJNJb5174F4SPn/dpbugxkzBBKjOj6Umw+BWQHey2YsF514nMxJVJgnMJzMBcuNLCeUpiP3WRncQethAvOyoGZwzrbSHXMsU2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sy4GetQrtuFJxe2BCgivJMT2+U89l6xSoj67JwFAm3g=;
 b=ef7m/X1kTDxQPI4Lo12qdf1TSrR0Xk7Sj2YCvFkWiTTsHg9eGf6tGfqA6ZSao2xRcFbjOnouZ/kGBkfSefIgau8MQr5/BOCFnzrnaFp7Q3pRnKx1eKrHCWFDv83TUer2H0AFjwqhDcqJ504HVhJ2mrnenbOsuoUeHuecqCjBPS+BAQEiHIcAmKpTavP3e8nOUkNHe0WCyZXMXXFttpfbEa3vpgoRmXZdp8IaG3vV6gZQG4aW2XDee6luVUpWqS3MrCehqvwbJgeckKqBa8B1NmF4ruafGfpNDFJYvlkYvteGyy010f4HxIIMLi3lZMW2vGfVXhVkaQivmfDuRUvyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sy4GetQrtuFJxe2BCgivJMT2+U89l6xSoj67JwFAm3g=;
 b=1442AuybxYy1wYuSnudn66QsxXnuZxnY99sWTXs4dRqUWZmKo6tJOXd/GEjL96qCpTNkEge1aK9XeIOFJR3MhZ2n0YXBsn1XNtmgMpAYnmNcit4YSL8E0c+nQhUoU7CsqviQLSLjsRUcXJwIVl0EQuKhRfZAK3q2/jWw5z3YjZI=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	"xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Subject: Xen 4.17 rc2
Thread-Topic: Xen 4.17 rc2
Thread-Index: AdjoEhxyixPCcedBRYu3jXFHtM5cvQ==
Date: Tue, 25 Oct 2022 01:37:10 +0000
Message-ID:
 <AS8PR08MB79910CE0A7D0DD8EF27280DA92319@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7247F90ABC07064098E482DE10019132.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9954:EE_|AM7EUR03FT007:EE_|PAXPR08MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: cc4c267e-6360-40e0-7c0b-08dab6297456
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JNrDULuHSW3h/v4dhY8xDxu3YnQJK7ipRzXpB8Zx3prTCu7l6lHuunYxdBl+BZJoWh/7a1JWUP39EKbQ2qBdBpuHdRnmJyizGxg9Z2lvz0hxhkDtkOGybAx0RFQv/yXBjO28GOu2Q6bWO0BCA407vpHJtlBvt5MZCV2yiyP/ZhU2ETIuOhIHpVxHbnGqz05T7W9ZKB6BdDK+AmN0ASsH9FhP2oXP5idnFC1BLLUDPQCAhwrSls8JBbRrYaQnkWWD3M9Jc6uxQH2C6ZYyhCzrP6rMCmOCirJlTosub2Nt6hqo1wU+EdXrMTq/Of5Qf6WXc2+Swq+wMFbnTf7leoa7JAP/0mDxYDMDAJebBZIxi9zcxXyg/shUw8idGD7RVP0MiFHxDLlUrr3+Ub4NdVfzSZ9uIlUe8xdA+SNTO5Fwq69NnNOWSBDuySBlYdSadbe3PwcFUfu8iK4hrvI6M7xhfR6upM2lUqlMzlE5wN3MSy5kwnUSTNTGr/7WKDIy96D6SzEIfJGlN7XDi7SIPq0pI5ZA/J1lU6KsazYVAuvEpUr7ys5azYDRIy6asyGY5rs9h4XwNNlEnr5mLx8Wj6okgTGAebOLFeZWnfRYq2sFd+UnTIZO9hR61Jz7U+1Q7noYPMnVPCuOpCKIeIrQ4f0lA/PPGRF67jTuU5wWMSTx/iFzUjA86l687YuokxdNCEkal7bDczhkMZN5Tx4cBcB+lhlfInQE+X7XhG0KElg45udL8e8R0t9E2QzzVFilHfJ1ulQMyaTKaAWAH7ycesoSHm6cS5yKEDPuL0I7RODugCE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(71200400001)(83380400001)(86362001)(478600001)(966005)(110136005)(8676002)(7696005)(41300700001)(9686003)(26005)(450100002)(5660300002)(316002)(76116006)(66946007)(64756008)(66446008)(66476007)(66556008)(6506007)(52536014)(8936002)(38100700002)(122000001)(33656002)(7116003)(55016003)(186003)(4744005)(2906002)(38070700005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9954
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2fc3abc5-82c9-4f40-ede3-08dab6296f6f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bguSmOFImGLZm9UTA9cqSvyHhvXqOfU851H0MVk2K+OQ52zChWa/+6OYpyY25uhvD8nYLuUNjRUq5ymo/MSmp5hvOdgdxZv2U06hMvOZ1fPRwxjIeKffDQmLaX5bfa4+3K01jsvl/b96f/du2GzrOVJK134kiW+9/GvUkMYENZE8vIAGp38rxHCxzcOdtru1jfKKWNcrp62QtYwDpz25TrWFDKwFOkgFoly4y9aKN8d2TXf7fKbXVGmyKv9cLTMpwfhpPkeCvgkJowDS5j4gxK7/PW2FfBIBFDkv5qo60cCAxZnsJ+aXXmhN/PchZsKZh6s74A0r8EfE0Fymn1+asnB8ptleRlboOEYsi3IgZbSSsNArot+d22FrujRKYUZXJWecFlHJXeGJ08p7hPSBtODS8SF8wEgsZJjcLtv/zLqG80XNUcQ/d/JQrNVHa0Wca7kayFkm1y2deVH9F+4fSunI37vzgvsevCQrxX6i+vuYZ64i8F+8enNjGollzE/bN42r5oPeIRcTTEyv580isgVMHc4srIG7ZvMdFo5n3CRblKzxuqD/VGXPEPq92q4lVCqV3ckvE9Cq2QtIvfPNOVxMdW3r7eJKB7qBloH9wRiZMXjY9Hp9s7eY1aoZOSOsvoMekedLjTUa0J6xeP/t/f0L4cUoBL4Z04qn3xkzf0jee6QJPirHetCZFPnEkCcuW0qm48CLIvdmKQCve/7t6j5gNpLnuDW4nXfg1tuxQjHwel9Vdk2ahRLMF4IdTUMoDVuO2JHW3SOzWdyzTk8w37kTZ2Wf7j4mjUmRTVn/EfU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(5660300002)(36860700001)(70206006)(70586007)(33656002)(8676002)(316002)(40460700003)(55016003)(450100002)(110136005)(52536014)(82740400003)(7116003)(40480700001)(81166007)(8936002)(356005)(41300700001)(83380400001)(47076005)(26005)(9686003)(7696005)(336012)(82310400005)(186003)(6506007)(86362001)(4744005)(966005)(478600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 01:37:18.7148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc4c267e-6360-40e0-7c0b-08dab6297456
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6655

Hi all,

Xen 4.17 rc2 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.17.0-rc2

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.17.0-rc2/xen-4.17.0-rc2.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.17.0-rc2/xen-4.17.0-rc2.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry


