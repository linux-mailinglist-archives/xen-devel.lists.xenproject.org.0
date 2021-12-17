Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FCF4786F8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 10:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248485.428610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my9PD-0001b8-TR; Fri, 17 Dec 2021 09:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248485.428610; Fri, 17 Dec 2021 09:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my9PD-0001YD-Q4; Fri, 17 Dec 2021 09:19:59 +0000
Received: by outflank-mailman (input) for mailman id 248485;
 Fri, 17 Dec 2021 09:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZwG=RC=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1my9PC-0001Xo-Ah
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 09:19:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe05::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f152144-5f1a-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 10:19:56 +0100 (CET)
Received: from DB6PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::32)
 by PAXPR08MB7383.eurprd08.prod.outlook.com (2603:10a6:102:22e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 09:19:52 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::8a) by DB6PR1001CA0022.outlook.office365.com
 (2603:10a6:4:b7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Fri, 17 Dec 2021 09:19:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 09:19:51 +0000
Received: ("Tessian outbound 157533e214a9:v110");
 Fri, 17 Dec 2021 09:19:51 +0000
Received: from 4f91257770a7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEB87DB5-4C48-49D1-ACAF-B7038D204BD4.1; 
 Fri, 17 Dec 2021 09:19:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f91257770a7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Dec 2021 09:19:44 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6648.eurprd08.prod.outlook.com (2603:10a6:20b:38e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 09:19:43 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::8851:be59:208:265e%9]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 09:19:43 +0000
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
X-Inumbo-ID: 7f152144-5f1a-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txg9Jaq3eKDnyB6browgzLyrTGasYQusrflRASZqvZo=;
 b=i47VcVoM90t065fJaiu1fRa5mWrBxaRfucd8F9xb6Ne271KMllfDw2ziNWdLTmiVqJzT/fZ0zmej2GDA8P6rHqtFOA7zCA6PdhxlYIElKb/SxvmY3xu2VoPpEg762uJ7YKTtopufztFJdWlbiL4qkWWR2VsDONuqjWAIJxHncS0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98f72cb22384e04a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUjXbCLWgOm/hfzUlijPTmGwGg/RfGkv1DBB4VnPNPU54/Q+Qkawz/op9l/tYamZDIKpPlqXeAbM2c0CQnLdNUQBtVMh/HWdDhvX/e2N959/cUPfgGrB3SdQOkGo0X0LvL2nGcoe2MpYWMTo9H2Kt9yrvDcxhi7kb3jTKIlruVUot2IqGAum8853Y8cDppVJCOnxxjzaiw7WZfBBe2zKT91QMX42WFTtEo+01U9Sz4GcSOcApqefTHQWSWp1A1CAKBKsHT2qRgD/qnLUMeU+0lIaJ9SWCQjsGkK45F+a42/SckjpfYDHwoCsbfTsE2xs4I6nJNcvwSr0tsfCcaMWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Txg9Jaq3eKDnyB6browgzLyrTGasYQusrflRASZqvZo=;
 b=LRMxvHMP385ls1oYaH9o8rUZ7zNtp1KqZALX3vPMu/cuTJv78ShjOt9y0tfCCFHFRmGgAcHX8zU3IWZkFt7/smqtJxGQ+gZnT72zzCx40w9Yccn/0XaQZSQCxwNNsCBxx7qUv5UUYtMH8AyOzlUT3xj+TgOEyy9+w1Veuc2VOVrcIBK/l7UD3ldMOe9zE5jfLm1UWT5hfU1UezE+CVhwGOPgF5isCzOTb5gO1IWenjlG7LLFAgXmhfuJo9FqGnpPLlt+oAagf2wjJjjliV9rssCIRKGClw8bRgCXWirRVMlJhFIobnnw7OCk1U4FqRbSuKEI8RQp50VFiBF344SnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Txg9Jaq3eKDnyB6browgzLyrTGasYQusrflRASZqvZo=;
 b=i47VcVoM90t065fJaiu1fRa5mWrBxaRfucd8F9xb6Ne271KMllfDw2ziNWdLTmiVqJzT/fZ0zmej2GDA8P6rHqtFOA7zCA6PdhxlYIElKb/SxvmY3xu2VoPpEg762uJ7YKTtopufztFJdWlbiL4qkWWR2VsDONuqjWAIJxHncS0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
Thread-Topic: [PATCH] xen/arm: vpci: Remove PCI I/O ranges property value
Thread-Index: AQHX8NfE0k+LAAwoDUiQfCEULp9EE6w0aQgAgAB74ACAAMbRAIAAwQkA
Date: Fri, 17 Dec 2021 09:19:43 +0000
Message-ID: <73F40E1F-0569-4F09-A105-6F67A5584D67@arm.com>
References:
 <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2112151817190.3376@ubuntu-linux-20-04-desktop>
 <AA684EED-5631-4036-ABF1-596AD61787CC@arm.com>
 <alpine.DEB.2.22.394.2112161347320.3376@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2112161347320.3376@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cd374c12-9eb9-4574-143c-08d9c13e616c
x-ms-traffictypediagnostic:
	AS8PR08MB6648:EE_|DB5EUR03FT031:EE_|PAXPR08MB7383:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7383F770BDB90C90558E6D72FC789@PAXPR08MB7383.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4pLDsmmup+ge5Li5rjI3SXVppfzeUjE/7H0RZ2aVIDyifCoJeq/IivPl/Qfk+MXMq8U6jk9p/Tihv4LPreXPcqaMAnT2/TULUfMjMo/eRyxTvKJYlAWJIpcmtCSWyPqXJ3tq6qa1Je0doa9MA4DaVoFJO0RTTKo8D86h5xb1ZhrJaNJsLvYWL+ukXSNrfZLX0LINJctQogVM5mBM42GjhrG5rtXMYJwMzMiv2olHWck/0F9XAhMsDDK7R1qoIe+UT8HzEH+5+NMCTe/9ZCyyis3tVGjtTzTK9w+ecWXj3VztYmQFoCCpIMq6tsnw1i6ycWYAEyxA/n8fpNHNL0SBtXRodnbLZJ2POjIxYb9ekP94IXbYMZZ9UH04qV5h7V4Fq+zNYa3EqT/qSm3BJB9Eymk9+iwLLaIzhhpRIB0kfOPOvTcT+M4XCHC25wZIfCPgudcuUJcn0WmxpiDE7hLSEGSMNGvdSZRAhESrNNkSSn/39m41vXpsHXWxNcDjQY8uEk1LvM++WEXzv1AR5b4gK6CaE6yb76orqQrgRPqcUZLXyY5EehdNClKvQZCtFA546TD94Qg5sQXaHmQb5f6M6c+SGwygKvzBZZMnzX8W6MD0JRF3LbfZTaqOqStygGmeA7QTjTDENJyk1jbnZE+VqThRPucQlULxNHc/LylhBFaBMALj5/HoMLW95yGdrEkH7fOO4RmwlJvEliSmglBZz7Y9g4dXmZ0/IkoxbgFyws77bbYRDbb3X8so1zO57rgZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(76116006)(91956017)(6512007)(64756008)(83380400001)(71200400001)(122000001)(53546011)(6506007)(2906002)(38100700002)(6486002)(26005)(66446008)(316002)(36756003)(508600001)(2616005)(6916009)(33656002)(66476007)(8936002)(86362001)(5660300002)(66946007)(66556008)(186003)(4326008)(54906003)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0D193A5B1583F4CADD76C5005B4610E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6648
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94b6eb4b-4626-4be7-20e1-08d9c13e5c78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	14VHZNTKEtyme4noDXS6W6ZXL5+k9+eIZSkYlikRom+8hhlhk6NRUwXzkY1K8FRajRaNlclcU7AvWRjLWLjg796OK5ofdC5206W5xtIIjxz1UNQxWCIBBXpw7k3mULtPqsBtcD+3LNf/rBbGBRatn4JLor1eTkAR0pGirzf+q6a4wej6WrCnaxoIFIMmh9aA/LPixqTu2jrXU8MdDkYyJtQ8xf20rRO9k6bNXITG2jfDHL4bdZwXYrgURabAOPQL8Ru9EvAzdPnkZjoQY2BWGkquXfWt21gnCMwnFxWhjS34vmmB6zpHhBV4q3ZEHfc4sa7ln1ggnflSW6CP3I9Pp85slb7DKFdKR6MSRQpr3eX6G7xvgqUVokGvzFHF5AbW+xqSdkHPoyYpSakI2LiGhxXs1bM+zs0dN6eL6SQSo6raT5ucvZtlnGaKzHQ7d/PpZ5XAfnJ7I6p7xAvlDJOUgCNJFLBInv+5cenln+WJrlwQU/Z5ZiwIK1st8DKJSgEE5jkIbHxGNeLv5+RyAaHAZYmKoQNAtzvk/zoWZUufyWWaptsl/J/Toaxe8VbcNZVQ1UXSlvUUPIr7dYohDeb2gkJwj7hXS1VMiFdK/mXoVXQbtCjmyaeWOXJNZmtgidMowZQnl/tb+qpsJl8cHOONmFASGvPO+MO5wsq0+JtDKC+id2QQpT2hKQlPYaUrYjRgKuM64CplvH0LZnmwGEfqCYKZRHNZ0Se4CFbMoV6dKipG/IH26h3BYUSFaBsHzaSefWOT6Yv/SO1HjeIMG8/1vA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(316002)(47076005)(2616005)(107886003)(36756003)(83380400001)(26005)(53546011)(54906003)(508600001)(6506007)(186003)(336012)(8676002)(6486002)(36860700001)(8936002)(86362001)(33656002)(356005)(5660300002)(4326008)(6512007)(70206006)(2906002)(6862004)(70586007)(82310400004)(40460700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 09:19:51.6241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd374c12-9eb9-4574-143c-08d9c13e616c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7383

SGkgU3RlZmFubywNCg0KPiBPbiAxNiBEZWMgMjAyMSwgYXQgOTo0OCBwbSwgU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTYg
RGVjIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGkgU3RlZmFubywNCj4+IA0KPj4+IE9u
IDE2IERlYyAyMDIxLCBhdCAyOjMzIGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIFR1ZSwgMTQgRGVjIDIwMjEsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4+PiBJTyBwb3J0cyBvbiBBUk0gZG9uJ3QgZXhpc3Qgc28gYWxsIElP
IHBvcnRzIHJlbGF0ZWQgaHlwZXJjYWxscyBhcmUgZ29pbmcNCj4+Pj4gdG8gZmFpbCBvbiBBUk0g
d2hlbiB3ZSBwYXNzdGhyb3VnaCBhIFBDSSBkZXZpY2UuDQo+Pj4+IEZhaWx1cmUgb2YgeGNfZG9t
YWluX2lvcG9ydF9wZXJtaXNzaW9uKC4uKSB3b3VsZCB0dXJuIGludG8gYSBjcml0aWNhbA0KPj4+
PiBmYWlsdXJlIGF0IGRvbWFpbiBjcmVhdGlvbi4gV2UgbmVlZCB0byBhdm9pZCB0aGlzIG91dGNv
bWUsIGluc3RlYWQgd2UNCj4+Pj4gd2FudCB0byBjb250aW51ZSB3aXRoIGRvbWFpbiBjcmVhdGlv
biBhcyBub3JtYWwgZXZlbiBpZg0KPj4+PiB4Y19kb21haW5faW9wb3J0X3Blcm1pc3Npb24oLi4p
IGZhaWxzLiBYRU5fRE9NQ1RMX2lvcG9ydF9wZXJtaXNzaW9uDQo+Pj4+IGlzIG5vdCBpbXBsZW1l
bnRlZCBvbiBBUk0gc28gaXQgd291bGQgcmV0dXJuIC1FTk9TWVMuDQo+Pj4+IA0KPj4+PiBUbyBz
b2x2ZSBhYm92ZSBpc3N1ZSByZW1vdmUgUENJIEkvTyByYW5nZXMgcHJvcGVydHkgdmFsdWUgZnJv
bSBkb20wDQo+Pj4+IGRldmljZSB0cmVlIG5vZGUgc28gdGhhdCBkb20wIGxpbnV4IHdpbGwgbm90
IGFsbG9jYXRlIEkvTyBzcGFjZSBmb3IgUENJDQo+Pj4+IGRldmljZXMgaWYgcGNpLXBhc3N0aHJv
dWdoIGlzIGVuYWJsZWQuDQo+Pj4+IA0KPj4+PiBBbm90aGVyIHZhbGlkIHJlYXNvbiB0byByZW1v
dmUgSS9PIHJhbmdlcyBpcyB0aGF0IFBDSSBJL08gc3BhY2UgYXJlIG5vdA0KPj4+PiBtYXBwZWQg
dG8gZG9tMCB3aGVuIFBDSSBwYXNzdGhyb3VnaCBpcyBlbmFibGVkLCBhbHNvIHRoZXJlIGlzIG5v
IHZwY2kNCj4+Pj4gdHJhcCBoYW5kbGVyIHJlZ2lzdGVyIGZvciBJTyBiYXIuDQo+Pj4+IA0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IHhlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgIHwgMTQgKysrKysrKw0KPj4+
PiB4ZW4vY29tbW9uL2RldmljZV90cmVlLmMgICAgICB8IDcyICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrDQo+Pj4+IHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgMTAg
KysrKysNCj4+Pj4gMyBmaWxlcyBjaGFuZ2VkLCA5NiBpbnNlcnRpb25zKCspDQo+Pj4+IA0KPj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJt
L2RvbWFpbl9idWlsZC5jDQo+Pj4+IGluZGV4IGQwMmJhY2JjZDEuLjYwZjZiMmM3M2IgMTAwNjQ0
DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+PiArKysgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4gQEAgLTc0OSw2ICs3NDksMTEgQEAgc3RhdGlj
IGludCBfX2luaXQgd3JpdGVfcHJvcGVydGllcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2Vy
bmVsX2luZm8gKmtpbmZvLA0KPj4+PiAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4gICAg
ICAgIH0NCj4+Pj4gDQo+Pj4+ICsgICAgICAgIGlmICggaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJs
ZWQoKSAmJg0KPj4+PiArICAgICAgICAgICAgICAgIGR0X2RldmljZV90eXBlX2lzX2VxdWFsKG5v
ZGUsICJwY2kiKSApDQo+Pj4+ICsgICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X25hbWVfaXNf
ZXF1YWwocHJvcCwgInJhbmdlcyIpICkNCj4+Pj4gKyAgICAgICAgICAgICAgICBjb250aW51ZTsN
Cj4+PiANCj4+PiBJdCBsb29rcyBsaWtlIHdlIGFyZSBza2lwcGluZyB0aGUgInJhbmdlcyIgcHJv
cGVydHkgZW50aXJlbHkgZm9yIHRoZSBQQ0kNCj4+PiBub2RlLCBpcyB0aGF0IHJpZ2h0PyBXb3Vs
ZG4ndCB0aGF0IGFsc28gcmVtb3ZlIHRoZSBvdGhlciAobm90IGlvcG9ydHMpDQo+Pj4gYWRkcmVz
cyByYW5nZXM/DQo+PiANCj4+IFdlIGFyZSBza2lwcGluZyB0aGUg4oCccmFuZ2Vz4oCdIHByb3Bl
cnR5IGhlcmUgdG8gYXZvaWQgc2V0dGluZyB0aGUg4oCccmFuZ2Vz4oCdIHByb3BlcnR5IHdoZW4N
Cj4+IHBjaV9wYXNzdGhyb3VnaCBpcyBlbmFibGVkLiBXZSB3aWxsIHJlbW92ZSBvbmx5IHJlbW92
ZSBJTyBwb3J0IGFuZCBzZXQgdGhlIG90aGVyIOKAmHJhbmdlc+KAnSBwcm9wZXJ0eSANCj4+IHZh
bHVlIGluIGR0X3BjaV9yZW1vdmVfaW9fcmFuZ2VzKCkgaW4gbmV4dCBpZigpIGNvbmRpdGlvbi4N
Cj4+IA0KPj4gDQo+Pj4+ICAgICAgICByZXMgPSBmZHRfcHJvcGVydHkoa2luZm8tPmZkdCwgcHJv
cC0+bmFtZSwgcHJvcF9kYXRhLCBwcm9wX2xlbik7DQo+Pj4+IA0KPj4+PiAgICAgICAgaWYgKCBy
ZXMgKQ0KPj4+PiBAQCAtNzY5LDYgKzc3NCwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9w
cm9wZXJ0aWVzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+
Pj4+ICAgICAgICAgICAgaWYgKCByZXMgKQ0KPj4+PiAgICAgICAgICAgICAgICByZXR1cm4gcmVz
Ow0KPj4+PiAgICAgICAgfQ0KPj4+PiArDQo+Pj4+ICsgICAgICAgIC8qDQo+Pj4+ICsgICAgICAg
ICAqIFBDSSBJTyBiYXIgYXJlIG5vdCBtYXBwZWQgdG8gZG9tMCB3aGVuIFBDSSBwYXNzdGhyb3Vn
aCBpcyBlbmFibGVkLA0KPj4+PiArICAgICAgICAgKiBhbHNvIHRoZXJlIGlzIG5vIHRyYXAgaGFu
ZGxlciByZWdpc3RlcmVkIGZvciBJTyBiYXIgdGhlcmVmb3IgcmVtb3ZlDQo+Pj4+ICsgICAgICAg
ICAqIHRoZSBJTyByYW5nZSBwcm9wZXJ0eSBmcm9tIHRoZSBkZXZpY2UgdHJlZSBub2RlIGZvciBk
b20wLg0KPj4+PiArICAgICAgICAgKi8NCj4+Pj4gKyAgICAgICAgcmVzID0gZHRfcGNpX3JlbW92
ZV9pb19yYW5nZXMoa2luZm8tPmZkdCwgbm9kZSk7DQo+Pj4+ICsgICAgICAgIGlmICggcmVzICkN
Cj4+Pj4gKyAgICAgICAgICAgIHJldHVybiByZXM7DQo+Pj4gDQo+Pj4gSSB0cmllZCB0byBhcHBs
eSB0aGlzIHBhdGNoIHRvIHN0YWdpbmcgdG8gbWFrZSBpdCBlYXNpZXIgdG8gcmV2aWV3IGJ1dCBJ
DQo+Pj4gdGhpbmsgdGhpcyBjaHVjayBnb3QgYXBwbGllZCB3cm9uZ2x5OiBJIGNhbiBzZWUNCj4+
PiBkdF9wY2lfcmVtb3ZlX2lvX3JhbmdlcygpIGFkZGVkIHRvIHRoZSBmdW5jdGlvbiAiaGFuZGxl
X3Byb3BfcGZkdCIgd2hpY2gNCj4+PiBpcyBmb3IgZ3Vlc3QgcGFydGlhbCBEVEJzIGFuZCBub3Qg
Zm9yIGRvbTAuDQo+PiANCj4+IE9sZWtzYW5kcuKAmXMgcGF0Y2ggc2VyaWVzIHdhcyBtZXJnZWQg
eWVzdGVyZGF5IGJlY2F1c2Ugb2YgdGhhdCB0aGVyZSBpcyBjb25mbGljdCBpbiBhcHBseWluZyAN
Cj4+IHRoaXMgcGF0Y2guIEkgd2lsbCByZWJhc2UgdGhlIHBhdGNoIGFuZCB3aWxsIHNlbmQgaXQg
YWdhaW4gZm9yIHJldmlldy4NCj4+IA0KPj4+IA0KPj4+IElzIGR0X3BjaV9yZW1vdmVfaW9fcmFu
Z2VzKCkgbWVhbnQgdG8gYmUgY2FsbGVkIGZyb20gd3JpdGVfcHJvcGVydGllcw0KPj4+IGluc3Rl
YWQ/IEl0IGxvb2tzIGxpa2UgaXQgd291bGQgYmUgYmVzdCB0byBjYWxsIGl0IGZyb20NCj4+PiB3
cml0ZV9wcm9wZXJ0aWVzLCBtYXliZSBpdCBjb3VsZCBiZSBjb21iaW5lZCB3aXRoIHRoZSBvdGhl
ciBuZXcgY2hlY2sNCj4+PiBqdXN0IGFib3ZlIGluIHRoaXMgcGF0Y2g/DQo+PiANCj4+IFllcyBk
dF9wY2lfcmVtb3ZlX2lvX3JhbmdlcygpIGlzIHRvIGJlIGNhbGxlZCBmcm9tIHdyaXRlX3Byb3Bl
cnRpZXMoKS4NCj4gDQo+IE9LLiBJbiB0aGF0IGNhc2UgdGhlIG9ubHkgZmVlZGJhY2sgdGhhdCBp
cyBJIGhhdmUgaXMgdGhhdCBpdCBtaWdodCBiZQ0KPiBwb3NzaWJsZSB0byBhdm9pZCB0aGUgZmly
c3QgY2hhbmdlIG9mIHRoaXMgcGF0Y2ggdG8gc2tpcCAicmFuZ2VzIiBieQ0KPiBtb3ZpbmcgdGhl
IGNhbGwgdG8gZHRfcGNpX3JlbW92ZV9pb19yYW5nZXMoKSBlYXJsaWVyIGluIHRoZQ0KPiB3cml0
ZV9wcm9wZXJ0aWVzIGZ1bmN0aW9uLg0KDQpPay4gSSB3aWxsIG1vZGlmeSB0aGUgY29kZSBiYXNl
ZCBvbiB5b3VyIGNvbW1lbnQuDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo=

