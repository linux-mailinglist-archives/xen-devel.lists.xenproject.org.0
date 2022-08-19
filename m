Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA72599994
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:19:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390254.627574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOz5n-0005m9-Nt; Fri, 19 Aug 2022 10:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390254.627574; Fri, 19 Aug 2022 10:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOz5n-0005ii-KL; Fri, 19 Aug 2022 10:19:07 +0000
Received: by outflank-mailman (input) for mailman id 390254;
 Fri, 19 Aug 2022 10:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oOz5l-0005iW-RZ
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:19:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59daaba7-1fa8-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 12:19:04 +0200 (CEST)
Received: from AS8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:310::30)
 by AM0PR08MB3107.eurprd08.prod.outlook.com (2603:10a6:208:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17; Fri, 19 Aug
 2022 10:19:01 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::28) by AS8PR04CA0025.outlook.office365.com
 (2603:10a6:20b:310::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16 via Frontend
 Transport; Fri, 19 Aug 2022 10:19:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Fri, 19 Aug 2022 10:19:00 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Fri, 19 Aug 2022 10:19:00 +0000
Received: from f4c3a33a90ff.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4FE1F3C3-7E8F-44AF-ADF3-0D59ACF6E452.1; 
 Fri, 19 Aug 2022 10:18:48 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f4c3a33a90ff.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Aug 2022 10:18:48 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM6PR08MB4566.eurprd08.prod.outlook.com (2603:10a6:20b:a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.17; Fri, 19 Aug
 2022 10:18:46 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%4]) with mapi id 15.20.5525.011; Fri, 19 Aug 2022
 10:18:46 +0000
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
X-Inumbo-ID: 59daaba7-1fa8-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Hb+Cl9KJaoOjd/rlOZvo5Shr3BirfEwPr4Y3cIHObh+tPcaTWJ9uWPx9h//Vdy7FbCXaJB8ZR8Airt/YfvQi1ogLjIi+L9ioVx7fF/D1QGzPrzqYlNXnc5OLD5b9hhxoVdbXKtTrFFBuBc8NeCBTkDQWX49dyxCPq1r9lyARU2CWI/VfqjqNrvSTr7BQwabA1wZIsOwzqEBgfVGvjMXgkLx1oTLfH76w1Djp/SKDL6aNjZTWQQcJCdzPN6MMKg8+7wpzeki7DL6LDfSziLc+00QTT2uAEEYXNi+jQS2VYIb6mKlGwtit091TSylhqM3OsmaqtkY9EIDTFf98UzV5qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f73UH0LIQxmDL/PiMutUsS/SpWhd51iSg4oXe08yPOs=;
 b=eBSvxX9seKkUbS/y7ZjitFn4iW/iHO/lb/tFeYiGV5VgZDXCYIDbeZaOhJVIhRsoWIaAsOcO+M3gmCU6OUxGJRdZbR69Pv+fGbmqQ0hWriDrW/bJnr9t1+9ZIKXGp6XbxCRIEDBICDMgpoQeAom2EBf9s+39H1wT79LvdBIhAl2ONriYvyEfokBArGL35gEcTeGREwFlDMpkxqhRYzO3l53AlVfo+aLtFan/HTdTrt1WaaBTOm5/Mr0JfngFbnRHLcqS1YD7NBhHEXFDKNC88/IWTBMQIFy+4LHJIizbrKTtQ9QY0Xl19Pb81v9X/yktYfi7LUiCnq334t+clGe9ug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f73UH0LIQxmDL/PiMutUsS/SpWhd51iSg4oXe08yPOs=;
 b=C0TxnwXgSKe1OlWXOYhB6aBaq/Qj12v7TRcSE45ymIWUs4aeKmFXPZspeMIK1iXmhd8e7G2z7gaVofzmGFOahpiQW1TaqV5ToHkeL1BzAaYxAXlyuKINqbKLGTILwCa4mofBVQ583oUQmoqzCOgFIRpUkYatDr6RXbvBS3/fkYA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0432d31d8a66329d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTf6nzuWDD0uBi9mWrm3sEXO8DjznDRArlxOA4aScd0sI+HdxBh2mJ+Bppdw9XGvNaf2sfZlHlGoe1ql5jJkotimDG/0tCtS5GTrwHGexK0Ytuab+PO1nHkiaaXooCIkbOIvIKF3UGA1elq5l10C4ScSmGMnfJI0d4VGFG4LU3V0ShXqqdafLj+LUPahHmJvgTzgUXHZXcBv6DxSw2fY9h1oW19m2pHMLJuFFA3zIKfcZ+q8Q/Z9Y350FPRSuDMLQKibaF098YENjbb+hXp8vZnYT7YZTUW+nLwlq9Aimg3zG+ZBmPPlFF+vtiV2ccbH9p+Z2lXit3w0FHHtVu8PEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f73UH0LIQxmDL/PiMutUsS/SpWhd51iSg4oXe08yPOs=;
 b=DMQwwQmxwi4wnyGmIF26QdonBld9NFOlG8cYgnoJn5spVxUJWIQVTMAEKJFyqVHxkPbXRJauULZgmqNQ/C7bt5EkskSZY3wqWnNmiLye06xLbRQfP+MjhXZxQr05SC37uhdDrT0jZy7EnanOhjCpn86pj4DZGDRqotpGvhxzq8MHdPVsuLDO3ffUkIXakv2sz4j6rg/Mq7Nbz/h8lGydTlqWUgOKxqqBMfjN7bKT0kZzZ0qJiz1oO9JJCrjFJ1F9SZ3FHvtO5thR/YtpvG1CxwgI4ap6I8+pibOlvN/3kGG7hSPxt5JPP+GeTqzAw1GBwe/F5m7iOFgidTWofB3eOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f73UH0LIQxmDL/PiMutUsS/SpWhd51iSg4oXe08yPOs=;
 b=C0TxnwXgSKe1OlWXOYhB6aBaq/Qj12v7TRcSE45ymIWUs4aeKmFXPZspeMIK1iXmhd8e7G2z7gaVofzmGFOahpiQW1TaqV5ToHkeL1BzAaYxAXlyuKINqbKLGTILwCa4mofBVQ583oUQmoqzCOgFIRpUkYatDr6RXbvBS3/fkYA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Topic: [PATCH v2 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Thread-Index: AQHYskgSn+BMkn6XSUmZynj+RN74K62zNKQAgAGMxwCAAP3ZgIAARkyA
Date: Fri, 19 Aug 2022 10:18:46 +0000
Message-ID: <F9F00495-29C0-4495-896C-5A409F6DD0B5@arm.com>
References: <cover.1660746990.git.rahul.singh@arm.com>
 <26fe963007e0a43b8fefd915027e90ddace1be73.1660746990.git.rahul.singh@arm.com>
 <114e88d3-0ec6-d51f-af41-555f79403b29@suse.com>
 <6FD6564E-8B4A-4A83-8E21-7E156878B2F9@arm.com>
 <06310bae-0ae9-d837-fc9e-bbc1209c4c9f@suse.com>
In-Reply-To: <06310bae-0ae9-d837-fc9e-bbc1209c4c9f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 092cfe6a-e5ef-4de5-7c00-08da81cc3c3c
x-ms-traffictypediagnostic:
	AM6PR08MB4566:EE_|AM7EUR03FT028:EE_|AM0PR08MB3107:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ujT7tnr5DWSHkhwG9Hu7j44+y/orxH+c4q2ziIEhZR+uSPh8C9RTVkhS/p1z2aLCZ4d+UxYS2SFOXTEJGRy+/rXYKEvCR0idwwUQfi3eqBftcuoneB9WEIaK/20jVU0FwpnlY21iYwBiNbnCvdPQ/ABprDS8Xo19BrXTaIHjjqDGuQlhJP1v8TfK96mnKsnc9nrrnzsqeueYgcX4sCBJHme1hy/MfzmpSK7N4NzNhTuNTMWVMq7mgMhhaeNgwX+d2CLP7dm5Is0ShdtQIH/XD4T6nRpLqGJXv9m6i0VIv8Tfyry8AV0vrDILRjL0haA12gJbuJBGK6QMe73WHMJ0bGrr0o5l3YToCLRjY28dnTXyMADt4dG30IJv7wBvDValAwyz4bu1ukMO+aVykct4TccNTrdzVYhabLi7q9dVhCdpyugr7MVHyA+DSfR8ZHGJ56JSUnIndZR97RoatM5zhivp47KNKpmSrmSjoPzQXWDeglAXvxe+B9KS87bO2QXN+alKZF+5ApEldwMaJBJF3SsNB2jVF1VtEMSUOEBpUW93gLK8RCVVYCs8GF6NmGdJBTVQXSm0mjGJLSqep6IKRLVTV6jif2nsSVAuZhv4IXzQG6hQ+US1wP8O9FHP+CHCmdbvrfNgWzOrS9sNEzWQ6DKUrLvV1jaBewmPP0axJSx+wMz3QUMk3y2gsbZ8+lDpqqPY6ukWNAX26lsuTWDSuXm+M/X2n+WZqllvTTUB//meYRDywVQNy6NTh3JvJmBupvaC1J5AAQBLRy9FQsa7b5g0PRGtxORXourXsAVG94I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(186003)(2906002)(33656002)(5660300002)(38100700002)(8936002)(38070700005)(36756003)(2616005)(122000001)(6486002)(86362001)(6916009)(54906003)(316002)(71200400001)(53546011)(41300700001)(478600001)(6506007)(8676002)(6512007)(64756008)(66446008)(66476007)(4326008)(66556008)(66946007)(76116006)(91956017)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4DFA61427B9CC743B0AA049B995215F9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4566
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c21309d6-c91b-496a-58d3-08da81cc336d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rV+Qd3u2F7YdW0UW6EdDss/uw9+c+V13BxGzvcFcU7lK4cON11w7EMP6xUzYw0VJ+1qSg25qNvRT939WnskMoGdXpWXik76A8/T6dVvh7t6MgWd+oQ6AtRNYPlQVSoyj7cgn+SZx/97BBpWZdV/NzELo8q+yUaJ64HULg3tSqADY2lcuFDOK9RKoSx8GFj3wm3Qk0B+ie/r228ztVF6eqjA6ZCayFJ/5wCJnri+wtgpLgN6F6lhgnVpvwbKY6Pcvbxlja4jGiaEUjhRdSfBawEbrnnmIuXJ9FS7AgDDRYT83wlao5jZpHiTMaLcJR7XvtKjSXSaH+17UGLaxYxxbAaC5DjrWoh75KD/J12KKevQtJfoShrcioeT5Q2sTIkhHfcaQHCTUDVTFvjMxQ4b7y1h+d10fOSa3fFGK6O74fWpitrf6jMcjk+gQ674tbLXV+kcxwZUg3xQpsymKFMRbqhygNPjfkKckqw7/30zew6HJIHg7rlvzsww0dvs4fuhBKs65YwNAxzVhMf50dRuBBsK1VvpCqegkfClTwUYD8u1+iUfwZFyTRFQP0M42JKvkMdSn1BsBDcicWykM6rTpIg2LqivwTtN6Y3UEzfxmJ4I2IEd3RNrZU4Isjdem2w8Rc16s05Hb3bltyqNnyxnqLYucoprPmXX2GY9U1Qhy7jDnkh6iHeeWYJQgLZNIIQuMo1YvaIOlh825pOq2W88EbpTeGmzMXLizMu036M8AFwpSMLkAag4yzed6riAzIY4i8HSWBQzfteBFi7kcDx355A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(186003)(47076005)(336012)(2616005)(82740400003)(356005)(81166007)(36860700001)(5660300002)(8936002)(70586007)(70206006)(4326008)(41300700001)(8676002)(40480700001)(82310400005)(2906002)(6862004)(478600001)(6486002)(40460700003)(6512007)(26005)(6506007)(53546011)(316002)(54906003)(86362001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 10:19:00.9629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 092cfe6a-e5ef-4de5-7c00-08da81cc3c3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3107

Hi Jan,

> On 19 Aug 2022, at 7:07 am, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 18.08.2022 16:58, Rahul Singh wrote:
>>> On 17 Aug 2022, at 4:18 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 17.08.2022 16:45, Rahul Singh wrote:
>>>> @@ -363,6 +373,42 @@ int __init pci_host_bridge_mappings(struct domain=
 *d)
>>>>    return 0;
>>>> }
>>>>=20
>>>> +static int is_bar_valid(const struct dt_device_node *dev,
>>>> +                        u64 addr, u64 len, void *data)
>>>=20
>>> s/u64/uint64_t/g please.
>>=20
>> Ack.=20
>>>=20
>>>> +{
>>>> +    struct pdev_bar *bar_data =3D data;
>=20
> const?

Ack.
>=20
>>>> +    unsigned long s =3D mfn_x(bar_data->start);
>>>> +    unsigned long e =3D mfn_x(bar_data->end);
>>>> +
>>>> +    if ( (s < e) && (s >=3D PFN_UP(addr)) && (e <=3D PFN_UP(addr + le=
n - 1)) )
>>>=20
>>> Doesn't this need to be s >=3D PFN_DOWN(addr)? Or else why is e checked
>>> against PFN_UP()?
>>=20
>> Ack. I will modify as if ( (s < e) && (s >=3D PFN_DOWN(addr)) && (e <=3D=
 PFN_UP(addr + len - 1)) )
>=20
> Hmm, doesn't it further need to be s <=3D e, seeing that the range passed
> to pci_check_bar() is an inclusive one?

Agree, I will do the modification in next version.


Regards,
Rahul

