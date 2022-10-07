Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 656DD5F766E
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417540.662263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjvc-0002b7-Az; Fri, 07 Oct 2022 09:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417540.662263; Fri, 07 Oct 2022 09:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjvc-0002YM-85; Fri, 07 Oct 2022 09:46:00 +0000
Received: by outflank-mailman (input) for mailman id 417540;
 Fri, 07 Oct 2022 09:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcYz=2I=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ogjvb-0002YE-5a
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:45:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d815a249-4624-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 11:45:58 +0200 (CEST)
Received: from AM6P194CA0043.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::20)
 by AS4PR08MB7856.eurprd08.prod.outlook.com (2603:10a6:20b:51f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 7 Oct
 2022 09:45:56 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::d5) by AM6P194CA0043.outlook.office365.com
 (2603:10a6:209:84::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28 via Frontend
 Transport; Fri, 7 Oct 2022 09:45:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 7 Oct 2022 09:45:55 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Fri, 07 Oct 2022 09:45:54 +0000
Received: from d67113b57749.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7068B80-70FC-41FD-ACE5-4ACAF789F9D6.1; 
 Fri, 07 Oct 2022 09:45:47 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d67113b57749.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 07 Oct 2022 09:45:47 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM7PR08MB5462.eurprd08.prod.outlook.com (2603:10a6:20b:10b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Fri, 7 Oct
 2022 09:45:45 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 09:45:45 +0000
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
X-Inumbo-ID: d815a249-4624-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=goutojhQh/c1cVO5Uc3YkSF3NE1HvqpbQOtTKA10OeMiQSB3JLgeWV6Bg9ly5z/tFJmNb6y+hLvhrpkW8NVsW78bIB6y3eseneJ4NWtZBD5HkUUtPZD7Imh5wUhatiD6PEOsYvoDGRCdNkDKoPLyy0/3BzD+2V+X2NRfNBruDDnZMdHWl8wKCtvgh/aBI2ArDOgQtJMWXP42LsMr3uCuPwfOQi0KM1w/Pww4roHJGpuDtXfyDDEhtfyjQ5IITgtuiC6IR1+CCeeARnIHX1pVORdJLj4sWY1UWOOIUFHkhabaD1wGGFaRHtPi9emszyW8CuF5zzhq9MfAVX6GkI2/Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2dp/hkETdq+jEJEZrjsC5obl1er0iJiFvNVBDPQVLE=;
 b=ETKnlq5hmetOVuDdaygbFmsjJS5Bt9TKzApKuWzj1nLpOlvwKGmR0yuRDm3LhYn4cogYNpfkTtX2h7AUKyBV1Il8Auajy736b/rw8OxsdryTwBl+ji447YmTiWL68CPm+FSZVNm5v1qVrWHQ3K5nEnRn/yxDnAu205xUZTkpG1ANE+JjgVd00SZs1IfN4NYoTyPDbLUBVMDdZ7GNcyJEy14VGu5NDvQoB96WjRIZFkrkUJKqEE8MDihsQcFtylWjLOA/34e5kQ1U/j3SNMjGuWFgIfW1oa6ifLS0+JVV76jS4KZZ/vRGahDUtvo5SEi/afpAu5jcVaQue4Fdeljrrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2dp/hkETdq+jEJEZrjsC5obl1er0iJiFvNVBDPQVLE=;
 b=m6SxObc9R14gM1zhMWk7pQ64OI+8MN0lXOCANqRXx5j67WjGMpfrp8u3E1saADNCEAZmn8ZoBynPphLzw0BG3gIcmt9tBIT0t3m+jkrrGQA5ElWNCuHxdHJ7QOijuLdywwewYv8aAIdqmSeShXbXlKKaS/aS9/i7JgBXJBrS8uQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jub1P1W9aWqjaiMfXtJjh78b816ehRNsApMph+qtQSAyD9CCjKq4KBZv07JFF/cCuuo9RNlaUrHMKfXWDGcKPWsOdrWLd3ZDmD6zQTdTUVoHMa0SmeEz76jDKU1Ed4s6SGt5KBsRcm2eqA7QxjzLV8tXtc4LL9vkrGNeZ3Ywjo29ScVpEIjP5uv6cnFThKLdtAXPtz/P9r7todtq5+EZgGUQqPSRXLMdAdDSLSLRhcezzmorkOTVAMNfo905dNSO1EEkDdS5QkZD6I2JeAqHf289aa2R9f6t3bppJfxysLraj8MN910eyn1tBkz6MSS7CJ8rynkNgGx8Uogs++ZcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2dp/hkETdq+jEJEZrjsC5obl1er0iJiFvNVBDPQVLE=;
 b=X9G5I8SfdbOm9g9XnKz/dIMMxge8YjyVfC5AfVytg+M+Z3nTznaUN9+vBr5t+dc36InVwAlOLmAqCsvycoC1J8pkg2f7JtB0sPtx8HZ5MSpPU9KWIhpfCB6MXvXMySKeMJi0a/wzTikc7JrT9FdrSU/qJTxjuXt5BpMp4GGRiK5VuE/C/I99YnR4UI6mf+N/r7+sp7r6WaGUKY96Oi1m1pvPAh/IihtakWXzOl6TCHvcGPaDJf2hR5+0mHAgBKVtF4qkbCpcXN+EVNi2xlqBs+xE4t/LwtOQJ+2mHHRku1P1maDfjeHLHnT5VYC/qhm3DLYaJaiRTgfWyxU8Gqq89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2dp/hkETdq+jEJEZrjsC5obl1er0iJiFvNVBDPQVLE=;
 b=m6SxObc9R14gM1zhMWk7pQ64OI+8MN0lXOCANqRXx5j67WjGMpfrp8u3E1saADNCEAZmn8ZoBynPphLzw0BG3gIcmt9tBIT0t3m+jkrrGQA5ElWNCuHxdHJ7QOijuLdywwewYv8aAIdqmSeShXbXlKKaS/aS9/i7JgBXJBrS8uQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: RE: [PATCH 2/3] Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen
 4.17 RC1)
Thread-Topic: [PATCH 2/3] Config.mk pin QEMU_UPSTREAM_REVISION (prep for Xen
 4.17 RC1)
Thread-Index: AQHY2i0iNvIS4M4430ia2nWq7paZZq4CrrIw
Date: Fri, 7 Oct 2022 09:45:45 +0000
Message-ID:
 <AS8PR08MB7991B5B1F05DCB727BDA8203925F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-3-julien@xen.org>
In-Reply-To: <20221007091341.58542-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CBADD725FA84B749A88083E5CB0841B2.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM7PR08MB5462:EE_|VE1EUR03FT059:EE_|AS4PR08MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e23a8ef-9081-427b-b1dc-08daa848baeb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W9iiXoim7OX9uQhr9Gjk+ZVm8aMTlXUE+j3XwLlLxJn+eG6fu0z+CMCEpVD7SC7gHo29tAWosGKTRgdc6QBBFH9FSzhJqgNJCQgqJKFBUENcZvXvmjICbsPjgSJFDvVgVKz05CsnffNcoLUx4jM/fz/dluhL7lA71WaOW67DoxepFo7IsajNmuXzgEhhFmh4v3lbeHxhbYG5HaVG3j3IDNE/kNVtDHr2A10F+EJrThZDVpTkYkEAhjggPHLmrJOhZEDe9KpIJUc4kW93VnfKKzt+MsKvfL9lFxW6vw3eLQ4x7gKvUPvxIFBUYIPSaqByTN+tpcxro8xJMjHw16fe9TO6WZVe3Jsv8U+tB/mo41TzgKGeQThXbH0jZkdZFENlCU25cjzPaVrk0RBs8SNvMDsmC3jrZ7LNTm76zJ7NZd6Z2jV90bCoPPcXFYZbF4Wp/FydSGwnZmzb/xQ2ldDJZQIDUPXyIi9eq4Ru7u9nDN0dwseMJ6nXuXZpDzrqr958DltEaRrrb1FBr0KHLa+n+MKMxY2CaT1U03cada1Lv2mBS6VO7J0W1ad39/sHhJr950sFDq06sngh9xO6eXuVUsRIGL/a/OxfNu+Zl7/2XdwpGNGtmQmvF8FJvDm/7A8o3dSPOyA2uIoxxB8YcHYxaonY4QMUnP8OjDBKTlWwRMPDg0edcDXmpxi0YATIU9jBRMfFgq8XTES2fpI/eiAEbPvwk487Hop+xseEFEFPkQ5r7VMi2ILKlQZXbebkWlurot8y/2NzocIPMan1SeVctA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(451199015)(122000001)(38100700002)(86362001)(558084003)(55016003)(316002)(71200400001)(110136005)(54906003)(38070700005)(52536014)(66476007)(8936002)(66446008)(5660300002)(8676002)(66946007)(76116006)(64756008)(2906002)(4326008)(41300700001)(186003)(83380400001)(66556008)(7696005)(6506007)(478600001)(33656002)(9686003)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5462
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	52a532a8-3c2f-498f-98c1-08daa848b4d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q79bGMsR+/4rCVazFv1y0zvd46x5JLVQESb3Oat8hITjfjOYVN5UCCLRFFY2Ur3NU3eJTPYRRraQ8zQR4ZCG5VpYNl48DZRCt5XHe4laCujUDS60iRPYH67mj4ln7ZIN5QjinnDAmglb4PfcPb+COaZ4EVofB1Yn9z+Z0Tle42mUyUfMJ1w9XHMuleEkFJkqQ7TjS/nnEP7FKDKFsCbDuqfRd6LGmz+rv5oeqluOKTFIo4SoEtk3UMvQR9x20feL0CiimV006awZNnkj5fzrgEE0F0dbiBIHd9byij5LRLeh9HieiUnNlDRmX5V+dIwYhUkCFxfwWqRD0q4+Q/caPuYVe5SxnlhlA38/Z+/I0wF4YEoRzvaBlQFdsCgMfdTmGJJtDCP8moN9R3FWVSpg+4GsIsnPb6oK37iSudj+RH3OeMCUBYT3zASqP8/6bq1vPof+Mo1wPVb6UmZ7CDOuKWNQbt6FotLOAIbPshY1bG5tx7NiFtMt04cXUS+bXJwxmqL+j051Q++oVGhlYL/H0Mk7vCsHpJmu9hKMCNAqr+UBqB1Ndpbh/Ugejz6YH9I26JzOpXPteyHiWIt0btcVaqek4fImRmmSTbHD1KSQCrfj996wpwO2E6gqoPY6mG0wxmOnL4m0ocRITq6DGwDC2cqApMkbg1qbNsUaEEatvxzNQzIHackXIOp5qQagv9LTSAxxnTfcfalpkQG7Fgu+M19DCIOPEDOdNxLkrMR6UTPGkSJNyJpRmNwgpAD66O92JO0KYvpGVZ2ntytQde5xsg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(9686003)(81166007)(83380400001)(33656002)(86362001)(36860700001)(356005)(82740400003)(4326008)(41300700001)(8676002)(70206006)(82310400005)(478600001)(110136005)(54906003)(186003)(2906002)(336012)(55016003)(70586007)(7696005)(40480700001)(40460700003)(52536014)(316002)(47076005)(6506007)(26005)(8936002)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 09:45:55.2318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e23a8ef-9081-427b-b1dc-08daa848baeb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7856

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH 2/3] Config.mk pin QEMU_UPSTREAM_REVISION (prep for
> Xen 4.17 RC1)
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


