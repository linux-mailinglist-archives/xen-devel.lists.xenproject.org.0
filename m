Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DD84464A3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 15:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222393.384557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizti-0002uo-9k; Fri, 05 Nov 2021 14:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222393.384557; Fri, 05 Nov 2021 14:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mizti-0002sN-6V; Fri, 05 Nov 2021 14:08:50 +0000
Received: by outflank-mailman (input) for mailman id 222393;
 Fri, 05 Nov 2021 14:08:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQ27=PY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mizth-0002sC-7b
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 14:08:49 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e497b692-3e41-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 15:08:48 +0100 (CET)
Received: from DB6PR1001CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::22)
 by HE1PR0802MB2364.eurprd08.prod.outlook.com (2603:10a6:3:c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 14:08:32 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::9a) by DB6PR1001CA0036.outlook.office365.com
 (2603:10a6:4:55::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 14:08:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 14:08:32 +0000
Received: ("Tessian outbound 7b0bcc4a550a:v108");
 Fri, 05 Nov 2021 14:08:32 +0000
Received: from d822431b56d8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1BF1ECA0-CC94-4FF4-A065-1CA1B6B628B3.1; 
 Fri, 05 Nov 2021 14:08:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d822431b56d8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 14:08:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM5PR0801MB1956.eurprd08.prod.outlook.com (2603:10a6:203:4b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 14:08:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.023; Fri, 5 Nov 2021
 14:08:21 +0000
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
X-Inumbo-ID: e497b692-3e41-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLPrkt6/zQYH8DBVZfGNI6NIF13uejdapsIuDgyczu0=;
 b=cSp4PuTIPymS5Aqlxl6oFJOnTaOkSRtDxwN4FdeHbs3aLDcyhC32QsXG1pP/383P/fKuSoTb3zL6P9I2pGtezhCb4r4WZVgvjK6k8YFf02xa9X/nIhkI8ZXtFo6oDqBuoelzUQscsPbfOyJspsKMB6LxZumnJKa6pYxHRyePaeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a61d91ca9011c893
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9kHz5xgne7T77xo4S0kEn9jJ902af3P4CFeY24cgKzEkHU6TglYVYdIQs5PZmXRsj6KXDSaZwt1e4eEzHQzJgDewXG2jiWeID/KcFuCZz2Lo26+Tl1tEK9Ik22tBJXIDlF7vUScURsM18RqvZAL9p5u9NOFVNy+QtSa/cerP8YY6cpjbwURzeEbYxzrNamcAxPRP8ep8Y8xQYOq/Qedbi5FQ4AXmkku7ykpGzmgjUkWSha/oCRopYV9hDun13aVTZ09Kwiv9io9nALo+P3Z5AsKOf2VFnsnkMpvQtqq5riRMdG0S4KjPkQxrhLSSNYmxXY7jIA0C5JTHAXa8Sq5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLPrkt6/zQYH8DBVZfGNI6NIF13uejdapsIuDgyczu0=;
 b=WA8MGAoKm3SpSpl6pvcU3vHw8+EV2VjcLkMLDBe8GHyIWcwy7V9lMtnf4lePQQm18O9NxRMdNziRl8tLLtmtu+6Y9sKBd/IlC56LJlgxbWNuIX0w84JYqcxAAs24sbO/uRm3XBrYmxem/kiUNa1ym4tfra4wQE3bn1S6doZpBA2OIJ0B7HlTqcQm4JLtR1L837xDQOgz9F9q1g+SmgIWjbqolfKQzp+94Im0i1QrtwJPMCxQBvyJaU9oIR099dAq9C6Q5ZjN1qP6I27Afo5vw83Ve313ZYwkcdp/AkKfeBkfFK+OZq+E01F2LbJQj0V1sSsE1QXAUhaOwCZB+wcwQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLPrkt6/zQYH8DBVZfGNI6NIF13uejdapsIuDgyczu0=;
 b=cSp4PuTIPymS5Aqlxl6oFJOnTaOkSRtDxwN4FdeHbs3aLDcyhC32QsXG1pP/383P/fKuSoTb3zL6P9I2pGtezhCb4r4WZVgvjK6k8YFf02xa9X/nIhkI8ZXtFo6oDqBuoelzUQscsPbfOyJspsKMB6LxZumnJKa6pYxHRyePaeQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, "iwj@xenproject.org" <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64
Thread-Topic: [PATCH-4.16 v4] xen/efi: Fix Grub2 boot on arm64
Thread-Index: AQHX0kYoSoO8NNoKbUqbCOBW9Z1B86v0+J6A
Date: Fri, 5 Nov 2021 14:08:20 +0000
Message-ID: <445836DF-C831-4478-B4C7-2D98E2258FD2@arm.com>
References: <20211105130728.30648-1-luca.fancellu@arm.com>
In-Reply-To: <20211105130728.30648-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 55da97e5-4cce-42b9-d004-08d9a065bfec
x-ms-traffictypediagnostic: AM5PR0801MB1956:|HE1PR0802MB2364:
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2364B977A9B9AFEDFA95F97A9D8E9@HE1PR0802MB2364.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:153;OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cTo3ozCFRdTM7j2k1wZyvZ805h6K0PAFhMj/fiOXjy9jGJqJUnG/m/iSHxauOAsBp6Ipnk8Ffb1eUG04i5kt3Qz9c+mab3uRRslN57A+muo9wgeD/KGXUCbiZFVpghFB5cSCl9oMr+4vflaCnXqj5vIJKzchvI1GVR36g8RjLinBcWoGJjTi5u4Xelwd3f2l6vONCfoqCOabfbELXljcZnp+ZgjNOIQK4lFOhKG6Pd9M/ZxiO17R8n644vckEk/d54YrZLv3Vt2K/KZZKZYm50XtCbYWTHIpKGru/hKdSsDs7BHGwfqC1Oo2FkBZKkAjmho4+SJfehOZS+QqXyHgWLzeIUyJQjZ7InHV9ShMO5ALSUi2Eirxk9CLGUr2RCA98cpp0Pvk84XwSWG6H3syiKsb0jdsR8XWGgXGBIHURBi2yDil5LxlUyJqOEFmEu266l93JidIc0nza85kQixJmYijWdKZvSf0qnHhYpn1wZJStEWI8W7BpL5lQgGMfjyrdpWVGdFp3iOhgtx8lmcl4uJTRNssF0LDuNdP8h4Za0HZYVB/T9e/x28urjTxh6eV1EczeoAuCCNTs5Bifj1R7PNLbyPDnOkH+ITJN6fxkit2I6UDw4bY2+n0xSBJqZJ3zRurYPRzybZfaPcGTzM96PCLr0Y0+2Yq4/Cyd7RWAuVj1et228Y1JfGBkS1K7oBjwQRzSbwlm4nUz8Eq+iQHeGQng+5mMI941Xldw62xoM2+jk+ZOyuBwcYLYcY23Jii
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(54906003)(6486002)(6636002)(66556008)(64756008)(38100700002)(66446008)(6506007)(53546011)(186003)(6512007)(66476007)(76116006)(66946007)(71200400001)(6862004)(2906002)(86362001)(26005)(8936002)(91956017)(37006003)(83380400001)(2616005)(38070700005)(8676002)(5660300002)(30864003)(33656002)(316002)(36756003)(4326008)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <127D58C527DC624AB2BEF74D3AB97C2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1956
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b1dc4b4a-bfc7-448c-94b3-08d9a065b94e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n/DlpI/nJe8Perj1B3HfSj4A2ViUVogmIL1Tb3UUivJsXGeKbGppoj/u/BxUcdlzWVibxVIc9yWZoAjbEvYZP90fibZLT3GThUSgiQPfjf2gQargBsm2iNUz+iWjb22tgIhOa3S6Yq9S0Sf2+DE4h1LqEnaSXJ1c4YiAXaNxJHby8DJI7EzLM4c4+sj6x3yMhsKDm7QAl3TOyVCjjRIHA/S2aAcl1LLD5HV2uCgflfEYUTVPCL3MBJlMV5+mMlKiSXikJIU9roDu05Pj5ZTJW4/LETK41fn0nNBn1v5+aZIyPr9nRP01hI0YUKHjvjN/HAD9Gb5Avl9MQdY38TTFeWpjxBdpQfAaedWCqpReii9BoLMOc5DYUfDSFKP9pGzZ2OlQvnAYqT4RO1kWdqReODfuxUDpG15/Nk6IJbv8Jn0GxqcOk7bhCj/dGNhp/Gje961O9JuBSLGPy5FezvUx0EDPN/nIrRKNHIOvwFh7yXTivFIZ0s52SsXyoIu9RrJU4/m7kqdFPONnNwXkWum9Z2h/3f7Qo51MMl1NejTf7dJGpMt6kHcuXeM85WfCzuO695kmDuhf0lzfHzCkdVviCZFQ0R+t0Xm5IeH5sU+VVLcA8T+LmJNo7WWVsGQf1IHqP8pqVlE0206bBJtGg7eWXYa4VTjmI7lG/FS9YBwtcCWWrznXDFEn7/mgp2b0p8/ukqkbQsRIZGfXxurypXdIiA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(2906002)(54906003)(70586007)(47076005)(8936002)(356005)(336012)(6486002)(37006003)(2616005)(6636002)(70206006)(5660300002)(6862004)(6506007)(107886003)(53546011)(316002)(6512007)(36756003)(508600001)(82310400003)(8676002)(26005)(33656002)(36860700001)(4326008)(30864003)(86362001)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 14:08:32.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55da97e5-4cce-42b9-d004-08d9a065bfec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2364

Hi Luca,

> On 5 Nov 2021, at 13:07, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
> ("arm/efi: Use dom0less configuration when using EFI boot") is
> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.
>=20
> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle
> inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
> handle is used later by efi_bs->HandleProtocol(...) inside
> get_parent_handle(...) when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL
> interface, causing Xen to stop the boot because of an EFI_INVALID_PARAMET=
ER
> error.
>=20
> Before the commit above, the function was never called because the
> logic was skipping the call when there were multiboot modules in the
> DT because the filesystem was never used and the bootloader had
> put in place all the right modules in memory and the addresses
> in the DT.
>=20
> To fix the problem the old logic is put back in place. Because the handle
> was given to the efi_check_dt_boot(...), but the revert put the handle
> out of scope, the signature of the function is changed to use an
> EFI_LOADED_IMAGE handle and request the EFI_FILE_HANDLE only when
> needed (module found using xen,uefi-binary).
>=20
> Another problem is found when the UEFI stub tries to check if Dom0
> image or DomUs are present.
> The logic doesn't work when the UEFI stub is not responsible to load
> any modules, so the efi_check_dt_boot(...) return value is modified
> to return the number of multiboot module found and not only the number
> of module loaded by the stub.
> Taking the occasion to update the comment in handle_module_node(...)
> to explain why we return success even if xen,uefi-binary is not found.
>=20
> Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI bo=
ot")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Justification for integration in 4.16:
> Upside: allow booting xen from grub on arm64 when the stub doesn't load
>        any module.
> Downside: It's affecting the EFI boot path.
> Risk: It's not affecting x86 arch that works the same way as before.
>      If something is wrong it creates a problem on early boot and not at
>      runtime, so risk is low.
>=20
> Tested in this configurations:
> - Bootloader loads modules and specify them as multiboot modules in DT:
>   * combination of Dom0, DomUs, Dom0 and DomUs
> - DT specifies multiboot modules in DT using xen,uefi-binary property:
>   * combination of Dom0, DomUs, Dom0 and DomUs
> - Bootloader loads a Dom0 module and appends it as multiboot module in DT=
,
>   other multiboot modules are listed for DomUs using xen,uefi-binary
> - No multiboot modules in DT and no kernel entry in cfg file:
>   * proper error thrown
>=20
> Changes in v4:
> - dir_handle scope reverted back (Jan)
> Changes in v3:
> - Revert back to the logic that protects get_parent_handle(...) (Jan)
> - Changed efi_check_dt_boot(...) to use a EFI_LOADED_IMAGE handle and
>   request, along the call stack, the parent dir handle only when needed.
> Changes in v2:
> - Changed comment on DeviceHandle NULL (Jan)
> - Removed fatal condition on handle NULL (Jan)
> - Add more info about the EDK2+Grub2 issue to the commit msg (Jan)
> - Removed modules_found from function signature and pass everything
>   on return (Stefano)
> - Improved comment in handle_module_node
>=20
> ---
> xen/arch/arm/efi/efi-boot.h | 61 ++++++++++++++++++++++++-------------
> xen/common/efi/boot.c       | 18 ++++++-----
> 2 files changed, 50 insertions(+), 29 deletions(-)
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 8b88dd26a5..458cfbbed4 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -44,17 +44,17 @@ void __flush_dcache_area(const void *vaddr, unsigned =
long size);
>=20
> static int get_module_file_index(const char *name, unsigned int name_len)=
;
> static void PrintMessage(const CHAR16 *s);
> -static int allocate_module_file(EFI_FILE_HANDLE dir_handle,
> +static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
>                                 const char *name,
>                                 unsigned int name_len);
> -static int handle_module_node(EFI_FILE_HANDLE dir_handle,
> +static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
>                               int module_node_offset,
>                               int reg_addr_cells,
>                               int reg_size_cells,
>                               bool is_domu_module);
> -static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> +static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
>                                        int domain_node);
> -static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
> +static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
>=20
> #define DEVICE_TREE_GUID \
> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0=
xe0}}
> @@ -647,11 +647,13 @@ static void __init PrintMessage(const CHAR16 *s)
>  * This function allocates a binary and keeps track of its name, it retur=
ns the
>  * index of the file in the modules array or a negative number on error.
>  */
> -static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
> +static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
>                                        const char *name,
>                                        unsigned int name_len)
> {
> +    EFI_FILE_HANDLE dir_handle;
>     module_name *file_name;
> +    CHAR16 *fname;
>     union string module_name;
>     int ret;
>=20
> @@ -683,9 +685,14 @@ static int __init allocate_module_file(EFI_FILE_HAND=
LE dir_handle,
>     strlcpy(file_name->name, name, name_len + 1);
>     file_name->name_len =3D name_len;
>=20
> +    /* Get the file system interface. */
> +    dir_handle =3D get_parent_handle(loaded_image, &fname);
> +
>     /* Load the binary in memory */
>     read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
>=20
> +    dir_handle->Close(dir_handle);
> +
>     /* Save address and size */
>     file_name->addr =3D module_binary.addr;
>     file_name->size =3D module_binary.size;
> @@ -702,8 +709,9 @@ static int __init allocate_module_file(EFI_FILE_HANDL=
E dir_handle,
>  * This function checks for the presence of the xen,uefi-binary property =
in the
>  * module, if found it loads the binary as module and sets the right addr=
ess
>  * for the reg property into the module DT node.
> + * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
>  */
> -static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> +static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
>                                      int module_node_offset,
>                                      int reg_addr_cells,
>                                      int reg_size_cells,
> @@ -730,13 +738,13 @@ static int __init handle_module_node(EFI_FILE_HANDL=
E dir_handle,
>                                  &uefi_name_len);
>=20
>     if ( !uefi_name_prop )
> -        /* Property not found */
> -        return 0;
> +        /* Property not found, but signal this is a multiboot,module */
> +        return 1;
>=20
>     file_idx =3D get_module_file_index(uefi_name_prop, uefi_name_len);
>     if ( file_idx < 0 )
>     {
> -        file_idx =3D allocate_module_file(dir_handle, uefi_name_prop,
> +        file_idx =3D allocate_module_file(loaded_image, uefi_name_prop,
>                                         uefi_name_len);
>         if ( file_idx < 0 )
>             return file_idx;
> @@ -795,19 +803,20 @@ static int __init handle_module_node(EFI_FILE_HANDL=
E dir_handle,
>         }
>     }
>=20
> -    return 0;
> +    return 1;
> }
>=20
> /*
>  * This function checks for boot modules under the domU guest domain node
>  * in the DT.
> - * Returns 0 on success, negative number on error.
> + * Returns number of multiboot,module found or negative number on error.
>  */
> -static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle=
,
> +static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_i=
mage,
>                                               int domain_node)
> {
>     int module_node, addr_cells, size_cells, len;
>     const struct fdt_property *prop;
> +    unsigned int mb_modules_found =3D 0;
>=20
>     /* Get #address-cells and #size-cells from domain node */
>     prop =3D fdt_get_property(fdt, domain_node, "#address-cells", &len);
> @@ -833,24 +842,26 @@ static int __init handle_dom0less_domain_node(EFI_F=
ILE_HANDLE dir_handle,
>           module_node > 0;
>           module_node =3D fdt_next_subnode(fdt, module_node) )
>     {
> -        int ret =3D handle_module_node(dir_handle, module_node, addr_cel=
ls,
> +        int ret =3D handle_module_node(loaded_image, module_node, addr_c=
ells,
>                                      size_cells, true);
>         if ( ret < 0 )
>             return ret;
> +
> +        mb_modules_found +=3D ret;
>     }
>=20
> -    return 0;
> +    return mb_modules_found;
> }
>=20
> /*
>  * This function checks for xen domain nodes under the /chosen node for p=
ossible
>  * dom0 and domU guests to be loaded.
> - * Returns the number of modules loaded or a negative number for error.
> + * Returns the number of multiboot modules found or a negative number fo=
r error.
>  */
> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> {
>     int chosen, node, addr_len, size_len;
> -    unsigned int i =3D 0;
> +    unsigned int i =3D 0, modules_found =3D 0;
>=20
>     /* Check for the chosen node in the current DTB */
>     chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
> @@ -865,15 +876,23 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE=
 dir_handle)
>           node > 0;
>           node =3D fdt_next_subnode(fdt, node) )
>     {
> +        int ret;
> +
>         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
>         {
>             /* Found a node with compatible xen,domain; handle this node.=
 */
> -            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
> +            ret =3D handle_dom0less_domain_node(loaded_image, node);
> +            if ( ret < 0 )
>                 return ERROR_DT_MODULE_DOMU;
>         }
> -        else if ( handle_module_node(dir_handle, node, addr_len, size_le=
n,
> -                                     false) < 0 )
> +        else
> +        {
> +            ret =3D handle_module_node(loaded_image, node, addr_len, siz=
e_len,
> +                                     false);
> +            if ( ret < 0 )
>                  return ERROR_DT_MODULE_DOM0;
> +        }
> +        modules_found +=3D ret;
>     }
>=20
>     /* Free boot modules file names if any */
> @@ -883,7 +902,7 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE d=
ir_handle)
>         efi_bs->FreePool(modules[i].name);
>     }
>=20
> -    return modules_idx;
> +    return modules_found;
> }
>=20
> static void __init efi_arch_cpu(void)
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 392ff3ac9b..8fd5e2d078 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -121,6 +121,8 @@ static char *get_value(const struct file *cfg, const =
char *section,
> static char *split_string(char *s);
> static CHAR16 *s2w(union string *str);
> static char *w2s(const union string *str);
> +static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> +                                         CHAR16 **leaf);
> static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>                       struct file *file, const char *options);
> static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *nam=
e,
> @@ -167,7 +169,7 @@ static void __init PrintErr(const CHAR16 *s)
> }
>=20
> #ifndef CONFIG_HAS_DEVICE_TREE
> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> {
>     return 0;
> }
> @@ -1144,7 +1146,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>     const char *option_str;
>     bool use_cfg_file;
>     int dt_modules_found;
> -    EFI_FILE_HANDLE dir_handle;
>=20
>     __set_bit(EFI_BOOT, &efi_flags);
>     __set_bit(EFI_LOADER, &efi_flags);
> @@ -1225,11 +1226,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>=20
>     efi_arch_relocate_image(0);
>=20
> -    /* Get the file system interface. */
> -    dir_handle =3D get_parent_handle(loaded_image, &file_name);
> -
>     if ( use_cfg_file )
>     {
> +        EFI_FILE_HANDLE dir_handle;
>         UINTN depth, cols, rows, size;
>=20
>         size =3D cols =3D rows =3D depth =3D 0;
> @@ -1240,6 +1239,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>=20
>         gop =3D efi_get_gop();
>=20
> +        /* Get the file system interface. */
> +        dir_handle =3D get_parent_handle(loaded_image, &file_name);
> +
>         /* Read and parse the config file. */
>         if ( read_section(loaded_image, L"config", &cfg, NULL) )
>             PrintStr(L"Using builtin config file\r\n");
> @@ -1362,14 +1364,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>         cfg.addr =3D 0;
>=20
> +        dir_handle->Close(dir_handle);
> +
>         if ( gop && !base_video )
>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>     }
>=20
>     /* Get the number of boot modules specified on the DT or an error (<0=
) */
> -    dt_modules_found =3D efi_check_dt_boot(dir_handle);
> -
> -    dir_handle->Close(dir_handle);
> +    dt_modules_found =3D efi_check_dt_boot(loaded_image);
>=20
>     if ( dt_modules_found < 0 )
>         /* efi_check_dt_boot throws some error */
> --=20
> 2.17.1
>=20


