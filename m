Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F32814676A5
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:38:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237432.411818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6t6-0004je-8Y; Fri, 03 Dec 2021 11:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237432.411818; Fri, 03 Dec 2021 11:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6t6-0004hO-5E; Fri, 03 Dec 2021 11:38:00 +0000
Received: by outflank-mailman (input) for mailman id 237432;
 Fri, 03 Dec 2021 11:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSTI=QU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mt6t3-0004hI-MZ
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:37:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74e99da1-542d-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 12:37:56 +0100 (CET)
Received: from AS8PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:20b:313::19)
 by DB8PR08MB5531.eurprd08.prod.outlook.com (2603:10a6:10:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 11:37:52 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::1c) by AS8PR04CA0074.outlook.office365.com
 (2603:10a6:20b:313::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Fri, 3 Dec 2021 11:37:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 11:37:51 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Fri, 03 Dec 2021 11:37:51 +0000
Received: from 36628c90befc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2CB0E46D-8118-4F5F-8807-0FB156956B6E.1; 
 Fri, 03 Dec 2021 11:37:42 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36628c90befc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 11:37:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5896.eurprd08.prod.outlook.com (2603:10a6:20b:294::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 11:37:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 11:37:41 +0000
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
X-Inumbo-ID: 74e99da1-542d-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojA+V2sFIMFVxJ+V0ettajToh0xyk9noTUR9uY9+agQ=;
 b=7LTU5Novq8zumt+zntdafG8vsYznkhPOrqLCr6ZM1NE0QzEFSgSuDyrj5C8eRrzgwTk6PhM0TEWIwQvULn0k+vqvgAd7KmmnzA3AWFBdUP1HfWgOnetQcf5u6v1bE/10NAXRQI355fYpUbYj9PEWxehp5Oco/HIjs8JCEDY6Brk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2071fc8ef9a972d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbHr2arcZbIr9qgUlPqJOWtagrAqYfTl6imyrwgIBfNVa6zuwBnQLfyz4YvdvFQ0sj95D9ob8RShxysCxFe3ccRre7FXE+G9lq52ISg2Kqsf68cRZwKiudNzsHqld72U3xheaDwZ43PTNqwfthg4Ky70ZBkdTkYA9E7iGciTY87yE6ez9G8H9N9ayqDSymCwOeIZgRfKhEWptCI5iRUSRzouAAFEtk5HTaJvf44kl6MSldLYXP0ZbxGp8QNgt92fFLhY62WmJ4MLJyTB5RP6XxY8RdGFXWzcSMaiWjj5ikzBUqYZpezg363jRAKNTbFdZji8i1+E3CjkgZxDvABpFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojA+V2sFIMFVxJ+V0ettajToh0xyk9noTUR9uY9+agQ=;
 b=HiZl+IR8M0PprKc0fAYDGphWB61W0GP+m7PduyppIZbriYUUl1kOKjtSlXv1pEIolU9ASFvG8RCh6t5xtoYYHL3hzCRCjgPYURJY9pyQJnHyhGQRMewiV77qnktRW9BeQSX9KHHwH4lTZ0yV86raIF70JIvcXbqBZ8bU4rguwSJEYoQanu5foUzYavdLRf5ChhDFQOOT8qydmdttJl95OUxvvrBVlo0BueeYcQVXNv3uk6e75azg29Aho1AlPgmFSJgcBEUPzqPFh46b8S+wCL8SyJ3EGWOUCiP3E/gk0KJwuUU8DAF3oEyU1fnyhca/cYj6tfCbngm8Guu9qpuUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojA+V2sFIMFVxJ+V0ettajToh0xyk9noTUR9uY9+agQ=;
 b=7LTU5Novq8zumt+zntdafG8vsYznkhPOrqLCr6ZM1NE0QzEFSgSuDyrj5C8eRrzgwTk6PhM0TEWIwQvULn0k+vqvgAd7KmmnzA3AWFBdUP1HfWgOnetQcf5u6v1bE/10NAXRQI355fYpUbYj9PEWxehp5Oco/HIjs8JCEDY6Brk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/vgic: Fix reference to a non-existing function
Thread-Topic: [PATCH] arm/vgic: Fix reference to a non-existing function
Thread-Index: AQHX6CxjOPaugM9lo0aVspePzsZYTqwgjh6AgAAR9gCAAAPtgA==
Date: Fri, 3 Dec 2021 11:37:41 +0000
Message-ID: <D7D0ADA8-E650-4FE2-B8B4-D68D2FA0201A@arm.com>
References: <20211203095837.20394-1-michal.orzel@arm.com>
 <B3D7A1CC-6CEB-45C9-914C-6BF5540EA1BE@arm.com>
 <fa4c0e20-3640-e948-a39d-42c80aa40e9b@xilinx.com>
In-Reply-To: <fa4c0e20-3640-e948-a39d-42c80aa40e9b@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f28c8faf-72e1-4c60-c03b-08d9b6515703
x-ms-traffictypediagnostic: AS8PR08MB5896:|DB8PR08MB5531:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB55310C78D406E54EB07C477E9D6A9@DB8PR08MB5531.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 282ekoGbKo92kv/W+jKH7R4hdfKUXG4PJz+4ghs4TmTR0t3szzaUkaegg8mUq4UEihCCBzgmjFKvIlp92mkDMlSlHjYQNbuxb3sEzUpvANKDpAZuU//4+t/95ZHmHZEsIoPm0++YMj8Zmw1OtXDKbcNazB4ZqAln/UuRHvKWW3QMKS/RAhVw24jcLv9HoWf6d2TadzqVNjKcmI93SYAKtgq93xpA5/wKSnD5OSBUnLz/pxCS+FCpTcJaCW5tR3Ty//Py6z8xWv7Vq+pLG7szmGxsS4QteXe89yGSKAQ0WCh8nR/yayEQq0o5AK0YcO1aeDPifgYZUmY8B4hMPR/tNv/8961A3giUXeFPTPz1b1W8Jl6MTUQLA/OZ7n1cFUtAhn893l2kG5C6HdHKzFEpqd2xXjVjnT0jlZ6HvUnke7ZXNLjNKodtJ4flBsNXE2t+QAGf0n2PKbFLuu2mALgXSODGgUBxTWhBfY/IAZWJI3FE7TFUViaDqWxhGj27XOtyQOG0Eo/l4Edce5ZL1CHJcQtCPbCwph3HrdUwPJSwpnvtq6xJyan0Fy6orm92AaiYIDethE4N3buitBdcIUv8LgZENYRZzPuPmXgVVozzLGO26PztvVaZ4emSTARFY/UEarg+8+MWqSTKXKWpoO0/TH/FGMBU/XhfDCbo+d1jG/VQGW/xiutc2DcSWfouqdU3sKCY77sSw3wb8Qa2am/TGG7K9ekIZkOTWktIoEvSPpM48qtV72wNoax4EtQQWMzD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(71200400001)(508600001)(6506007)(316002)(2906002)(86362001)(66556008)(38070700005)(36756003)(8936002)(33656002)(4326008)(5660300002)(66476007)(64756008)(8676002)(26005)(6512007)(66946007)(76116006)(91956017)(83380400001)(66446008)(38100700002)(2616005)(122000001)(6486002)(53546011)(54906003)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C450AA42084EC54C9038A967EE0113CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1f429616-d202-43ea-9991-08d9b65150be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TdDcuT0z3rT7PgfGocgWSivdKr/XZG+RRn7GXub+cVrcsCTCKfrgHXejZzyTHO1XdhYfUFBdSl655d8JrwnkCfY2hIdbeHSGDeN5xePDvlQMvfd72jRhRVwZP+lD9dcjAk5AnsGpaNWTQmifZ3tH8QwdxnkZ0pFeYyaPnZxwgylZ7eJf2m/LO1NbGavMKDMmOLa/J6HDzBN0uiv67GMZxaGaYJ5Ub39RXAFf+uAnTpGATqEBBOtaCCIXuwE1CY+X5k59RxGrO4oenpak+rsQ1MTvw/PLPRxRCMgLkGUPu3hHArE8GzHgC8JXxW4RYJPlvSVQn71mxt21oGLpPCAfHdf+L7+2Rn0a2mRFVpSGhxy85d8StIEETPHJm8xDhAeA2C4n3UsQwIWmID4VZFodetpbBvUdXa3jlRX0GEpBLNOv6LY6xOe+iHn18Vyu4t/GoAXHSuY7WpXfhsHyPegzcc2BWmV3zSo0EtsIH/DIKAycaru0G7qj/0iGC/BLRMa/nMP7yBKgm1krgFwx3chSA0UbA5hST4GIaVqNk6hfwuzmlr1vMZamIn5wBTpfWoEdscHZhsAdcMuafQ/DPIQ5YIsFsq9gLGFJmHO3cPv2417nMsxXVS0OKQc986MVxtqUYGcgJwnxxnCwRZTIz9JupuwCSmQ4g+6L+qqRqgw42colUouka5xB2m6AVmbIT+mwHTqYAWTFvLZwJaCNxkmE1g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(70206006)(6486002)(83380400001)(4326008)(33656002)(81166007)(70586007)(6862004)(53546011)(356005)(54906003)(47076005)(107886003)(6512007)(2616005)(508600001)(336012)(5660300002)(82310400004)(316002)(86362001)(8676002)(186003)(2906002)(8936002)(6506007)(26005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 11:37:51.7011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f28c8faf-72e1-4c60-c03b-08d9b6515703
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5531

Hi Ayan,

> On 3 Dec 2021, at 11:23, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>=
 wrote:
>=20
>=20
>=20
> On 03/12/2021 10:19, Bertrand Marquis wrote:
>> Hi Michal,
>>> On 3 Dec 2021, at 09:58, Michal Orzel <Michal.Orzel@arm.com> wrote:
>>>=20
>>> Commit 68dcdf942326ad90ca527831afbee9cd4a867f84
>>> (xen/arm: s/gic_set_guest_irq/gic_raise_guest_irq)
>>> forgot to modify a comment about lr_pending list,
>>> referring to a function that has been renamed.
>>> Fix that.
>>>=20
>>> Fixes: 68dcdf942326ad90ca527831afbee9cd4a867f84
>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>=20
> Bertrand is very fast. :D.

To be fare we are working together with Michal ;-)

> I wanted to check if it is ok to add my R-b.

It is always ok and welcome if you feel you understood and check the change=
 and it is ok for you :-)
There is never enough reviewers.

Cheers
Bertrand

>> Thanks for that
>> Cheers
>> Bertrand
>>> ---
>>> xen/include/asm-arm/vgic.h | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
>>> index e69a59063a..ade427a808 100644
>>> --- a/xen/include/asm-arm/vgic.h
>>> +++ b/xen/include/asm-arm/vgic.h
>>> @@ -195,7 +195,7 @@ struct vgic_cpu {
>>>      * corresponding LR it is also removed from this list. */
>>>     struct list_head inflight_irqs;
>>>     /* lr_pending is used to queue IRQs (struct pending_irq) that the
>>> -     * vgic tried to inject in the guest (calling gic_set_guest_irq) b=
ut
>>> +     * vgic tried to inject in the guest (calling gic_raise_guest_irq)=
 but
>>>      * no LRs were available at the time.
>>>      * As soon as an LR is freed we remove the first IRQ from this
>>>      * list and write it to the LR register.
>>> --=20
>>> 2.29.0
>>>=20


