Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC36F42893F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:56:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205516.360834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr6n-0001EX-0v; Mon, 11 Oct 2021 08:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205516.360834; Mon, 11 Oct 2021 08:56:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr6m-0001CY-Tr; Mon, 11 Oct 2021 08:56:32 +0000
Received: by outflank-mailman (input) for mailman id 205516;
 Mon, 11 Oct 2021 08:56:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZr6m-0001CS-5Y
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:56:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20073809-2a71-11ec-80d2-12813bfff9fa;
 Mon, 11 Oct 2021 08:56:31 +0000 (UTC)
Received: from AM5PR04CA0036.eurprd04.prod.outlook.com (2603:10a6:206:1::49)
 by DB8PR08MB5371.eurprd08.prod.outlook.com (2603:10a6:10:114::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 08:56:27 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::67) by AM5PR04CA0036.outlook.office365.com
 (2603:10a6:206:1::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 08:56:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 08:56:27 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Mon, 11 Oct 2021 08:56:27 +0000
Received: from 74725e10d297.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8136C1F1-7295-4A24-826B-853AA1D88374.1; 
 Mon, 11 Oct 2021 08:56:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 74725e10d297.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 08:56:16 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6779.eurprd08.prod.outlook.com (2603:10a6:10:2a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 08:56:13 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:56:13 +0000
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
X-Inumbo-ID: 20073809-2a71-11ec-80d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28ZnLR4xsQYS1yU5qFJD7IznQZsEhijGabxw2q5ZwMM=;
 b=fOO7c6bpZs0YdKGKwZJfB+iyBDBQP0J9EIpUXQi+BPCaBeAd1nhkui2YuCEjRXQBW4Jyn3jucgPriU+8497ZBDrk0FvnkHy+/8N7pegfEn6Ye3SvdkxxoNDbYNk18HlpJcmLK8hHpYQRlhnOElsgkvA+By0etA+Gavw9cioCJCY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 262b2fa8db554f09
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmL3mD3jkuAEUXAf0tbmYVUFrrhKwlPBbWABBDk0xiqP34Te7Sj93qpkto3t/6hPk/4uizt6ULiyX4LqYW4zUtslu+fl6tEtyhjEMgunbkMLrKLctO6oDU6KlZynSrZ+Cz/j+btSzGY4HnfLEaOYsc4opJGXMKblkZCIBrxRnn4nQ9V/iqls3OJk2sBUlC5cfQQ8/rBW/jFONmbuMPIJUyiFXueOHZu0McWugFZ9O5NMrCvGZwg+E87nsk7d4kwVfUC2ajDutQHMk414EC8phKw2GoqxQ1nNdjqnonKuQKc5QTu2fJfczAxrCgqqXaWCYYSZ3NZ7pVdsdNURFupYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28ZnLR4xsQYS1yU5qFJD7IznQZsEhijGabxw2q5ZwMM=;
 b=NUcsROvyvF2rw6fPYMWpZriIukikXsBbbqE4qm5luLiCvTvZ36jj6t2PwPEYB13zZhFoiVTZU3xISbcc9r3f/zPVlOmVerhVbrVTlfrvaSyIgonG+hQ9L4lYQtqwGVrlrke9RuaXep/pGRu7Y5ZCmZWNASyCQmF2MYN9MShMXTVWTnN5V4D481EHBGL8lr6giidW8ks0de6cKYvjKDu5SCZfUtXlNk1puMM43ENurd6zkYhrMI6N2PcahT5GRqu5EOGGjbz4MuZjvcLadkqhlP7yQ915Q8E0G1mxVY4jdVDiAx1VDtIiIFxMJjPHAom2pz2rPbgoxrsBvvt7HRS3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28ZnLR4xsQYS1yU5qFJD7IznQZsEhijGabxw2q5ZwMM=;
 b=fOO7c6bpZs0YdKGKwZJfB+iyBDBQP0J9EIpUXQi+BPCaBeAd1nhkui2YuCEjRXQBW4Jyn3jucgPriU+8497ZBDrk0FvnkHy+/8N7pegfEn6Ye3SvdkxxoNDbYNk18HlpJcmLK8hHpYQRlhnOElsgkvA+By0etA+Gavw9cioCJCY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
Thread-Topic: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using
 EFI boot
Thread-Index: AQHXvnZ+rYVQ3wonZUSICyS3GbtBZKvNcjoAgAAK8ICAAAB0AIAAASSA
Date: Mon, 11 Oct 2021 08:56:13 +0000
Message-ID: <C1176381-C6D5-46BD-A13D-7F3E7528B655@arm.com>
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
 <d7acbd79-fca0-f388-5304-9f85dba304fc@suse.com>
 <9D5D9F7A-F399-4C8C-80A6-C3B8452729D0@arm.com>
 <b235bb9b-d9c5-5e70-fbe7-9683e5979075@suse.com>
In-Reply-To: <b235bb9b-d9c5-5e70-fbe7-9683e5979075@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8a52c180-264a-4ace-9f77-08d98c9502f1
x-ms-traffictypediagnostic: DB9PR08MB6779:|DB8PR08MB5371:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5371F2A6BB5CB28E5917FCF29DB59@DB8PR08MB5371.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:378;OLM:378;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vQiA4gneYhf86L/6p7v7SLF3k+JJ1OfAG69PlNm2R2RH/uKcpgAA4+m7S57cfbGpj2VKIYVedKujZ79d9mukxNJECTLrp4dA2QqZVceGuY8DPF/LdILLAM0S0HP8DHzY/2l2lWm9ipx7CsjdO2kKsYKQMuF9hLgMPM+ok6pgshBOD/SUStpkU8/GwKa4pF1eYlN2GRJmuwdug24B/iBu5niizl0mcOx691p/KNMVSXoNAjbT8spG6eQTGN9Hrz1AL74owPTZT4M5AeG5sKXmrQXNWuP9+QagQLGdMMU7XwpMFnVEy9sjONw4vbAVbmspagPn8U3DtyxTcTeLIPzfYwUBIp9MH4kM8Vj3ZV8Vc7gto/9N5GbAJhmRqJqv9eJ7kLiF+R7Ib7dlpNXXFKB5wB9s+msdFb1ws1pR3HpYT95vsOT+nClnwKS7r4AUMHK3if36NPiDOoUUh0CVuP+EtIHlclxHmW9cbA9Fz3A6AyPSvVP+0zka3wa+tLKryssmPgqKuqG0EgFRnD070u2XnTVCttDUU1oNOtetg0Er7gpebGpAQKCW9ofN7jtRMf1lak5U5q2fvi1NVa4GlNRkHw1NtLHl2Zq1R2fBSr/PyCuGrcKjx46whdt7gip+/qU7bArWHtblioDnBveZUJT15MVZbEhFvX4NeIAJbN5Ld13cu1SUzd1YBkin9yjudsOBVifiXHeZAIrIgwDY8x2esHmiZpVINe2QsO39KniuKq8kE1shYEdqGYIrtyWjhd21aNXr33a8CxjuqNTeMr/Uew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(66476007)(316002)(66556008)(6512007)(66446008)(33656002)(6916009)(64756008)(4326008)(508600001)(2616005)(71200400001)(54906003)(5660300002)(36756003)(91956017)(6506007)(38100700002)(38070700005)(26005)(186003)(66946007)(76116006)(8936002)(53546011)(6486002)(8676002)(122000001)(83380400001)(86362001)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F9FECB07F977824DBD5D5709CB12C9E0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6779
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f2baf93-73a2-4c89-b947-08d98c94fab1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H5WJXgDAGhcKb0tS1mv6J5/WNd//o6cL1Q8O77h1hIwFp/kMJBKxL2qUig7tTh7hQ7ARSdiWQEq1zKaV7jKFvnout6slHJtZp1LJpehyjGQWBEMB/z9TymDATBlvghicgpr7pode6dJO7awOvlzD1vAJXXjRL2O4J0mgngrWa2KiUafooWSnW9x4sqEkpYQeC/KqkwX4gQJPQ2Dnn/3JMD66Ct6BUqPBjeDP+8hWcVMFjRsug7bFMXH2oFKDSN2TBVAEPojGC4lnhTNKD46RHvXr2TPsxhoYwElDcR7+LOD8UkF7OVK+yEKgcwsaKq5MydLf8SBl9KIMFB0+jn6WBXpgQF4/tA5q8sv3l8tHEWDmEUHtsfbEhaTRWS6yVBfQdbPiOHCCjILHkdrhvIuvZyOmaNFMMPo+IbSJZvNtcBHYluaHIX3XtUKPsZm5vmJs8CjzjQmWV6fGD5r1ZnhoCEMaiVCtvptaDtAYdOYzsgDtQqwYdKYI/F08CxONn+WTOX7T45k208p3L3qVou9eSriNsVnDerSGWxW6Eyd3FXfZVsOa/gt4O6DvmLpvocZUXerTpFEqNTAH2m3NV33HHKjTCZyq23X5cREgrIqSpSKSTW69psqxcz+b9Mk34FAk4KtnsCIZ53pPJ5P1bdjEH741zjg3rSw9ePJXMVGZupk/4WTt09YUZoxL+V00ByRiHW/K8SDxOlFoCLDQKXUiJKd2y0K/slFvSasw+wlUvJs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(82310400003)(6862004)(26005)(356005)(81166007)(8936002)(2906002)(508600001)(8676002)(86362001)(36756003)(53546011)(6506007)(5660300002)(6486002)(4326008)(83380400001)(6512007)(316002)(47076005)(54906003)(2616005)(70206006)(33656002)(70586007)(336012)(36860700001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:56:27.5941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a52c180-264a-4ace-9f77-08d98c9502f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5371

Hi Jan,

> On 11 Oct 2021, at 09:52, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 11.10.2021 10:50, Luca Fancellu wrote:
>>> On 11 Oct 2021, at 09:11, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 11.10.2021 10:03, Luca Fancellu wrote:
>>>> This patch introduces the support for dom0less configuration
>>>> when using UEFI boot on ARM, it permits the EFI boot to
>>>> continue if no dom0 kernel is specified but at least one domU
>>>> is found.
>>>>=20
>>>> Introduce the new property "xen,uefi-binary" for device tree boot
>>>> module nodes that are subnode of "xen,domain" compatible nodes.
>>>> The property holds a string containing the file name of the
>>>> binary that shall be loaded by the uefi loader from the filesystem.
>>>>=20
>>>> Introduce a new call efi_check_dt_boot(...) called during EFI boot
>>>> that checks for module to be loaded using device tree.
>>>> Architectures that don't support device tree don't have to
>>>> provide this function.
>>>>=20
>>>> Update efi documentation about how to start a dom0less
>>>> setup using UEFI
>>>>=20
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>=20
>>> Did you get indication that these are fine to retain with ...
>>>=20
>>>> ---
>>>> Changes in v5:
>>>> - Removed unneeded variable initialization
>>>> - Fixed comment
>>>> - Fixed error message for the absence of an initial domain kernel
>>>> - changed efi_arch_check_dt_boot to efi_check_dt_boot and add
>>>> a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
>>>> message about the call introduction in the EFI boot flow.
>>>=20
>>> ... all of these changes? Every individual change may be minor enough,
>>> but their sum makes me wonder. If so (or if at least one of the two
>>> gets re-offered)
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>> albeit preferably with ...
>>>=20
>>>> --- a/xen/common/efi/boot.c
>>>> +++ b/xen/common/efi/boot.c
>>>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>>>>    StdErr->OutputString(StdErr, (CHAR16 *)s );
>>>> }
>>>>=20
>>>> +#ifndef CONFIG_HAS_DEVICE_TREE
>>>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle=
)
>>>=20
>>> ... the "inline" here dropped. We don't normally add this outside of
>>> headers, leaving it to the compiler to decide. In headers it's wanted
>>> to avoid "defined by never used" style warnings.
>>=20
>> Ok I can drop it in a next serie and retain your Ack, or is it something=
 that
>> can be done on commit?=20
>=20
> I guess that's easy enough to do while committing. Provided of course
> the two R-b get confirmed.

I confirm my R-b.

Cheers
Bertrand

>=20
> Jan


