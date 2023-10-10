Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57F7BF03D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614562.955738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1WL-0004My-5A; Tue, 10 Oct 2023 01:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614562.955738; Tue, 10 Oct 2023 01:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1WL-0004KW-2G; Tue, 10 Oct 2023 01:26:49 +0000
Received: by outflank-mailman (input) for mailman id 614562;
 Tue, 10 Oct 2023 01:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sc7t=FY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qq1WJ-0004KM-FS
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:26:47 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 130ab060-670c-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 03:26:45 +0200 (CEST)
Received: from AS9PR05CA0350.eurprd05.prod.outlook.com (2603:10a6:20b:490::11)
 by DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 01:26:38 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:490:cafe::c9) by AS9PR05CA0350.outlook.office365.com
 (2603:10a6:20b:490::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Tue, 10 Oct 2023 01:26:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.20 via Frontend Transport; Tue, 10 Oct 2023 01:26:37 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Tue, 10 Oct 2023 01:26:37 +0000
Received: from d788eba0ee68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41A5AAAA-BA36-41E0-A84B-C00C96A8C31A.1; 
 Tue, 10 Oct 2023 01:26:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d788eba0ee68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Oct 2023 01:26:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7472.eurprd08.prod.outlook.com (2603:10a6:10:36c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.41; Tue, 10 Oct
 2023 01:26:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 01:26:28 +0000
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
X-Inumbo-ID: 130ab060-670c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSPlqCBqTaW8fVEkJno/VrU3cvXmTxKgBpYutAIh33g=;
 b=NHaEp/sgVtTUzFEJw9U7HexFGKkZjq0e2BPG2v4sFkgpZaH9BFS1voS7MrVqDb9PSn1VcUOYnRW8TDF718Y1QB9tm3pi16HP5ZqcFGgEFzOx7Hqa9MtRQuGokttuN7z9qWDj7MP4oyV0svuFcsy++qye+G3tb7FmdBhvfpy7L78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 843a4a58c41db37f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gN7wFe3F177wQ2PAk39jqgEe12Pmor2Ecrd7EZ10UaI9K3zwAV/1nrL89+5t9BqxxYrZtIqDzfg0XcrcImdp4a77rLXOqkw6IKA2AV3V6vkofrLAJ3DNqWcG5P6VHbaI2G51njQwlnPhiqP7E52lr0CP1BXIBIFnpWI+XNzRCQdwxKdJ9AKW8TaMDAF2+TSerEO0AtIkTkaM21jwh6CZMytvAey8ov8vEJfMSFtUjIJtwNGj8ngHdlimTbg11AHz5Rm9t6ZrVDQc0QI+Ao88TA+E2RNyC4S7Rm518ktmYUQ0tcuRCL2uMiwAfZuunrPb3rbePVInqKSYZSFSg69Evg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSPlqCBqTaW8fVEkJno/VrU3cvXmTxKgBpYutAIh33g=;
 b=RWovEtme64ixAPXYvgYRglshPo7PusFea89NY/TjAXNmxocWyA4w/m1wua6ALFIZL36Hiui4A+TnmCT8m0AlOAMH+lQTTOufbkVQ/yrMj8MOf9pzAB4o7kCaGF5HmrnhK5iX5km7rgmVHrmdzZENnbvE5tlAslM5KkCFEUQgv4FTgSfYL5k4Gcijers7H/pfAXBvfLRmFzsbanQvM2H7DlDrYVq30ae3lmxPv1ga5H2ZjsCNZ47galB4CYJxQYzcrUA8rSlIa4wtGi5n2eI+RUFjm5Ii4f194xZq2HS5luzrFMZyWqD1iDbWtEoi8620FVGZpIDByteJebuhza+AQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSPlqCBqTaW8fVEkJno/VrU3cvXmTxKgBpYutAIh33g=;
 b=NHaEp/sgVtTUzFEJw9U7HexFGKkZjq0e2BPG2v4sFkgpZaH9BFS1voS7MrVqDb9PSn1VcUOYnRW8TDF718Y1QB9tm3pi16HP5ZqcFGgEFzOx7Hqa9MtRQuGokttuN7z9qWDj7MP4oyV0svuFcsy++qye+G3tb7FmdBhvfpy7L78=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, George Dunlap <george.dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>
Subject: Re: [XEN PATCH v2] xen/sched: address violations of MISRA C:2012 Rule
 8.2
Thread-Topic: [XEN PATCH v2] xen/sched: address violations of MISRA C:2012
 Rule 8.2
Thread-Index: AQHZ+rwuWdNAgpKVZEuK1EbrmSJrKLBCO7mAgAAAVwA=
Date: Tue, 10 Oct 2023 01:26:28 +0000
Message-ID: <70AD5949-7F80-4671-9998-6239588EA61E@arm.com>
References:
 <033b6f5f10e17409650dc438b22a0f0e0d5918a7.1696598833.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310091824560.3431292@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310091824560.3431292@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB7472:EE_|AM7EUR03FT038:EE_|DB8PR08MB5484:EE_
X-MS-Office365-Filtering-Correlation-Id: a223446d-7cab-4d19-d226-08dbc92ff2d2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dyhCYwTDEMnc2w/6cLf6hJdU58+vIb9Zr9mD9PFbr6ybaV86i8W6aUiblOwqGYh3HUkgRetwGTYzhtBYGNN4TvLmGuZ6yYYoIpVNbkJBHNiVVOawcG7LAEPCOMwjtp/R5n6CwvsfjiQKSqQLvvSgpsxASjqYEG2m5W3ZzqnJ5mHeSdoC12OVcF5ITLXE+tMJ3PMrruNIzFt5TUtrjezaW5lCkHpiJF43AJ1WzA/1q24IELKxKKZ1dqQT1PIh7JZseN4dCSNSAndbxBRDywhgvqGL05kab5oK9D820/SnkcUZrlmIWNEdN0yiyYf+6R0CYoUpvXSqjvyhVzq7Go+WoIV26M32ibxZEdMNpiZve2D6TENyoEONvjYW9LZecxdOv9ETRxU0XwrL+ZBENq4F9gsTqbbiHhnZNr2vduumpt4Nu/uoFCU5/BJ0y1NjMrDZqKEQ5r1PmEkmdxcMXE7PiLaDwe4XDqjpxQzVtmwJnqEFDORaRaeYNm1FxkcZaPe0LJR+ZKK96hfbJDzKFNArPdA/ht2KGd5ZjdAGk39iTC2rcepKXW+QSWgZRxFTl4fdwDCOVQBLbi2jtOGe6Y37XgHI0gnPTRX57NbRCcrXvb5olXNKfh43sgLpaAFHBOeB5R/AwhUbeXf02NP35AHhnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(71200400001)(53546011)(6506007)(478600001)(6486002)(41300700001)(6512007)(26005)(33656002)(86362001)(38070700005)(558084003)(38100700002)(2906002)(122000001)(316002)(2616005)(36756003)(66476007)(5660300002)(54906003)(76116006)(66446008)(66556008)(64756008)(4326008)(6916009)(66946007)(91956017)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <22089195D4C404489BDDF0BB0FB54769@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7472
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81f11791-0455-4a7f-4ccd-08dbc92fed42
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RKC8YXo7vPO4YpakaIMyND9sddd0dYPZWxItgY2XkSCH98MQRmWBsC7x3KWv5vP2sfesKeIK47zlQowMjJaMFkRz+t4/ZI/c5TiAULozm6GfiMRNyALOQjmZ4ZieoU3+jZWgaJfYRSnWNw+ANx4KFpL8Jix3vmT6SezudJqq9dFy7NIWyHMbUaPo4jSFYEepjxsNIY0YUKN/ppwXQL+0zOH9sy3vrgZoyw4MCvv/YccsYwpcu+C+ICLtuhIopiK56NZVaSQTJAcwipvP+2osyDNPIKcwNxDIS/Qg+xc4bLGRRCNb6mqomex8iYepjRoeJ562C4/QQh4+IHtnKRriASK/pMW0P3ZA31IROb9kvNElATP8why9SycbJnrbSL8DkSwcFwOzQWMi/7qK7a2hU0uCEDsnhPMMEPHrQSFBZ9H4kJc6BbdDzXlXIRerCT/WqI41yXkzAAedRu7EOK6QpGu6B4aU7abGkctARhC9Pu15fasDjYZxl9bPrf3j2777468COHFdQO3D/LuJw8KjcFMy3NuO1GkdVVHKpSoF4GR9TTrBURBgmrxHoNtLe8dTtAHaoBOwu6/PyHKYpgqK/2ghSkWVnR8312rn9mWZ41yis075q7CJp7A391+9kRvaMWPigbvxHFV5VXdFkqfKhcQYcfysK1jVtoHOahrv8VEZFdKdze+mKZjFOIp2XWG+kMAUTbV2nJfOi995z+Eu6ckJ/EtleRCBp2FJkqHOurJTDCTHnd78lrcLy/01erSA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(26005)(2616005)(336012)(53546011)(36860700001)(8676002)(47076005)(6512007)(6862004)(4744005)(107886003)(2906002)(478600001)(6506007)(4326008)(54906003)(70206006)(70586007)(6486002)(8936002)(5660300002)(316002)(41300700001)(40460700003)(81166007)(356005)(86362001)(36756003)(40480700001)(82740400003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 01:26:37.7136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a223446d-7cab-4d19-d226-08dbc92ff2d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484

Hi,

> On Oct 10, 2023, at 09:25, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> On Mon, 9 Oct 2023, Federico Serafini wrote:
>> Add missing parameter names. No functional change.
>>=20
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20


