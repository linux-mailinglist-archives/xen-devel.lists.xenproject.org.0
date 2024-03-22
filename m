Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203E88741E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 21:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697103.1088344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnlEa-0000Ih-TY; Fri, 22 Mar 2024 20:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697103.1088344; Fri, 22 Mar 2024 20:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnlEa-0000G1-QA; Fri, 22 Mar 2024 20:11:24 +0000
Received: by outflank-mailman (input) for mailman id 697103;
 Fri, 22 Mar 2024 20:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4NoR=K4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rnlEZ-0000Fv-VZ
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 20:11:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2613::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59ac1bcf-e888-11ee-afe1-a90da7624cb6;
 Fri, 22 Mar 2024 21:11:22 +0100 (CET)
Received: from AM0PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:208:3e::26)
 by VE1PR08MB5581.eurprd08.prod.outlook.com (2603:10a6:800:1a0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.15; Fri, 22 Mar
 2024 20:11:14 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:208:3e:cafe::8d) by AM0PR02CA0013.outlook.office365.com
 (2603:10a6:208:3e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Fri, 22 Mar 2024 20:11:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7430.0
 via Frontend Transport; Fri, 22 Mar 2024 20:11:13 +0000
Received: ("Tessian outbound ff4e98f65004:v300");
 Fri, 22 Mar 2024 20:11:13 +0000
Received: from 6ef7f41090f0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0319E025-870A-41A4-8834-78A1EC7445BF.1; 
 Fri, 22 Mar 2024 20:11:02 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ef7f41090f0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 22 Mar 2024 20:11:02 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DBBPR08MB5915.eurprd08.prod.outlook.com (2603:10a6:10:20d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 20:11:00 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda%6]) with mapi id 15.20.7386.023; Fri, 22 Mar 2024
 20:11:00 +0000
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
X-Inumbo-ID: 59ac1bcf-e888-11ee-afe1-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GQcfoJrE1Jo4K3HvB9FaKp/nZwdjX9tuw9elym0C0p5B5JejwaHoKG/znUe1dKvrdld3jQ7NaFs7hS+GnGd7+62xhVPE/A267gqV4OzHvyughPGGekAeCp+w9XwicT9Ai2A/wMFZV087yhz7q6mGw0QD7yQ4INRyTlQBsajOBfnna/4w+2Qkp7RkYRN04YQDe2kv3dnJcOmHKS/NFyQCuNbNOU3uT/SM6BR4gJXyyX6bqTznPt1iK5PD/SAT1kSyefpIvJs4zoYmvugVAtbi2dHlG3yJ3lIXrl34B0t0JGTB6RB6GSg5TfCK+R4lWHf7ZPqN9uqqnEkmaxrjuNhTWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZJwd0/0OVccJ9HQLwWiNeqWWYJyfEsKSnk0duZQupk=;
 b=E0cqXFQ8paHQ8cUmQt6JGdXmom8xHnxd1uXXTB93v40BqX00RRuGBPxJElSi1urguqqgRnzDW6exF7hop32JDfX7WZuUwqSX28HxlVCMDw8KxQwiEdutz4A18qlLih17E9pozWHByqjodWAvB5U4ScGF249lgg/JhtbmtO5CSYZ9YcpzQkGc1y/zcsuXmhuItZVUN1KGPUIdTQ+jFOUTWh9XRgRKbl18bBQEHHCpjNPT1UeluGEB1ADjro0rM/WIHRTKd1iVBqhtWpeO12gfohKmDhjqrL6A9OMfgSJkFRy5iFTRLjFEv5eIIF6LUn+c1aj3wR5iwqjRP00sxeVP9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZJwd0/0OVccJ9HQLwWiNeqWWYJyfEsKSnk0duZQupk=;
 b=pWJ63dlolgUbe7UPN9+SopWElRrP0sPptR7p+eEr5OABHpePCTuUA0+JokcNckwMzmxzviwT2C2ZU1hCqB5s3fGvQA6Td50l19bmLbbNWltgx4Vpp+r99zr/fNcjjYtKeOtwfW01kjz/+4+j4/0yy3jqomu1BExqDV1bNyDIYhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00fde62563a4cf24
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWtm2vx67guu1L76nP7a6ZGJJCKuV3/Qo2zsOe2xf++GRjHYdCTBbi4QOAJyWtLTNfrIWCNK4BNtzBJ9CqJA96tmrxWYOgNQdqX+WgGAwANILEZa9voGf9tbekKGccseuMdkELMt3Q3A4/qrJass+hdg01C4Or/1fhYoV1WCpZKfggodWfXbzLXRqn1TvL0lMTMMcQL/Uc8ClIJ0MNFNHhjA6et0A4w6j/Zqm/B/otnF4sIGJO5BI8KIuTdsJ1OV2hEpDYffo0FGuzEZzkYOmAxAuJbSrGaFGDv6Atfm2TqGUqExSxmjuzy8qkyMBc1BoXCdY4HOrIf7DmPx9Bixgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZJwd0/0OVccJ9HQLwWiNeqWWYJyfEsKSnk0duZQupk=;
 b=X4N/H42+KZrmIPVp2IRiOemv4MhE3YkjUOqf3zQ1tcNhMp+iu1f6607bc7XW3YE/eT2AydMC/zuOptZ1gf9AjE3vpRM7LhB53Phwv1+cOfTh8nq1+Uy8HEfRzbXHsyv1vdUzCq4FiRXhhwBNNo/Mk45IvCv+QsDfx8iXcC+vzbgXvUIRJk5wH4pztF+EZ6yJuVlmK5EfjiK4rTX//Cl7Y/B+n2aNV/BsdtQm8XzkBO7RL+1ALUWLr9oSxSyXlXja9B9FlwVorQdLhQzfepqUAYyvKbCh+ToblImUEpaHuZ6JqdJpOSswlVUjp3FkEsY1V5dtSpsceSn3u8LijVg//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZJwd0/0OVccJ9HQLwWiNeqWWYJyfEsKSnk0duZQupk=;
 b=pWJ63dlolgUbe7UPN9+SopWElRrP0sPptR7p+eEr5OABHpePCTuUA0+JokcNckwMzmxzviwT2C2ZU1hCqB5s3fGvQA6Td50l19bmLbbNWltgx4Vpp+r99zr/fNcjjYtKeOtwfW01kjz/+4+j4/0yy3jqomu1BExqDV1bNyDIYhs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 09/11] xen/arm: remove shm holes for extended regions
Thread-Topic: [PATCH 09/11] xen/arm: remove shm holes for extended regions
Thread-Index: AQHadH3uaMFqvhbywkGpOv3rQeVHMLFD7N8AgABUNYA=
Date: Fri, 22 Mar 2024 20:11:00 +0000
Message-ID: <7B692603-AE39-45CB-B45A-082A123F381C@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
 <20240312130331.78418-10-luca.fancellu@arm.com>
 <9edf6716-77d9-445a-8f65-0914ffb97e3f@amd.com>
In-Reply-To: <9edf6716-77d9-445a-8f65-0914ffb97e3f@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DBBPR08MB5915:EE_|AM4PEPF00025F9B:EE_|VE1PR08MB5581:EE_
X-MS-Office365-Filtering-Correlation-Id: 628b1bef-b378-452d-48fe-08dc4aac398c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x4NPyJrlEZmhiPZICtNwZuNseUOtCBrqOYHcD5XVoTmAIKIi70mKv7k5bYhXQvmrZDwaWq+lM7oaQtBTNrDwO+oLfPFtRrOpck3NLvkUnZXcf4q5dAKY8KxdH0oV/dC/FXqgoge7hnqzpBRDiD9yh8vSFTF/p0+NfJ5F6hnidOBizcGlquCTz0KnB/LYwt41mMbICIyfMyRVghUtTFamavUUDNEeCjlqZL4YN0pWZ4tusFwQ5YbH+2/Iwq47RVepVjLS+lEaIiQwl6M+NqtyLZg43DR3nMvrfppbnSLelcqkkr7Ij3T0nUGIXLwk/94SG4sGmPk2x/bzlRq4qr9sVmMJVxEfBsS0KeRN9HjFcf3wXaau3Kmb0ln3YVw7Lp8Czyp0oMXKglAiuSGr7ejeuBxW/2mPB/T1Q6a8Ali+yNrf1EBB8qMi/jYledTNYWddsAAxVz/ApAxJ+8qo02/adHpsFuz3hHVEhFHG7Rv2RVUaT2hUT9/TzaCUDZFvahaUlFc7m1hYogcwOrjmsMBkrYqWcrB93GdGU3kyZx9YnPriiRBOPkwYG8aftFi8AuW7RqW7UJ3UwHszOc8iAtvtPYfe+yuP12ZNQG06OdtVdCLhJjAIJiAq8EwAwc+0/7lVIalsRW5HA9Iua5TVmT4f82XXaFrgvefAmQj2VhXi2Bg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <36CB8BED529EBF4CB61EDFF6ADE659E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5915
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6bbd5e7-361d-42af-1616-08dc4aac316c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E6JUPe9W+Ybq2OYO1sOCFKuIE+L2/g0WMZwdQCfEP/MmKNfdEBltcFlp1/wYjILvrBdVZiAL1/HEuwLUvoTGipK6USMEXSb3eV0vgI3HsWnpnWlu911hZuyuOHJWeGGJFpu2lQP1GkiZjzSd2EVCy7t1npIAE/4/ji4WZEbCHaKVCMk+7kffWTFzHvHn2c/z06WYvABt5YpOTYh0SJ6ktTpzL922UFjuwczL0kTd5BMPfymJMcBF8GvJP1K5jKm360NI+d62LTVeeStmm4Rqe779CyYcjugdzUOFfeg0ymjADn/MGsmoZkpPZcCtHmfrG8qdG/+58tY+y2HvWw85upbKRz8FVJSFlDRZI7FAofFEzsBpLXmixom3qv9zcWtwt1mgErv0fumXr1iWsJRzMDYw5aOY+8IGQlrVbaXdyQlSqs/IlMLs/nJadJryxWaJBLnkSw1ekUOzrcGw75DyKPLyq2NWsJF1NjcJquQUfdbHmuWw49LDFjqAE4Qpk+vf2QfbRxQ5LnpoYvbKcZ52iVx2sQ4JfrU9UXklr7+sN4nT/Xc6hS8hNljM+1Dhse+qh5V7pcEfUdl8qKcEXNUeKWtqUxBw1xFEpnW2nxJhqhdLQuZXSTn+e3rednTj676OJnKenvciFWcg0EyfgZH6kx0nOHN9G30/xNruEJjVQcvHHlSV+z77oauC3rKYS4mRp9l+/2FQtnnCa2QaoykeSA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 20:11:13.9468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 628b1bef-b378-452d-48fe-08dc4aac398c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5581

DQoNCj4gT24gMjIgTWFyIDIwMjQsIGF0IDE1OjA5LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBOSVQ6IHRpdGxlIHMvZm9y
L2Zyb20/DQo+IA0KPiBPbiAxMi8wMy8yMDI0IDE0OjAzLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0K
Pj4gDQo+PiANCj4+IEZyb206IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPj4g
DQo+PiBTdGF0aWMgc2hhcmVkIG1lbW9yeSBhY3RzIGFzIHJlc2VydmVkIG1lbW9yeSBpbiBndWVz
dCwgc28gaXQgc2hhbGwgYmUNCj4+IGV4Y2x1ZGVkIGZyb20gZXh0ZW5kZWQgcmVnaW9ucy4NCj4+
IA0KPj4gRXh0ZW5kZWQgcmVnaW9ucyBhcmUgdGFrZW4gY2FyZSBvZiB1bmRlciB0aHJlZSBkaWZm
ZXJlbnQgc2NlbmFyaW9zOg0KPj4gbm9ybWFsIERvbVUsIGRpcmVjdC1tYXAgZG9tYWluIHdpdGgg
aW9tbXUgb24sIGFuZCBkaXJlY3QtbWFwIGRvbWFpbg0KPj4gd2l0aCBpb21tdSBvZmYuDQo+PiAN
Cj4+IEZvciBub3JtYWwgRG9tVSwgd2UgY3JlYXRlIGEgbmV3IGZ1bmN0aW9uICJyZW1vdmVfc2ht
X2hvbGVzX2Zvcl9kb21VIiwNCj4+IHRvIGZpcnN0bHkgdHJhbnNmZXIgb3JpZ2luYWwgb3V0cHV0
cyBpbnRvIHRoZSBmb3JtYXQgb2YNCj4+ICJzdHJ1Y3QgcmFuZ2VzZXQiLCB0aGVuIHVzZSAicmVt
b3ZlX3NobV9mcm9tX3Jhbmdlc2V0IiB0byByZW1vdmUgc3RhdGljDQo+PiBzaG0gZnJvbSB0aGVt
Lg0KPj4gDQo+PiBGb3IgZGlyZWN0LW1hcCBkb21haW4gd2l0aCBpb21tdSBvbiwgYWZ0ZXIgd2Ug
Z2V0IGd1ZXN0IHNobSBpbmZvIGZyb20gImtpbmZvIiwNCj4+IHdlIHVzZSAicmVtb3ZlX3NobV9m
cm9tX3Jhbmdlc2V0IiB0byByZW1vdmUgc3RhdGljIHNobS4NCj4+IA0KPj4gRm9yIGRpcmVjdC1t
YXAgZG9tYWluIHdpdGggaW9tbXUgb2ZmLCBhcyBzdGF0aWMgc2htIGhhcyBhbHJlYWR5IGJlZW4g
dGFrZW4NCj4+IGNhcmUgb2YgdGhyb3VnaCByZXNlcnZlZCBtZW1vcnkgYmFua3MsIHdlIGRvIG5v
dGhpbmcuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bh
cm0uY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBh
cm0uY29tPg0KPj4gLS0tDQo+PiB2MToNCj4+IC0gUmV3b3JrIG9mIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC94ZW4tZGV2ZWwvcGF0Y2gvMjAyMzEyMDYwOTA2MjMuMTkzMjI3
NS04LVBlbm55LlpoZW5nQGFybS5jb20vDQo+PiAtLS0NCj4+IHhlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyAgICAgICAgICAgICB8IDE2ICsrKystDQo+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZG9tYWluX2J1aWxkLmggfCAgMiArDQo+PiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc3Rh
dGljLXNobWVtLmggfCAxOCArKysrKysNCj4+IHhlbi9hcmNoL2FybS9zdGF0aWMtc2htZW0uYyAg
ICAgICAgICAgICB8IDg2ICsrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IDQgZmlsZXMgY2hh
bmdlZCwgMTE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMNCj4+IGluZGV4IDlmYWQ5ZThiMmM0MC4uNzQwYzQ4M2VhMmRiIDEwMDY0NA0KPj4gLS0t
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMNCj4+IEBAIC04MTcsOCArODE3LDggQEAgaW50IF9faW5pdCBtYWtlX21lbW9y
eV9ub2RlKGNvbnN0IHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICAgcmV0dXJuIHJlczsNCj4+IH0N
Cj4+IA0KPj4gLXN0YXRpYyBpbnQgX19pbml0IGFkZF9leHRfcmVnaW9ucyh1bnNpZ25lZCBsb25n
IHNfZ2ZuLCB1bnNpZ25lZCBsb25nIGVfZ2ZuLA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2b2lkICpkYXRhKQ0KPj4gK2ludCBfX2luaXQgYWRkX2V4dF9yZWdpb25zKHVu
c2lnbmVkIGxvbmcgc19nZm4sIHVuc2lnbmVkIGxvbmcgZV9nZm4sDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdm9pZCAqZGF0YSkNCj4+IHsNCj4+ICAgICBzdHJ1Y3QgbWVtYmFua3Mg
KmV4dF9yZWdpb25zID0gZGF0YTsNCj4+ICAgICBwYWRkcl90IHN0YXJ0LCBzaXplOw0KPj4gQEAg
LTk2OSw2ICs5NjksOCBAQCBzdGF0aWMgaW50IF9faW5pdCBoYW5kbGVfcGNpX3JhbmdlKGNvbnN0
IHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KPj4gICogLSBNTUlPDQo+PiAgKiAtIEhvc3Qg
UkFNDQo+PiAgKiAtIFBDSSBhcGVydHVyZQ0KPj4gKyAqIC0gU3RhdGljIHNoYXJlZCBtZW1vcnkg
cmVnaW9ucywgd2hpY2ggYXJlIGRlc2NyaWJlZCBieSBzcGVjaWFsIHByb3BlcnR5DQo+PiArICog
ICAieGVuLGRvbWFpbi1zaGFyZWQtbWVtb3J5LXYxIg0KPiBJJ20gbm90IHN1cmUgaWYgcHJvdmlk
aW5nIGEgY29tcGF0aWJsZSBoZXJlIG1ha2VzIHNlbnNlLiBJZiBhdCBhbGwsIEkgd291bGQgcHV0
ICJ4ZW4sc2hhcmVkLW1lbSIgd2hpY2ggaG9sZHMgdGhlIGFkZHJlc3Nlcy4NCj4gDQo+PiAgKi8N
Cj4+IHN0YXRpYyBpbnQgX19pbml0IGZpbmRfbWVtb3J5X2hvbGVzKGNvbnN0IHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8sDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgbWVtYmFua3MgKmV4dF9yZWdpb25zKQ0KPj4gQEAgLTk4NSw2ICs5ODcsMTEgQEAgc3Rh
dGljIGludCBfX2luaXQgZmluZF9tZW1vcnlfaG9sZXMoY29uc3Qgc3RydWN0IGtlcm5lbF9pbmZv
ICpraW5mbywNCj4+ICAgICBpZiAoICFtZW1faG9sZXMgKQ0KPj4gICAgICAgICByZXR1cm4gLUVO
T01FTTsNCj4+IA0KPj4gKyAgICAvKiBSZW1vdmUgc3RhdGljIHNoYXJlZCBtZW1vcnkgcmVnaW9u
cyAqLw0KPj4gKyAgICByZXMgPSByZW1vdmVfc2htX2Zyb21fcmFuZ2VzZXQoa2luZm8sIG1lbV9o
b2xlcyk7DQo+PiArICAgIGlmICggcmVzICkNCj4+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiBIb3cg
Y2FuIHlvdSByZW1vdmUgZnJvbSBhIHJhbmdlc2V0IHdpdGhvdXQgZmlyc3QgYWRkaW5nIHRvIGl0
Pw0KPiBUaGlzIHNob3VsZCBiZSBtb3ZlZCBhZnRlciByYW5nZXNldF9hZGRfcmFuZ2UoKS4NCg0K
WW91IGFyZSB2ZXJ5IHJpZ2h0DQoNCj4gQWxzbywgdXN1YWxseSAoYW5kIHRoaXMgaXMgdGhlIGNh
c2UgaW4gdGhpcyBmdW5jdGlvbikgd2UgcGFzcyBmcmFtZXMNCj4gdG8gcmFuZ2VzZXQgYW5kIG5v
dCBhZGRyZXNzZXMgKGFyZ3VtZW50IGlzIG9mIHR5cGUgdWwpLiBIb3dldmVyLi4uDQo+IA0KPj4g
Kw0KPj4gICAgIC8qIFN0YXJ0IHdpdGggbWF4aW11bSBwb3NzaWJsZSBhZGRyZXNzYWJsZSBwaHlz
aWNhbCBtZW1vcnkgcmFuZ2UgKi8NCj4+ICAgICBzdGFydCA9IDA7DQo+PiAgICAgZW5kID0gKDFV
TEwgPDwgcDJtX2lwYV9iaXRzKSAtIDE7DQo+PiBAQCAtMTA4OSw3ICsxMDk2LDEwIEBAIHN0YXRp
YyBpbnQgX19pbml0IGZpbmRfZG9tVV9ob2xlcyhjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtp
bmZvLA0KPj4gICAgICAgICByZXMgPSAwOw0KPj4gICAgIH0NCj4+IA0KPj4gLSAgICByZXR1cm4g
cmVzOw0KPj4gKyAgICBpZiAoIHJlcyApDQo+PiArICAgICAgICByZXR1cm4gcmVzOw0KPj4gKw0K
Pj4gKyAgICByZXR1cm4gcmVtb3ZlX3NobV9ob2xlc19mb3JfZG9tVShraW5mbywgZXh0X3JlZ2lv
bnMpOw0KPj4gfQ0KPj4gDQo+PiBpbnQgX19pbml0IG1ha2VfaHlwZXJ2aXNvcl9ub2RlKHN0cnVj
dCBkb21haW4gKmQsDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Rv
bWFpbl9idWlsZC5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oDQo+
PiBpbmRleCBhNmYyNzZjYzQyNjMuLjAyNmQ5NzVkYTI4ZSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9kb21haW5fYnVpbGQuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2RvbWFpbl9idWlsZC5oDQo+PiBAQCAtNTEsNiArNTEsOCBAQCBzdGF0aWMg
aW5saW5lIGludCBwcmVwYXJlX2FjcGkoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9p
bmZvICpraW5mbykNCj4+IGludCBwcmVwYXJlX2FjcGkoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbyk7DQo+PiAjZW5kaWYNCj4+IA0KPj4gK2ludCBhZGRfZXh0X3Jl
Z2lvbnModW5zaWduZWQgbG9uZyBzX2dmbiwgdW5zaWduZWQgbG9uZyBlX2dmbiwgdm9pZCAqZGF0
YSk7DQo+PiArDQo+PiAjZW5kaWYNCj4+IA0KPj4gLyoNCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vaW5jbHVkZS9hc20vc3RhdGljLXNobWVtLmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vc3RhdGljLXNobWVtLmgNCj4+IGluZGV4IGM2ZmFjOTkwNjY1Ni4uMmY3MGFlZDUzYWM3IDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3N0YXRpYy1zaG1lbS5oDQo+
PiArKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc3RhdGljLXNobWVtLmgNCj4+IEBAIC0y
OSw2ICsyOSwxMiBAQCB2b2lkIGVhcmx5X3ByaW50X2luZm9fc2htZW0odm9pZCk7DQo+PiANCj4+
IHZvaWQgaW5pdF9zaGFyZWRtZW1fcGFnZXModm9pZCk7DQo+PiANCj4+ICtpbnQgcmVtb3ZlX3No
bV9mcm9tX3Jhbmdlc2V0KGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKnJhbmdlc2V0KTsNCj4+
ICsNCj4+ICtpbnQgcmVtb3ZlX3NobV9ob2xlc19mb3JfZG9tVShjb25zdCBzdHJ1Y3Qga2VybmVs
X2luZm8gKmtpbmZvLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBt
ZW1iYW5rcyAqZXh0X3JlZ2lvbnMpOw0KPj4gKw0KPj4gI2Vsc2UgLyogIUNPTkZJR19TVEFUSUNf
U0hNICovDQo+PiANCj4+IHN0YXRpYyBpbmxpbmUgaW50IG1ha2VfcmVzdl9tZW1vcnlfbm9kZShj
b25zdCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4gQEAgLTYxLDYgKzY3LDE4IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBlYXJseV9wcmludF9pbmZvX3NobWVtKHZvaWQpIHt9Ow0KPj4gDQo+PiBzdGF0aWMg
aW5saW5lIHZvaWQgaW5pdF9zaGFyZWRtZW1fcGFnZXModm9pZCkge307DQo+PiANCj4+ICtzdGF0
aWMgaW5saW5lIGludCByZW1vdmVfc2htX2Zyb21fcmFuZ2VzZXQoY29uc3Qgc3RydWN0IGtlcm5l
bF9pbmZvICpraW5mbywNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHJhbmdlc2V0ICpyYW5nZXNldCkNCj4+ICt7DQo+PiArICAgIHJldHVybiAw
Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCByZW1vdmVfc2htX2hvbGVzX2Zv
cl9kb21VKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbWVtYmFua3MgKmV4dF9yZWdp
b25zKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gI2VuZGlmIC8q
IENPTkZJR19TVEFUSUNfU0hNICovDQo+PiANCj4+ICNlbmRpZiAvKiBfX0FTTV9TVEFUSUNfU0hN
RU1fSF8gKi8NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMgYi94
ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMNCj4+IGluZGV4IDYxNDNmNTJjYjk5MS4uYjNlMjEw
NWRkM2YyIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL3N0YXRpYy1zaG1lbS5jDQo+PiAr
KysgYi94ZW4vYXJjaC9hcm0vc3RhdGljLXNobWVtLmMNCj4+IEBAIC0xLDYgKzEsNyBAQA0KPj4g
LyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4gDQo+PiAjaW5j
bHVkZSA8eGVuL2xpYmZkdC9saWJmZHQuaD4NCj4+ICsjaW5jbHVkZSA8eGVuL3Jhbmdlc2V0Lmg+
DQo+PiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+PiANCj4+ICNpbmNsdWRlIDxhc20vZG9tYWlu
X2J1aWxkLmg+DQo+PiBAQCAtNTY0LDYgKzU2NSw5MSBAQCB2b2lkIF9faW5pdCBpbml0X3NoYXJl
ZG1lbV9wYWdlcyh2b2lkKQ0KPj4gICAgICAgICBpbml0X3N0YXRpY21lbV9iYW5rKCZzaG1lbS0+
YmFua1tiYW5rXSk7DQo+PiB9DQo+PiANCj4+ICtpbnQgX19pbml0IHJlbW92ZV9zaG1fZnJvbV9y
YW5nZXNldChjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByYW5nZXNldCAqcmFuZ2VzZXQpDQo+PiAr
ew0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgbWVtYmFua3MgKnNobV9tZW0gPSAma2luZm8tPnNobV9t
ZW0uY29tbW9uOw0KPj4gKyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsNCj4+ICsgICAgLyogUmVt
b3ZlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IHJlZ2lvbnMgKi8NCj4+ICsgICAgZm9yICggaSA9IDA7
IGkgPCBzaG1fbWVtLT5ucl9iYW5rczsgaSsrICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcGFk
ZHJfdCBzdGFydCwgZW5kOw0KPiAuLi4gaGVyZSwgdGhlc2UgaG9sZCBwaHlzaWNhbCBhZGRyZXNz
ZXMgYW5kLi4uDQo+IA0KPj4gKyAgICAgICAgaW50IHJlczsNCj4+ICsNCj4+ICsgICAgICAgIHN0
YXJ0ID0gc2htX21lbS0+YmFua1tpXS5zdGFydDsNCj4+ICsgICAgICAgIGVuZCA9IHNobV9tZW0t
PmJhbmtbaV0uc3RhcnQgKyBzaG1fbWVtLT5iYW5rW2ldLnNpemUgLSAxOw0KPj4gKyAgICAgICAg
cmVzID0gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKHJhbmdlc2V0LCBzdGFydCwgZW5kKTsNCj4geW91
IHdpbGwgZW5kIHVwIGluIGEgbWl4IHdoaWNoIHdvbid0IHdvcmsuIFN3aXRjaCB0byBQRk5fRE9X
TigpDQoNCldpbGwgZml4DQoNCj4gDQo+PiArICAgICAgICBpZiAoIHJlcyApDQo+IFdoYXQncyB0
aGUgcG9pbnQgb2YgcmVzIHZhcmlhYmxlIGlmIGl0IGlzIG5vdCBwcmludGVkIGJlbG93Pw0KDQpJ
IGd1ZXNzIHRoaXMgcGFydCB3YXMgY29waWVkIGZyb20gZmluZF9tZW1vcnlfaG9sZXMgd2hpY2gg
ZG9lc27igJl0IHByaW50IG91dCByZXMsDQphbnl3YXkgeW91IGFyZSByaWdodCwgd2Ugc2hvdWxk
IHByaW50IGl0Lg0KDQo+IA0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSICJGYWlsZWQgdG8gcmVtb3ZlOiAlIyJQUklwYWRkciItPiUjIlBSSXBhZGRyIlxu
IiwNCj4+ICsgICAgICAgICAgICAgICAgICAgc3RhcnQsIGVuZCk7DQo+PiArICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAg
cmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK2ludCBfX2luaXQgcmVtb3ZlX3NobV9ob2xlc19m
b3JfZG9tVShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbWVtYmFua3MgKmV4dF9yZWdpb25zKQ0K
Pj4gK3sNCj4+ICsgICAgY29uc3Qgc3RydWN0IG1lbWJhbmtzICpzaG1fbWVtID0gJmtpbmZvLT5z
aG1fbWVtLmNvbW1vbjsNCj4+ICsgICAgc3RydWN0IHJhbmdlc2V0ICpndWVzdF9ob2xlczsNCj4+
ICsgICAgdW5zaWduZWQgaW50IGk7DQo+PiArICAgIHBhZGRyX3Qgc3RhcnQ7DQo+PiArICAgIHBh
ZGRyX3QgZW5kOw0KPj4gKyAgICBpbnQgcmVzOw0KPj4gKw0KPj4gKyAgICAvKiBObyBzdGF0aWMg
c2hhcmVkIG1lbW9yeSByZWdpb24uICovDQo+PiArICAgIGlmICggc2htX21lbS0+bnJfYmFua3Mg
PT0gMCApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4+ICsNCj4+ICsgICAgZHRfZHByaW50aygi
UmVtb3ZlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGhvbGVzIGZvciBleHRlbmRlZCByZWdpb25zIG9m
IERvbVVcbiIpOw0KPj4gKw0KPj4gKyAgICBndWVzdF9ob2xlcyA9IHJhbmdlc2V0X25ldyhOVUxM
LCBOVUxMLCAwKTsNCj4+ICsgICAgaWYgKCAhZ3Vlc3RfaG9sZXMgKQ0KPj4gKyAgICAgICAgcmV0
dXJuIC1FTk9NRU07DQo+PiArDQo+PiArICAgIC8qIENvcHkgZXh0ZW5kZWQgcmVnaW9ucyBzZXRz
IGludG8gdGhlIHJhbmdlc2V0ICovDQo+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgZXh0X3JlZ2lv
bnMtPm5yX2JhbmtzOyBpKysgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBzdGFydCA9IGV4dF9y
ZWdpb25zLT5iYW5rW2ldLnN0YXJ0Ow0KPj4gKyAgICAgICAgZW5kID0gc3RhcnQgKyBleHRfcmVn
aW9ucy0+YmFua1tpXS5zaXplIC0gMTsNCj4+ICsNCj4+ICsgICAgICAgIHJlcyA9IHJhbmdlc2V0
X2FkZF9yYW5nZShndWVzdF9ob2xlcywgc3RhcnQsIGVuZCk7DQo+IERpdHRvLCBQRk5fRE9XTigp
Lg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcsIEkgd2lsbCBmaXggdGhlIGlzc3VlcyBpbiB0aGUg
bmV4dCBwdXNoLCBJ4oCZbGwganVzdCB3YWl0DQpmb3IgdGhlIHNlcmllIHRvIGJlIGZ1bGx5IHJl
dmlld2VkLCBvciBpZiB5b3UgZG9u4oCZdCB3YW50IHRvIGNoZWNrIHRoZSByZW1haW5pbmcNCnR3
byBwYXRjaGVzIGJlZm9yZSBJIGZpeCB0aGUgcHJldmlvdXMgY29tbWVudHMsIGp1c3QgbGV0IG1l
IGtub3cuDQoNCj4gDQo+IH5NaWNoYWwNCg0K

