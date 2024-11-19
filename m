Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A2D9D2219
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 10:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839806.1255590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKAK-0001PC-1p; Tue, 19 Nov 2024 09:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839806.1255590; Tue, 19 Nov 2024 09:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKAJ-0001MO-Uw; Tue, 19 Nov 2024 09:04:55 +0000
Received: by outflank-mailman (input) for mailman id 839806;
 Tue, 19 Nov 2024 09:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pc1c=SO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tDKAJ-0001HZ-7v
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 09:04:55 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20612.outbound.protection.outlook.com
 [2a01:111:f403:260c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55b8fc64-a655-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 10:04:51 +0100 (CET)
Received: from DB8P191CA0025.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::35)
 by GV1PR08MB8177.eurprd08.prod.outlook.com (2603:10a6:150:93::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Tue, 19 Nov
 2024 09:04:46 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::a8) by DB8P191CA0025.outlook.office365.com
 (2603:10a6:10:130::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23 via Frontend
 Transport; Tue, 19 Nov 2024 09:04:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Tue, 19 Nov 2024 09:04:43 +0000
Received: ("Tessian outbound 6970ca6dd121:v490");
 Tue, 19 Nov 2024 09:04:43 +0000
Received: from L3c8844d4f5ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2BFCF45F-08FF-4E45-9EC8-9F2A55D8D34D.1; 
 Tue, 19 Nov 2024 09:04:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3c8844d4f5ec.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 19 Nov 2024 09:04:36 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 19 Nov
 2024 09:04:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 09:04:33 +0000
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
X-Inumbo-ID: 55b8fc64-a655-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwYzo6NjEyIiwiaGVsbyI6IkVVUjAzLVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU1YjhmYzY0LWE2NTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDA3MDkxLjc0MjU3Nywic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fpk0BiHRMXQGgUplIFvioCoJo/o9L3gPojUbbQYawG7K9Gie4wrTCwzVSd4xbdfHk9VTulyrS6tdVhv28wrk/WQwZLy45oQ2odYpp8X8p5qSfeMr5cBUCAxKJI20PiRDswuiL0PfgZuQqChrqXEB8RxC82iAWdTAeGohQrpj0O9Etys3bcqQUuWKTTFy+VV0TJmA9ay87wOjLLm8hQa5diHhzHsn59ZTwzIzjnLvCzbmEoQnKSVj/U4dMsY9vL+6JxIok3vzEhBXZmQcyNUSSSYEGGjuAWWvGNk239Q+FhFYFla6x19b88N+Y673WSHyjQR+oPlR6o598KjeP0SrFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vACK1HSaHzL/mz7Rr6i7agxoMX1IUmNc6nweGCO74o=;
 b=QqeJDLgtSInF9JfVmut7S9zGboFvtHQB4gDKVQoEWND/wPM1SuzDPdL7uO7ycWznqBp68EZ3RxCoSz918XgJmOaENZmlUNjgSoOK8t/PcqRe4IEPcuzUY6O3Opb4mYXUxNOcoMHLPHnZylIz993K2XyiIF5Z6SCiv1U3OmWUeZ4/3oPf12KQgtpKwZJf85HMU0YPa/XXL/X9jN7XCc/mbQfBfIhXvH4oZjtbZGbMoNDs6+BJybyXhgckQmPAXPYT1EMPXm6f8EKd9psmm/HrS/BdmI6JNpZSUgdPBkd45V3Qec8SMz9jpPjCFa3X9ipythAk9rCacPriAjxEJYmuxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vACK1HSaHzL/mz7Rr6i7agxoMX1IUmNc6nweGCO74o=;
 b=alLP63mJeIEdt/xuC3nvSGn+PWFAYdFyQSebUp0+qzlAqCl6hY5r+kgmh2FJuNH1W48lCJzFho+nX6bR7P/Dbc6r5mvoShxVN9ZZYj255PdYeNIIGzm10HirB6ImxzYnR/nRFqUKIr27YtIirxO8iBAnzvoUnNhxIFElO2XqtD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d40c58b972382904
X-TessianGatewayMetadata: k9aeK/jiTMdtLpBfZcfDiYZVPqzF6i+UWoS5YGYn9Imv3J8/lA7DQ9TZ4jhOKOg+ewNznLyKyDWrRH4vpRVC/dwSHz1uix+3ccL+uxelfbnEAv3JrHG/RwExQM0KAuR+RSpgE/Ou8uvaexxFxmUP1d8rzDZcLkVHv0vY4h7vy30=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpfdek2v1mrhOkPpP1H/hhK0LOlM/PN4do4N4OYB8VDl8NYq61EHCxiY06gOwzG9AmFgzNGJAaB2dt5BaoAwufrnqtnvdpcn66fZ2fudLWZpDrrY7O7ROEDM1NxiNs0Ui5ymblu+WUglxSAaAxZcEbDXrpVqn5402d0cctzXt5Squ2O8xk7lwpZTme4GYjAcgW0HOQz1YAW1T++qy5i6wfXDSYXzHk3QHKIfhUryXtf0hqmVo/8oeG45nudRilxIPk/yIGfeQlO9neNIhtgH5BHcGg6+S07lO9ktXpwVN672lKnpHzdsCYkBIgEqYBifbNb/o8s2tDgU9IQqHdAvmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vACK1HSaHzL/mz7Rr6i7agxoMX1IUmNc6nweGCO74o=;
 b=mtP5KvSqJuCcUmK+z8efwoUQzQ6b/xWbIkG1rgVFmQ+dAgsl27QzXDJzk8YOnkUpDNvXL13MXv/4UctN2LYI4tWhu6RjaZ9JmzBcWoTW+zTNO1CrJNlAaWqIqToJxjg88RvJqlvaKggnhxgQg+v9RSsulSHU1IgIpzKpS/rqzqaLY4ch5n1O2t6zqfBM7GNohGrIF7phjEeVujXkxOLE6LFzP+OiMR62HjNz4wXlsBezYz5l3qNodRecP0cF2KhJPaRAhSBuezDl+877RV35tDJg//KByGT80tpsEDA2KXEKx76V8SfUKDz0exz+rmwBqLBJhVgOWUwyCJgQ7CkGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vACK1HSaHzL/mz7Rr6i7agxoMX1IUmNc6nweGCO74o=;
 b=alLP63mJeIEdt/xuC3nvSGn+PWFAYdFyQSebUp0+qzlAqCl6hY5r+kgmh2FJuNH1W48lCJzFho+nX6bR7P/Dbc6r5mvoShxVN9ZZYj255PdYeNIIGzm10HirB6ImxzYnR/nRFqUKIr27YtIirxO8iBAnzvoUnNhxIFElO2XqtD4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Munakata Hisao <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index: AQHbIXWuBuVgfl53Mk+cNah5xpYpeLK1GpsAgAPBuwCAAPyRAIAEqDkA
Date: Tue, 19 Nov 2024 09:04:33 +0000
Message-ID: <1E89C10B-2307-4076-A018-0E1722DD22EC@arm.com>
References: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
 <4dbf2c4d-f7bd-4032-b52f-29c24e3ec055@xen.org>
 <22282f26-5c66-444b-b63a-d5442e6fcdad@amd.com>
 <04a358de-ed76-46b4-bc09-f3f343e09186@xen.org>
In-Reply-To: <04a358de-ed76-46b4-bc09-f3f343e09186@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI1PR08MB5422:EE_|DB3PEPF0000885A:EE_|GV1PR08MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: e1630d13-4efd-47eb-e9a9-08dd0879359e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?xG3gPvJ5ABDyk3hyugPfovF1QQTYEcEawmvsLGFr5WW5ttft0eI2sTCog+yA?=
 =?us-ascii?Q?t7zP83gV0I0Ux12htykaixA34p6njQx5yRy1kaXfpFuxDb3I+ErsLx3tROhI?=
 =?us-ascii?Q?Z7u2I0hM+m2eztho9z1VtpRgp4EMGdJWnVRaBR6ENxmhck9WkR1TNC68jKVJ?=
 =?us-ascii?Q?6j1pjPVoGcVAnPfQsxmobSW2I1GgRaThKD5WoLbVbbsoZx5g8Z5UXPcMe77O?=
 =?us-ascii?Q?YKbLXicGJDBuTd0RBHFrjiRzIjE29zfx8vPOzYVSUF1Lp/0Uwy1M9WMxU6n8?=
 =?us-ascii?Q?5CzhwNBA7fdd7+sTqtoJ8+u+eOv0cUcEQ5DF1/vOkEXlDMixbPYV47WcbsGZ?=
 =?us-ascii?Q?WvdMVY+2yawZBeW7bBbqtS/T/Kr4+x7LaEQnevAawfkVNB8/XBGjP55V4Fkn?=
 =?us-ascii?Q?aWaBrfuVh8r+QRsy+H51CNpgL5BOLGllJRDB3XFfQ+wW5u+6lSWXp+pH87bl?=
 =?us-ascii?Q?QDQWyqIlgv/I4wNSId0IBy7wD1kynySAKxP1VCp/0fOY29UVTust89HAdyig?=
 =?us-ascii?Q?DxGNKJ0Od5AtUk1C0Pf0nHGlhsSm9cNsekPMwWVUut8upA0+AZ+eSBX7b0Fq?=
 =?us-ascii?Q?fqL3kJlupWZScht381jCtdXeLroPljREh1+oK+G1AV5boP21aDM9q3MICixa?=
 =?us-ascii?Q?Ohvgj5xEJwPHq1Abv8m7Le8ZGFk17ManrHUISWoHPuWhnarwVupUjbA5+RV5?=
 =?us-ascii?Q?dY1lyf6XF9NDHK8b7jfjP4jzvll2R6fSKY+fIv3mtFR+b95kYbHfsD76kFBd?=
 =?us-ascii?Q?piO7urKk3/utmpuk3pCfBv7Pqa6g9gmywJdaLKzoRJCDtu87H0aeHP2aQfsN?=
 =?us-ascii?Q?XII118QDF4A7MMGsfvuN2+LvcXiVRhqGe3qHhoHfddg7hlvkbrpHJM48TRDV?=
 =?us-ascii?Q?5ba29iHaUR5Eh5p+UL98vzP550RRnMSkq65nmzgZ+PdkpEZP+Z2QOwL4uLuC?=
 =?us-ascii?Q?r65LLBiEpIMTHlSGf967yAUkWw/AoAnJ3fp6Tevm2IUQKof4YAGGevycWA0w?=
 =?us-ascii?Q?YIJ88NN8D3Al3IgM4r8qjenZ2bdL5XvZtvHKYzeiAAqsD/eI83ubHj0J8D0g?=
 =?us-ascii?Q?pk0Hi4153WH3PhVGhlttFN88Fkzq3asXnC64AG+rliGf9WFWel4T9Si422oy?=
 =?us-ascii?Q?o3sthtb4XRt2ZY6Tm3BdzRD8xE1wXyChYvzbP1SdTDJbJAn0Ia+RKk6L06ys?=
 =?us-ascii?Q?RqXimOR8VbxSnQIhfVxqcpa0hYyhz3ezv6jhYrFgjuFCwa1URYsy/MB5xX4R?=
 =?us-ascii?Q?nMIK3gx7GIpoVcl1Fwr++iMdJ6kAKn24zTW89Yy8vr3+aG9TxmUoyuwxNvUf?=
 =?us-ascii?Q?b6YbVSU0/jFv5DYM6QmiBL7Ax93jB+feNy83VxSJmY60j83sbYhz8unw326s?=
 =?us-ascii?Q?Iu5+AfE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B72F8A50F23E944C931EB6F828D3A444@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ebb6e536-3132-4c64-d00a-08dd08792f21
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zoh1vIWVLanp9j/6lFk6jo3m0ljPIggDFqKSJEuqIpIInBQ4lv6RzvHjPptg?=
 =?us-ascii?Q?Raw7vXnvZufNcS5MYjBWPA2if+8srtluvYuiJKFTjmKt4Y+6ide6DIQlNpWi?=
 =?us-ascii?Q?7c1v4P6ZbEiOLrVDVgvJybpPt04fPfXpboHd/g/Nhmm9w/i1lox82GFo6hHw?=
 =?us-ascii?Q?+7AGdJG2/t+3ZN0yyCTee4EDOpvEAik3OcEgFTz+hw3UQIzOQgPbr9sW1x82?=
 =?us-ascii?Q?fSDJSpsgAXhtm5JnKtmOWRQ7JNO+86rm9A4CWziq6p2JCOGLN1Y4i+13hF5W?=
 =?us-ascii?Q?UnQ0LEVG226m1AebvChPM0Txa+G5fKBj0rYdORz5Z7s81rLgB5D/sL1zlSz6?=
 =?us-ascii?Q?Dzg24wPtensgnYBsajmw8zmzteKE+4dfdy6rlmyxbim7ZGvp6xskHr22tTW6?=
 =?us-ascii?Q?9YPqaU2zaD0abhj/0EDxE4bW7P5h4eEvLPI4ImZHXuZ4hgwgISQ3Q3GkqRgp?=
 =?us-ascii?Q?cx1OT7MTlMPCl/TH9UOuxK9uRhDQq2Lo0RdjfucQkWPlWosh4zLgnOdlSy4D?=
 =?us-ascii?Q?UUxya8B6UQA8e5lgAKF410U2IxpZWZFZad+u9JS49ujJgJBk/1Pvke3Epv8t?=
 =?us-ascii?Q?3HDSq8ykU+bP2CFyE97yvhRMLcZeYRwh62xwzeXOhaR6MRRTtZZ8W9ghN5Qu?=
 =?us-ascii?Q?pIw4z1Bo3lzNt5Css1U/p7HO4oAXDgIT7IfEx9Dhqig4dLFFdWZJEGHUaJ7O?=
 =?us-ascii?Q?xIdbesu8upxpHnp8E4C5wBWi6EToujcB6GnUwhQZPD8X+YJNyib9OKcu0sDm?=
 =?us-ascii?Q?vvdpOgA3/eDnYPjxVroylWKrSkBga2aTXmRyfB3PAWySjWBJHrDVKM9XZnqc?=
 =?us-ascii?Q?HCM8ZfT6vBW4kb8EigEcdjTq+nUtej8HgOxKndR8k3rVaGJ3HlcZlLId9tc7?=
 =?us-ascii?Q?bbhuO0nPfjVK5oGIOjVWOGKqYB+7dlAVCljjTeVWj4/tLlzIHjgK2x1hzrGx?=
 =?us-ascii?Q?aUyiHDSGLwmF/EvmqunopDe/14dH86cTSi2YK6rHw4lukCIqs2enZGQg6IBh?=
 =?us-ascii?Q?IyjgTQizdYXlMbGoSB9kcDUJuymH0WWZKc5J9r8ASVWZZ+YwqDSQrBUpfCfC?=
 =?us-ascii?Q?0hJKhgqE3jNWcvXV2nDkRTt4Yf6gIR5QGATNIl7rQVRyADYiNb+MAXoMU6R1?=
 =?us-ascii?Q?tXcAOPqow0V7DlT1aCuHnMoU2jLpdXC47vsu4KIU83kp1BiAtuazustLsBeG?=
 =?us-ascii?Q?ZLTXbbsj9latgWxIJ9nit1aGMQovKqG7esqtaqdhxRqFH1GOFE+RiiDYsh8A?=
 =?us-ascii?Q?ECq5QL8q4ONLfOUTvv+9P4/+Wa4kyQ4l6rAs5OD4eSWYtEBbeJ6lvwQFdr6z?=
 =?us-ascii?Q?hL1EljdOOOS1Pn6EMyqyL5JevOMuVsnsmJ8eaIIYG3zTNqQleM5vQQ+D5uxy?=
 =?us-ascii?Q?xWHSfe2yjDJIyexCw4LUbqRZ+rBWH5br6k5apJyTzvhybiGw8w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 09:04:43.9525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1630d13-4efd-47eb-e9a9-08dd0879359e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8177

Hi Ayan and Julien,

> On 16 Nov 2024, at 10:57, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Ayan,
>=20
> On 15/11/2024 18:53, Ayan Kumar Halder wrote:
>>>> +Assign vCPUs from CPU pool
>>>> +--------------------------
>>>> +
>>>> +`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign vCPUs to a domain from a CPU pool.
>>>=20
>>> Same remark about the wording. You create a domain with N vCPUs and *as=
sign* a CPU pool to a domain.
>> Ok, so all the previous 3 requirements can be merged into
>> Xen shall create a domain with N vCPUs and assign a CPU pool to a domain=
.
>> Or
>> Xen shall create a domain with N vCPUs.
>=20
> I think this one is better because it is not mandatory for the user to se=
lect a CPU pool and you will have it ...
>=20
>> (which of the two looks better to you if we keep the next requirement ?)
>=20
> ... by the next one.
>=20
>> Comments:
>> Here N is determined by the device tree configuration provided by the us=
er.
>>> You also assign pCPU to a CPU pool.
>>>=20
>>> But I am not sure about if this requirement is actually necessary given=
 ...
>>>=20
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~static_domains_configuration~1`
>>>> +
>>>> +Specify CPU pool scheduler
>>>> +--------------------------
>>>> +
>>>> +`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a CPU pool scheduler to a domain.
>>>=20
>>> ... you have th is one.
>> So, we can keep it as it is.
>>>=20
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~static_domains_configuration~1`
>>>> +
>>>> +Assign virtual UART
>>>> +-------------------
>>>> +
>>>> +`XenSwdgn~arm64_assign_virtual_uart~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a virtual UART to a domain.
>>>=20
>>> Are we talking about the virtual PL011 or the fake emulation of the rea=
l UART we do?
>> virtual PL011.
>=20
> Is it possible to specify it in the market requirements?
>=20
> [...]
>=20
>>>> +
>>>> +Static VM definition
>>>> +--------------------
>>>> +
>>>> +`XenMkt~static_vm_definition~1`
>>>> +
>>>> +Description:
>>>> +Xen shall support specifying resources for a domain.
>>>=20
>>> Compare to the other requirements, this is quite a vague. Should we lis=
t the resources?
>> The list of resources depends on what the user has provided in the devic=
e tree configuration.
>> But the requirement is correct as it is. Xen allows direct assignment of=
 devices to domains (ie passthrough).
>> How do you want to write it ?
>=20
> This is probably a better question for Bertrand. I don't know how market =
requirements are usually described. I was making a comparison with the othe=
r where you explicitely listed the expected resources (e.g. CPU, Memory, de=
vice).

I definitely agree with Julien here, this requirement is not clear as "reso=
urces" is not specified or defined.
I would highly suggest to be more specific by listing what we mean by resou=
rces and maybe even split this requirement in several to make testing and l=
inking easier.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


