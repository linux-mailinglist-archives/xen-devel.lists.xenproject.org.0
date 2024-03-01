Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304E86DDAB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:53:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687574.1071226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfydb-00081m-WE; Fri, 01 Mar 2024 08:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687574.1071226; Fri, 01 Mar 2024 08:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfydb-00080G-TJ; Fri, 01 Mar 2024 08:53:03 +0000
Received: by outflank-mailman (input) for mailman id 687574;
 Fri, 01 Mar 2024 08:53:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UZ9D=KH=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rfydZ-000808-Rp
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:53:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2612::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1af50940-d7a9-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 09:53:00 +0100 (CET)
Received: from DU2PR04CA0326.eurprd04.prod.outlook.com (2603:10a6:10:2b5::31)
 by AS4PR08MB7878.eurprd08.prod.outlook.com (2603:10a6:20b:51d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Fri, 1 Mar
 2024 08:52:55 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::dd) by DU2PR04CA0326.outlook.office365.com
 (2603:10a6:10:2b5::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.33 via Frontend
 Transport; Fri, 1 Mar 2024 08:52:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Fri, 1 Mar 2024 08:52:54 +0000
Received: ("Tessian outbound c926391f1b75:v228");
 Fri, 01 Mar 2024 08:52:54 +0000
Received: from 276963e644b8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 42E86B3F-65D3-4FEA-8F48-BF740A84BE56.1; 
 Fri, 01 Mar 2024 08:52:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 276963e644b8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Mar 2024 08:52:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB9265.eurprd08.prod.outlook.com (2603:10a6:20b:5a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 08:52:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::99ee:f28d:84bc:97cb%7]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 08:52:45 +0000
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
X-Inumbo-ID: 1af50940-d7a9-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LVp3bR+m2xDVFDlA020wGOJeDHiWnwar0jylsEVB2TbacG9RG5bucP9urWSBETzIFtGh4QwotXy7bSBLGjaHrT3m2m2Mj2Kfl1NAOs159S4iM2n21xmrO1DYCUKS0iYJSEstpXjUUKDgPFq9iFC5XbRUs1BIZzsTnNNRHzbOE0FZ4oaBZT1Oh4yLg6sHZ7KNkWs4f6X1J5S3sryfpbAc0Gf2VYsdokqA5ebjM/H7iivLsWMQsHguOj5uf/HTluAOYep42MAGQckHPi0HPLKE0vUkN7dw5Dw/hwx+ciKd+2rDOFFP826Sl6yo1FJ9j45MV4TFquItVGkkIZ+54UKObw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WPzIwlAKDARI4yUW/gbtgl3v5eZeyLtCscQ/GDqGIA=;
 b=RRQsWn4wN1r/Mw5TvO8u406+PlyFMMpb3iaKDn8c5it4wrHpJjBdzcpeRjAocPi4VQVL6LgJ2Oi33AmpMEeFh3lJX29MZd+t6Lf/piOpXoMH3ttKB58QEgtLUhuYY5a6m6l3fk32HKhcj4sMyz9TQe5/fGEoRfUjCTAXA+dBj4MH+XZN94ikdQe4TWQRq4+ytj7huPKOLm3gtwA8z0TXju9WxwhwwvSx8hOr8sk0IQYZpE7v/ZpK+5M+9K1y7g31N0B/mYjEQqYj195AF3jGydPMf4VQAEp5RqXsRbja7EtlpghGul8zar8eHpR2cWZ3OZUxe0OoPX+M+n925mREBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WPzIwlAKDARI4yUW/gbtgl3v5eZeyLtCscQ/GDqGIA=;
 b=d388tLmhVlXeSmB3Mb3NX5S0UGU9No0diD2J22fpi3hQZ5F/tg6pnCPgLHrWE7tiCDM6O3UqQua1jt7td8HgWg98+5MdUqIARb43y+jerPP84wDLxfxHbDEJ5U2ig0BhCZlm7+LagAOa0J8/gpsRntd9fqA0/6NJQPoyFZUZpcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f9d1645a7bb768f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCqd9ZnbEVMHWZaFjj8Jx+rCweYDufjusuA/JqlOu9dMdaiEepU2ulerjAu5ZD3u+Sh0/JpAyL0jPQ/2MCuEYPtS035HsUDFTYITQLDB5zuZHYxkY4JnMhB+POlnuF+6B88caZYEg3wSla9bQ6jpxpQx0hXqAZx2KY9hc73YLHS6s/d52vNMT1zQCWnn4g4z63co42DsBytjpWaopWAtyw5gTage/4ksHWX0FD5bnBZp2Xh9jIHAPglhu6ywbeVevY5MPuegxaP5LX241+iFCowVPQbQSBdtwUgHiU5yzqGASmEfj0f+DePa6IHJ5kF0VAxnkU8ou+H4h4oQUA5cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WPzIwlAKDARI4yUW/gbtgl3v5eZeyLtCscQ/GDqGIA=;
 b=eIyLd0PhXko0PjpSVwciNv6KUXbPDbxfJulU8oa+4vvJdBBYgu/qDlnnOGMFXtLzPwahgcskug9UcXEyrv5rocR5Skrc3rtswuciTejEe2qmVdXPOD8sU2VDxoUXEdJmdSERx1NQZXhpRnttyqxvZK60SrX1orh553r/xf09DyhNzYATzyqBGnuXqcEAN81ZOtG/hWVPMoP21rGBtl+MWElx3aPk4zLbeTpozhOIPP5IMVhzobewmxwaoX/AwV0/8RRAD14Cw9a/Ej3GEefpJdMRM7LV76efBmvIyt6Q1XfEXtl7tySdrtzeVUSQVXW94X4AT1B293iD7weFycp+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WPzIwlAKDARI4yUW/gbtgl3v5eZeyLtCscQ/GDqGIA=;
 b=d388tLmhVlXeSmB3Mb3NX5S0UGU9No0diD2J22fpi3hQZ5F/tg6pnCPgLHrWE7tiCDM6O3UqQua1jt7td8HgWg98+5MdUqIARb43y+jerPP84wDLxfxHbDEJ5U2ig0BhCZlm7+LagAOa0J8/gpsRntd9fqA0/6NJQPoyFZUZpcI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] docs/misra/rules.rst: Fix entry for 20.12 rule
Thread-Topic: [PATCH] docs/misra/rules.rst: Fix entry for 20.12 rule
Thread-Index: AQHaa7V9eauMXGRhXU2XopY0JFvmgLEilDCA
Date: Fri, 1 Mar 2024 08:52:45 +0000
Message-ID: <D3374E14-01A2-426E-83FF-C4BDB6072FAE@arm.com>
References: <20240301084947.19241-1-michal.orzel@amd.com>
In-Reply-To: <20240301084947.19241-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB9265:EE_|DU6PEPF00009528:EE_|AS4PR08MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e6dd82-dedc-4744-0a9a-08dc39ccfc4a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xWM7S0qT+T9oBTbvuLsVhL9AChQBFzsXhhO1JUJ4yzT2sX3kFp+p8dNeL6++gPLbkLoDAwKWOxdyNIPoRJ8ZmmUgW7iRUyYUu1pxKUQpLtY50S8zlJMkUUvuTMhuwaEJmPIm6Mw0mgsUqMKWwMzw0o6tfXYsA4BAR1GimnVkeUaEAJ0ICWsQZYoBU/w4cZ8HnhLrCTc3SzxqlwIB0mHC8j/SfJcQ/63PoyqO4krnVqVD2q2/bJJPfzMPnD9a1k1GzGVSsrtrCIgUkk8yMfLCi+N0YTGwncWtqPpaRyeMiPhn/IK/Mn3sA56q9W0GUf+MG1PuEXKNRMabjSV2JcW47l1J34v0EM1xVqLttB6klHJwU/4IfCEpayWdJ/yB759IRky9sJ9F5CH+e/YHovZ5jyEfHsIbUVqojxZMu4AkgVjoSF42L7TPoKY3xp0ugPYakauEVBW/4BrJ+wrWbn+ly2oBTki35COUWjwP2UwXsTZOAz3Y0YBz45DwvLmu9BSSBXWaVZROR/qpbCid5/1QX6oAl/74dnDWidjt5QVXXMHL3ahJfOuvtFIPPtKxJZzRAy5dS80+2oEfZa/XCckj+NlshMUljdPVqlMZkx7Jv2Y946sIumBuw8/zsc1gySo5SGbgZ084rJm3p3WFb/frCahFznEioGln2dGXNVXXivA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CEBEF1546ED68C43B0A152C6FC3C4703@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9265
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d784b01a-8158-4243-7af1-08dc39ccf6f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6S1mhdCGAY9AswqKVNoJEzzwG4f31Q53JgntoMd1+m1XR7FCObhqS7I+5wtDgMnov0VT9OjGfRbwWh+xFl08MCgFSIHsLaqUNm5R9izTQBjaXLjwuvvdhcv+2Lpenh9CjAjTrP+865j6U5V1JYCBozMz5OsegWXnf6nVHF27+lucUlj0acDedGgzhOrvAPQh1IqV8cKUEvbRpF+qB/clDLuo4reUDwDQbK7WwWwtf128GonLrEn0BY+VWbjjwUoBot8Qtnzpzc0H2SX/d99AAOjBg5I/ZQjb4hPHRduThr782e536a96wvLbDCCjUeeL9s1F1JNxX364f4JYcbORavQ1du+egajlwDar+wpc9dRoNoxugSLN4RzjHh1v+Pzxhccx4ZB2Lp3ZeEc+V793bcm7W5seWGXq88dCBTTxAH8sR/S/awGzhzzuI4ncFyhOBxe0TdlJYWUu4lca2rA3nyCT8LyrHq7Br/sUsI8Qzeo0oQroLbzJ9gaDnUnEXPj7fogibQCptGrcM3auOC8J8LUM0AIbcOHWDs/1olbYqGL18XS7bv/v9abaBt9dKCD5Kxebcs8TMntUySyGsHxZpE/uFku5iIWzjZgHIDMoy5oj1/kB6HyUUPD+KKGN2NWR30YRCvUht5l8HOTdKVG+ZuFLzjYSRmwibq/QRDbHs6fFWCTR4vkrtUHRWaxqanWD8ONJLl5T2OwhhnyuNXvMxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 08:52:54.8433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e6dd82-dedc-4744-0a9a-08dc39ccfc4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7878



> On 1 Mar 2024, at 08:49, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Commit 4cac80e22600 broke the CI cppcheck jobs by adding an entry for
> a rule 20.12 with "Severity" and "Summary" fields placed in reverse order=
.
> This leads to an error as reported by convert_misra_doc.py:
> No summary for rule 20.12
>=20
> Fixes: 4cac80e22600 ("docs/misra/rules.rst: add rule 16.6 and 20.12")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Failed pipeline:
> https://gitlab.com/xen-project/xen/-/pipelines/1196428827
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




