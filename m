Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3707986CE7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 08:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804940.1215920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiKM-0004sF-LM; Thu, 26 Sep 2024 06:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804940.1215920; Thu, 26 Sep 2024 06:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stiKM-0004pd-Hu; Thu, 26 Sep 2024 06:50:14 +0000
Received: by outflank-mailman (input) for mailman id 804940;
 Thu, 26 Sep 2024 06:50:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCv=QY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1stiKL-0004pX-Fg
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 06:50:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2614::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93f52c77-7bd3-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 08:50:12 +0200 (CEST)
Received: from DB7PR02CA0016.eurprd02.prod.outlook.com (2603:10a6:10:52::29)
 by PAWPR08MB10119.eurprd08.prod.outlook.com (2603:10a6:102:364::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.8; Thu, 26 Sep
 2024 06:50:01 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::fc) by DB7PR02CA0016.outlook.office365.com
 (2603:10a6:10:52::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Thu, 26 Sep 2024 06:50:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Thu, 26 Sep 2024 06:50:00 +0000
Received: ("Tessian outbound 245dacdadcd4:v465");
 Thu, 26 Sep 2024 06:50:00 +0000
Received: from L77a533f21f56.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F85BD1A8-2D44-42FB-A825-973EFB5F8E74.1; 
 Thu, 26 Sep 2024 06:49:54 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L77a533f21f56.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Sep 2024 06:49:54 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAVPR08MB9771.eurprd08.prod.outlook.com (2603:10a6:102:31f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Thu, 26 Sep
 2024 06:49:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8005.010; Thu, 26 Sep 2024
 06:49:46 +0000
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
X-Inumbo-ID: 93f52c77-7bd3-11ef-a0ba-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OUooafEVU7hRxnuRnVUAaZ6PROQdXPAY4b7wPqrK50GmnnDIjLt57TpvEjj7JOCDArCyW32X4cvNCrexxuRrEL388FsBu6wUxqt1RktFnfr5zVhIO8Glwcpa/FvhKF+mtWRm8VK7fHvi2zpfvDsrVFeu5Pf/6KEzHFn8cxaWLn4FICWW9bhigYHcBz+Cm13tNspXkdwf+DDEUCIcu2/ixTGA3ICwz7FmICfcVWAxIhdKHeoPOqKnwjFYUq0Gf42hLrieohI/9Zbih9EhHqZ7W3D9+5aZhTekMXjQFvfGAb2Fz7sXmEST/XxLXFalSi+ZfjgwrLVWW53jw4bznECzvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NchoSfXbgwlASyT7Kb+b2jrrbfUmukZB5w+0EbKdQY=;
 b=oLnP1WObEXbsrVFgw3FYIm7neP8QeNnLEq1z3SLvO7pchB+h/mpLg0e+Wbi88PYQ8TWBxvIzP5T9g3DYXBzyyEl6lGb8I3JJEbTILbtRLbiOg3A6hQztv2t43B2SchE0G5XfsaFVclbGnbuhL4sAYmPqzXxy37UcKQ8JZTrOldtFBIPky88b7qp/OjuhHQ6B+uH67Fnnd4xl6UKa5qU2yAOcxxwpsc14XyMKWtwjfmGzLJ1b3hJwQLAVe1qntxVA4O2AV0W/F4cT+zNeIYuv+4QXCpi8IibWzvIs88LhWuv4HgfV4EjUZiZHkljB/tkjgyGsbltI3Eevipi9tOhV/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NchoSfXbgwlASyT7Kb+b2jrrbfUmukZB5w+0EbKdQY=;
 b=UiMCKbQdWuKME+EJHB8Fn6eyPL7zQph4gXj/Wr/gSKH4Gt6ehJdIiehkm9Z+J9Rgc6kCmgKYFry7LX4fkinBQO0Clkd/ZPwlVDCyxgwgwwfUmDmDWpRZ5hJ+fWvxt0iR3/aqdzsvqymi5jFJq84rR65fGwnRk+HvNPnZwyalni4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7411cfe329e564f
X-TessianGatewayMetadata: oiN3X/rQNqzoBTyADfsNskXKxRN337KHVIqWRwhQrpb2Ujs43Ved6VuUU2i6E71USGmEAtj/LWoUF310zWZvWbjyjVTxnNVavm7UmsJLSzEiJm3oa91kL4C3P8gk63+YOARcrSqcDBUX3x3AE3gMmkKk0+u0WfLySNgShYRR5gA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ED3xchIFUK4wtZfVbwRBqgExGqUIg+1zFbxRZMKV/CkUhUGjRpXXjvN4bl6P+BjCE0seLZOKoREXbXRjpxLAGZtXeJbPSyzoq3z6X+E7oBlO9LK+oPlfIVUwf2w1bjaaQ2ZK+NiTCKQ+a+KmMDO7vhTAeV8f5jGTQyMg0HtpNhEXehsiI5HAFU9adPHq8ySIf6LzMq4V0m5w+oHseZiIDyxQ3EiG1h0o6e8YQPbwmxJq7+kjP1rDAY6L9p/pjGRzEB57AzAe3vLcs+46mPtgCvmBi8s1KxHOhysIlkuA6TclKM+YEFXAfyzDpmk7CrQL9IQLrNHfefflm/+vnkjLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NchoSfXbgwlASyT7Kb+b2jrrbfUmukZB5w+0EbKdQY=;
 b=WVVCh4oFxrUtLFIpQrY6csR3vSRqvZM+i691hu2TC1mqYzB8AK27DVIZL7pnXah8Y34GHrC+xneWcVRKkZRkQvNgVRs5fqxjnGx1paW8O4RwL3bPTw+vMtJakTKqzPht67D6NUvv/te2iJjwcFIhd84nNBOR1a3M+CUNFK8GXCrRWYY3rhADIDt6x0z3d1NstUXmWF8eZOJKW++gI25Auj90lziQPyG2YX9PpL+Tk5XBCDQh/IUFHGDl8WA6/BRb3OuB3VNffo1IDwuerbshSofZ2kvbhOgOpgnuwMzcYaEpVzg+1GXPrdXVJQqwmSlXQZixtHD4p4t8SdPRhL0/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NchoSfXbgwlASyT7Kb+b2jrrbfUmukZB5w+0EbKdQY=;
 b=UiMCKbQdWuKME+EJHB8Fn6eyPL7zQph4gXj/Wr/gSKH4Gt6ehJdIiehkm9Z+J9Rgc6kCmgKYFry7LX4fkinBQO0Clkd/ZPwlVDCyxgwgwwfUmDmDWpRZ5hJ+fWvxt0iR3/aqdzsvqymi5jFJq84rR65fGwnRk+HvNPnZwyalni4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 04/10] xen/arm: ffa: Fine granular call support
Thread-Topic: [PATCH 04/10] xen/arm: ffa: Fine granular call support
Thread-Index: AQHbCo5KX65uygb9tUuG+eWGxSrgRrJjyouAgAXg2AA=
Date: Thu, 26 Sep 2024 06:49:46 +0000
Message-ID: <AAB3411E-0812-43F6-9A79-A2BD69C4B8A5@arm.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <bb7e497fa2b03e0176b5013a05f342f3ea5ea296.1726676338.git.bertrand.marquis@arm.com>
 <0a537da2-4f2b-49a2-9e6b-6acc1a9aaabc@xen.org>
In-Reply-To: <0a537da2-4f2b-49a2-9e6b-6acc1a9aaabc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAVPR08MB9771:EE_|DB1PEPF000509E8:EE_|PAWPR08MB10119:EE_
X-MS-Office365-Filtering-Correlation-Id: e823141b-d6f9-4e08-e746-08dcddf77101
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?KFS3sxkLNRdmbUGs5AcrTn9VHAPF6S8gaxeNvRIMfl30aFvry0+9AQmEi941?=
 =?us-ascii?Q?Xjh1aTcBhPWIAi44iWeVqG3z3fnAkqTEHUbAZT2XxtYQ38OdNXp5k51vvEBT?=
 =?us-ascii?Q?LrytnGYeRvapHaG45AsxA1UervwTd9klF/6klgqQuKhA82mawRjp433qlnyT?=
 =?us-ascii?Q?CzEnDAsbFNVPQ58z0DiYWuvgjRB2FCR0GuSCc9Gm6b7Z2/+k7COCOUMKgaQX?=
 =?us-ascii?Q?gHsS1LuVPf5E2me52OzEcl//s/Hvqb3lPRN5ZPFkQ1QolTO8iCN2V0V0arxW?=
 =?us-ascii?Q?3cKWo4SNLHm4DvynpTIy5yN5pUE3k8YCzUvZ4va5tfZ6OiiOl9ThYAS+6epu?=
 =?us-ascii?Q?0sugvHjFG3W+vWl0USqnBecksKbPkrH1NOM9ODvLdGgS5rfcRa9deKLlG4dA?=
 =?us-ascii?Q?L8BGH6t3xlU2AofMkKakhlWsBq+421YQtxe9uRchzZazkNe5DZ8oWNZ1mLqg?=
 =?us-ascii?Q?lVQnfhPjyud7MzKlOiWmDseO70ZPG5VgkdRqD3fwItSoDtaFVSSd6pClvzWe?=
 =?us-ascii?Q?iapWyTcI4jTcxlTdk1ehremm9xjLgdO2lQU+Vf1mWnJ+E6oPgvrF2fI+EEQq?=
 =?us-ascii?Q?oFeGsvlQkwLxxr1hOBizcsHV6Cs367nFPY4mwKPQbzItp4++nFG3XM06tw4o?=
 =?us-ascii?Q?hxuNQW5XhjwPbmmTdfj5rGgNPkzoO5bLiMNWmFuCKK+OtIRtlJeOc2q35QVs?=
 =?us-ascii?Q?yiLZeXCJTxUjUha/yUIcjwSvgvcoyOACJolTfsmKfpRr+joklEOGI5Dvqa+n?=
 =?us-ascii?Q?zwSwCaCY/WwJJsfXWatQhQZ9Wa57++Ubd6GRdZxlaoxb6GsEWiUD9gQtcU4A?=
 =?us-ascii?Q?lFPL8tGGUE2bpcQokqm7NVDHsGrCp+um1pXzwFZ0QcXRkrG98g3c72NjdWxp?=
 =?us-ascii?Q?VLOMM1MtY4iXw/axXEdY8xUqMLXAmfcxTqM8y5EuaAWh1CAex1pFWxnl/LmZ?=
 =?us-ascii?Q?XJcJeCWTzdRzc2Kr4tZJc4mq30gtJgC3m7+sKtT7LI8qUF4xCc1Br16SOpB3?=
 =?us-ascii?Q?PdZF/h/GmKQyCEA4uIoPLTOhQ8Q5mBzty991638zmlYi2noSlUOs+YpZlMWV?=
 =?us-ascii?Q?SuxuVc1AGAWxWoLeViGvQZYksCfLiEjair0znDhqynySl1Ya9DxQPgWi/aSn?=
 =?us-ascii?Q?EOrjrgGzcaa8ysEZIX5MzojaJy4jIrMEMYn1UV41bEM6FtnBuWuEKdGJ1dbS?=
 =?us-ascii?Q?FFW6jLxyJweiKypaGx1LzHk0ii/ssBA9U9Sw9Ci+HkjCre1cO1K6LLA4FUJs?=
 =?us-ascii?Q?7CSo/OqGefcLa442Jb8yK2Jq1FVYsVSal6kCKx2dhN6YolqpMYwCTAdLCKy6?=
 =?us-ascii?Q?mun+C9x1pNih/rsmKOFBikaVZPey9re70NwdsNXv28jxQ/uW+TSz+eY6/CWz?=
 =?us-ascii?Q?kBywHGKURZKEHIp4BpWvcDjlXnL1xN8DhHvzHiNRj0iuvrZ2Lg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <148AEF3FCAE4074B98DF6EE5AE58A7CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9771
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ddd0827-cc19-4185-b73b-08dcddf76917
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K1B8AvgoUrO0LVuk/h86LUcP1x/90vx0EN8WcDDJj2NLOssnBJJpxi9ruZIg?=
 =?us-ascii?Q?CPLklqYKbMJ6gXSGfyk6/yldbxPtcYzz56bJZNTFwJ54w6+rvvOcSduMyQt+?=
 =?us-ascii?Q?1HebkP8xFkk8l3XuIwXZr1aJ6dHnwVurm640/k6+eyzvYbUIcbfj48fNtjvR?=
 =?us-ascii?Q?6/B7cOj5JWAbznu0yZYgQwOUQs+pKUbh6Ik3I4praGUgVue1wVJ1p74a6VmZ?=
 =?us-ascii?Q?aSWJccSnxQFXk6N/ZkzYmyOFwyNfPvFrORZ/2G6ew5lFj1RX6s6PLOSnxRaG?=
 =?us-ascii?Q?ShoMn6uwrlGEkPzKEAA4oeC9LUd/1ZuYBfAsshsrMIQCHUhYWNtYRDogItAw?=
 =?us-ascii?Q?VX/AG1GXsP8R3gG9q0KrUtryaRn/bQdGQoWq5CL4RX848R0Hoyj/6HcwOKgx?=
 =?us-ascii?Q?iElynYYG1xrUBK0/5ShOlt5jI8uFDxwHj3xs/F+jymOCsM02cl76e4Hw7i9a?=
 =?us-ascii?Q?csGmDjrbQBcoOvGNDeryVBCc5uWbbbQolAQB2owYsmPf5BofcSifdIQImlFB?=
 =?us-ascii?Q?M4pxsC6M23T8nYO4N+F8JyvxqS329yqsB3t8irmOd8NAmP3KUx1i2ymfpG8H?=
 =?us-ascii?Q?wrEkl8h+W+qhT4CMbStD24JspTWE/mLnkzxExSVkJFuU+z52A+mAYvhazrlm?=
 =?us-ascii?Q?EHGtD8lK3hyunGxNTCUSPcngK1vbhICEeGouy39rJ/7E+PDEkUProitelsEy?=
 =?us-ascii?Q?+qnavi5U9MBEd+HDL+1J2PivaFmvfVcIu/IQSFOb2cCjeNBKPXDtkYJ1gmjU?=
 =?us-ascii?Q?EBNhUZvEu//1XillTrUe/AtQc1H5m9G8E3K1YETMk2N3bEZnAIqx8I50rWeA?=
 =?us-ascii?Q?lPp1B930hnfJPKORtetXKHVtmwP8YruNRVKt97uPI8aWJelcdP4RA6dji7kQ?=
 =?us-ascii?Q?yS64yg+9PTGDcADsVL1TwY4321rfcd56DNPTcgCIAY5U5YddhHerexKxI1SN?=
 =?us-ascii?Q?NbOYZAmu0g5Ub4W25+ScqMzZAoijdSZthCxUsHnqAyrxQyFztqn1qLOiZW/B?=
 =?us-ascii?Q?sdcaFw1u2YAV2MvfHsSZ0VT9IYs/ymFa6MH/CvP4QGZmgjTK6NkzJI8kOni5?=
 =?us-ascii?Q?kf3gHRdM9Yngl4DBDSRQ8Q15XegqWnCojNMU6+NTwtbGj9d00Hlg25uw1arF?=
 =?us-ascii?Q?02lkB3dGrgfUnBqoeyATXtNKzDshkfhAW5mNp12TMfkTZMaMBesgrFWk5Nqj?=
 =?us-ascii?Q?RnZiXFsvIBd1Gk0t76RgznPswdjW2onYoxUzcZHlSfEpI6qqxvnLYEipo8wA?=
 =?us-ascii?Q?KUgnSYAUFg+0PGrvm6wkMFnsK8mX3cWSH3IyjFYztjKTsvbRXu4nUETz5toN?=
 =?us-ascii?Q?FGvWS5g90sNrIuNjybJwGXOdYXTK7/ODx0tR1nC3xut5b0jJn4mcny6OQKJK?=
 =?us-ascii?Q?Z00iVro+rXBeO1UsUh1LOBzvEhPim3vizyxe9fkTN6AFgpa8Gasfcg2B7Sa8?=
 =?us-ascii?Q?PeK35XFZJLWQPtvrpqdHR+TkWanUVs3v?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 06:50:00.2222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e823141b-d6f9-4e08-e746-08dcddf77101
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10119

Hi Julien,

> On 22 Sep 2024, at 15:03, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 19/09/2024 14:19, Bertrand Marquis wrote:
>> Create a bitmap to store which feature is supported or not by the
>> firmware and use it to filter which calls done to the firmware.
>> With this enabled. allow FF-A support to be activated for guest even if
>=20
> Typo: s/./,/ I think.

Ack

>=20
>> the firmware does not support it.
>=20
> Can you explain why you want to do this?
>=20
> The TEE mediator was designed to interpose with the HW. Without the HW it=
 doesn't entirely make sense to try to use it.
>=20
> It would also not work if the host system is using OP-TEE and expose to s=
ome VM FF-A. So it feels that the mediator may not be the right place to ha=
ndle this case.

As said in the answer to the thread on the subject, I will revert this chan=
ge for now and only introduce this once we have VM to VM support.
The goal of this change was to ensure that we could support VM to VM case e=
ven if the firmware does not support FF-A but that only make sense with VM =
to VM support in.

>=20
>> As a consequence, if the firmware is not there or not supported, we
>> return an empty list of partitions to VMs requesting it through
>> PARTINFO_GET ABI.
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>>  xen/arch/arm/tee/ffa.c          | 31 ++++++++++++++++++++-----------
>>  xen/arch/arm/tee/ffa_notif.c    |  7 +++++++
>>  xen/arch/arm/tee/ffa_partinfo.c | 31 +++++++++++++++++++++++++++++--
>>  xen/arch/arm/tee/ffa_private.h  | 28 ++++++++++++++++++++++++++++
>>  xen/arch/arm/tee/ffa_rxtx.c     | 13 ++++++-------
>>  xen/arch/arm/tee/ffa_shm.c      | 12 ++++++++++++
>>  6 files changed, 102 insertions(+), 20 deletions(-)
>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
>> index 1f602f25d097..53960b146220 100644
>> --- a/xen/arch/arm/tee/ffa.c
>> +++ b/xen/arch/arm/tee/ffa.c
>> @@ -72,7 +72,10 @@
>>  #include "ffa_private.h"
>>    /* Negotiated FF-A version to use with the SPMC, 0 if not there or su=
pported */
>> -static uint32_t __ro_after_init ffa_fw_version;
>> +uint32_t __ro_after_init ffa_fw_version;
>> +
>> +/* Features supported by the SPMC or secure world when present */
>> +DECLARE_BITMAP(ffa_fw_feat_supported, FEAT_FUNC_BITMAP_SIZE);
>>    /* List of ABI we use from the firmware */
>>  static const uint32_t ffa_fw_feat_needed[] =3D {
>> @@ -174,6 +177,13 @@ static void handle_msg_send_direct_req(struct cpu_u=
ser_regs *regs, uint32_t fid)
>>      else
>>          mask =3D GENMASK_ULL(31, 0);
>>  +    if ( !ffa_fw_supports_fid(fid) )
>> +    {
>> +        resp.a0 =3D FFA_ERROR;
>> +        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
>> +        goto out;
>> +    }
>> +
>>      src_dst =3D get_user_reg(regs, 1);
>>      if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
>>      {
>> @@ -387,8 +397,6 @@ static int ffa_domain_init(struct domain *d)
>>      struct ffa_ctx *ctx;
>>      int ret;
>>  -    if ( !ffa_fw_version )
>> -        return -ENODEV;
> >        /*>         * We can't use that last possible domain ID or ffa_g=
et_vm_id() would
>>        * cause an overflow.
>> @@ -523,6 +531,9 @@ static bool ffa_probe(void)
>>      printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
>>             FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
>>  +    INIT_LIST_HEAD(&ffa_teardown_head);
>> +    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, =
0);
>> +
>>      /*
>>       * psci_init_smccc() updates this value with what's reported by EL-=
3
>>       * or secure world.
>> @@ -568,12 +579,12 @@ static bool ffa_probe(void)
>>        for ( int i =3D 0; i < ARRAY_SIZE(ffa_fw_feat_needed); i++ )
>>      {
>> -        if ( !ffa_feature_supported(ffa_fw_feat_needed[i]) )
>> -        {
>> +        if ( ffa_feature_supported(ffa_fw_feat_needed[i]) )
>> +            set_bit(FEAT_FUNC_BITNUM(ffa_fw_feat_needed[i]),
>> +                    ffa_fw_feat_supported);
>> +        else
>>              printk(XENLOG_INFO "ARM FF-A Firmware does not support 0x%0=
8x\n",
>> -                   ffa_fw_feat_needed[i]);
>> -            goto err_no_fw;
>> -        }
>> +                       ffa_fw_feat_needed[i]);
>>      }
>>        if ( !ffa_rxtx_init() )
>> @@ -586,8 +597,6 @@ static bool ffa_probe(void)
>>          goto err_rxtx_destroy;
>>        ffa_notif_init();
>> -    INIT_LIST_HEAD(&ffa_teardown_head);
>> -    init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, =
0);
>>        return true;
>>  @@ -597,7 +606,7 @@ err_no_fw:
>>      ffa_fw_version =3D 0;
>>      printk(XENLOG_INFO "ARM FF-A No firmware support\n");
>>  -    return false;
>> +    return true;
>=20
> So effectively now ffa_probe() will always return true. If we end up to p=
robe FF-A before OP-Tee, then we would always say "FF-A"  is the TEE mediat=
or.

Ack, i will revert that for now.

>=20
>>  }
>>    static const struct tee_mediator_ops ffa_ops =3D
>> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
>> index 541e61d2f606..4b3e46318f4b 100644
>> --- a/xen/arch/arm/tee/ffa_notif.c
>> +++ b/xen/arch/arm/tee/ffa_notif.c
>> @@ -377,6 +377,13 @@ void ffa_notif_init(void)
>>      unsigned int irq;
>>      int ret;
>>  +    /* Only enable fw notification if all ABIs we need are supported *=
/
>> +    if ( !(ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_CREATE) &&
>> +           ffa_fw_supports_fid(FFA_NOTIFICATION_BITMAP_DESTROY) &&
>> +           ffa_fw_supports_fid(FFA_NOTIFICATION_GET) &&
>> +           ffa_fw_supports_fid(FFA_NOTIFICATION_INFO_GET_64)) )
>> +        return;
>> +
>>      arm_smccc_1_2_smc(&arg, &resp);
>>      if ( resp.a0 !=3D FFA_SUCCESS_32 )
>>          return;
>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_part=
info.c
>> index 93a03c6bc672..a42bd92ab8cf 100644
>> --- a/xen/arch/arm/tee/ffa_partinfo.c
>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
>> @@ -77,7 +77,15 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, ui=
nt32_t w2, uint32_t w3,
>>       */
>>      if ( w5 =3D=3D FFA_PARTITION_INFO_GET_COUNT_FLAG &&
>>           ctx->guest_vers =3D=3D FFA_VERSION_1_1 )
>> -        return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fpi_si=
ze);
>> +    {
>> +        if ( ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>> +            return ffa_partition_info_get(w1, w2, w3, w4, w5, count, fp=
i_size);
>> +        else
>> +        {
>> +            *count =3D 0;
>> +            return FFA_RET_OK;
>> +        }
>> +    }
>>      if ( w5 )
>>          return FFA_RET_INVALID_PARAMETERS;
>>  @@ -87,6 +95,18 @@ int32_t ffa_handle_partition_info_get(uint32_t w1, u=
int32_t w2, uint32_t w3,
>>      if ( !spin_trylock(&ctx->rx_lock) )
>>          return FFA_RET_BUSY;
>>  +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) )
>> +    {
>> +        if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
>> +            *fpi_size =3D sizeof(struct ffa_partition_info_1_0);
>> +        else
>> +            *fpi_size =3D sizeof(struct ffa_partition_info_1_1);
>> +
>> +        *count =3D 0;
>> +        ret =3D FFA_RET_OK;
>> +        goto out;
>> +    }
>> +
>>      if ( !ctx->page_count || !ctx->rx_is_free )
>>          goto out;
>>      spin_lock(&ffa_rx_buffer_lock);
>> @@ -250,6 +270,11 @@ bool ffa_partinfo_init(void)
>>      uint32_t count;
>>      int e;
>>  +    if ( !ffa_fw_supports_fid(FFA_PARTITION_INFO_GET) ||
>> +         !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) ||
>> +         !ffa_rx || !ffa_tx )
>> +        return false;
>> +
>>      e =3D ffa_partition_info_get(0, 0, 0, 0, 0, &count, &fpi_size);
>>      if ( e )
>>      {
>> @@ -267,7 +292,6 @@ bool ffa_partinfo_init(void)
>>    out:
>>      ffa_rx_release();
> > -
>=20
> Spurious change?

Yes

>=20
>>      return ret;
>>  }
>>  @@ -313,6 +337,9 @@ int ffa_partinfo_domain_init(struct domain *d)
>>      unsigned int n;
>>      int32_t res;
>>  +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) )
>> +        return 0;
>> +
>>      ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
>>      if ( !ctx->vm_destroy_bitmap )
>>          return -ENOMEM;
>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priva=
te.h
>> index 7c6b06f686fc..d4dc9c8cd67b 100644
>> --- a/xen/arch/arm/tee/ffa_private.h
>> +++ b/xen/arch/arm/tee/ffa_private.h
>> @@ -14,6 +14,7 @@
>>  #include <xen/spinlock.h>
>>  #include <xen/sched.h>
>>  #include <xen/time.h>
>> +#include <xen/bitmap.h>
>>    /* Error codes */
>>  #define FFA_RET_OK                      0
>> @@ -238,6 +239,23 @@
>>  #define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
>>  #define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
>>  +/**
>> + * Encoding of features supported or not by the fw in a bitmap:
>> + * - Function IDs are going from 0x60 to 0xFF
>> + * - A function can be supported in 32 and/or 64bit
>> + * The bitmap has one bit for each function in 32 and 64 bit.
>> + */
>> +#define FFA_FUNC_MIN           FFA_ERROR
>> +#define FFA_FUNC_MAX           FFA_NOTIFICATION_INFO_GET_64
>=20
> These two defines confused me because FAA_ERROR is 0x84000060U and FFA_NO=
TIFICATION_INFO_GET_64 is 0xC4000083U. I think it would be better if we def=
ine them using FFA_FUNC_ID.
>=20
> We also probably want to have a compiler time check that FFA_FUNC_MIN is =
< FFA_FUNC_MAX.

Ack.

>=20
>> +#define FFA_FUNC_ID(id)        ((id) & ARM_SMCCC_FUNC_MASK)
>> +#define FFA_FUNC_CONV(id)      (((id) >> ARM_SMCCC_CONV_SHIFT) & BIT(0,=
U))
>> +
>> +#define FEAT_FUNC_BITMAP_SIZE   (2 * (FFA_FUNC_ID(FFA_FUNC_MAX) - \
>> +                                    FFA_FUNC_ID(FFA_FUNC_MIN) + 1))
>> +#define FEAT_FUNC_BITNUM(id)    ((FFA_FUNC_ID(id) - \
>> +                                    FFA_FUNC_ID(FFA_FUNC_MIN)) << 1 | \
>> +                                    FFA_FUNC_CONV(id))
>=20
> The code seem to make two assumptions:
>  1. id is a constant
>  2. id is always valid
>=20
> I think it would be good to have a BUILD_BUG_ON(). This should avoid the =
two assumptions.

Yes you are right.

I guess i could make a BUILD_BUG_ON(id > FFA_FUNC_MAX) but the macro will d=
efinitely look ugly.
I think i will switch to static inline functions doing the thing needed to =
have something cleaner.

>=20
>> +
>>  struct ffa_ctx_notif {
>>      bool enabled;
>>  @@ -286,6 +304,8 @@ extern void *ffa_rx;
>>  extern void *ffa_tx;
>>  extern spinlock_t ffa_rx_buffer_lock;
>>  extern spinlock_t ffa_tx_buffer_lock;
>> +extern uint32_t __ro_after_init ffa_fw_version;
>> +extern DECLARE_BITMAP(ffa_fw_feat_supported, FEAT_FUNC_BITMAP_SIZE);
>>    bool ffa_shm_domain_destroy(struct domain *d);
>>  void ffa_handle_mem_share(struct cpu_user_regs *regs);
>> @@ -398,4 +418,12 @@ static inline int32_t ffa_rx_release(void)
>>      return ffa_simple_call(FFA_RX_RELEASE, 0, 0, 0, 0);
>>  }
>>  +static inline bool ffa_fw_supports_fid(uint32_t fid)
>> +{
>> +    if ( ffa_fw_version =3D=3D 0 )
>> +        return false;
>=20
> You could avoid this check if you ensure that ...
>=20
> > +    else> +        return test_bit(FEAT_FUNC_BITNUM(fid), ffa_fw_feat_=
supported);
>=20
> .. the bitmap is always zeroed if ffa_fw_version is 0. You also want to c=
heck that the fid is valid (could be done at build time if fid is always a =
constant).

Agree, the point here was to optimize a bit and prevent the bitmap check wh=
en possible but that is probably not worth it.
Will fix.

>=20
>> +}
>> +
>>  #endif /*__FFA_PRIVATE_H__*/
>> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
>> index 661764052e67..cb54c76911fd 100644
>> --- a/xen/arch/arm/tee/ffa_rxtx.c
>> +++ b/xen/arch/arm/tee/ffa_rxtx.c
>> @@ -193,24 +193,23 @@ bool ffa_rxtx_init(void)
>>  {
>>      int e;
>>  +    /* Firmware not there or not supporting */
>> +    if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
>> +        return false;
>> +
>>      ffa_rx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE_C=
OUNT), 0);
>>      if ( !ffa_rx )
>>          return false;
>>        ffa_tx =3D alloc_xenheap_pages(get_order_from_pages(FFA_RXTX_PAGE=
_COUNT), 0);
>>      if ( !ffa_tx )
>> -        goto err;
>> +        return false;
>>        e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), FFA_RXTX_PAGE_COUN=
T);
>>      if ( e )
>>      {
>>          printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", e);
>> -        goto err;
>> +        return false;
>>      }
>>      return true;
>> -
>> -err:
>> -    ffa_rxtx_destroy();
>=20
> This seems to be unrelated to the change. Can you explain why we don't ne=
ed to call ffa_rxtx_destroy()?

Yes this is definitely a mistake. I will fix that.

>=20
>> -
>> -    return false;
> >   }> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm=
.c
>> index 370d83ec5cf8..efa5b67db8e1 100644
>> --- a/xen/arch/arm/tee/ffa_shm.c
>> +++ b/xen/arch/arm/tee/ffa_shm.c
>> @@ -149,6 +149,9 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint3=
2_t frag_len,
>>  static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
>>                                 uint32_t flags)
>>  {
>> +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
>> +        return FFA_RET_NOT_SUPPORTED;
>> +
>>      return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags=
, 0);
>>  }
>>  @@ -467,6 +470,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *re=
gs)
>>      uint32_t range_count;
>>      uint32_t region_offs;
>>  +    if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
>> +    {
>> +        ret =3D FFA_RET_NOT_SUPPORTED;
>> +        goto out_set_ret;
>> +    }
>> +
>>      /*
>>       * We're only accepting memory transaction descriptors via the rx/t=
x
>>       * buffer.
>> @@ -621,6 +630,9 @@ int ffa_handle_mem_reclaim(uint64_t handle, uint32_t=
 flags)
>>      register_t handle_lo;
>>      int ret;
>>  +    if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
>> +        return FFA_RET_NOT_SUPPORTED;
>> +
>>      spin_lock(&ctx->lock);
>>      shm =3D find_shm_mem(ctx, handle);
>>      if ( shm )

Thanks again for the review.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



