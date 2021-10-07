Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D78425696
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 17:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203795.358937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYVLT-0003S3-3O; Thu, 07 Oct 2021 15:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203795.358937; Thu, 07 Oct 2021 15:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYVLS-0003Px-W3; Thu, 07 Oct 2021 15:30:06 +0000
Received: by outflank-mailman (input) for mailman id 203795;
 Thu, 07 Oct 2021 15:30:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/ki=O3=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYVLR-0003Oy-Ij
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 15:30:05 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3813c03-719e-4888-887b-4fa886017438;
 Thu, 07 Oct 2021 15:30:02 +0000 (UTC)
Received: from FR0P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::20)
 by AM0PR08MB4034.eurprd08.prod.outlook.com (2603:10a6:208:12e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Thu, 7 Oct
 2021 15:30:00 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::2d) by FR0P281CA0074.outlook.office365.com
 (2603:10a6:d10:1e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Thu, 7 Oct 2021 15:30:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 15:30:00 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Thu, 07 Oct 2021 15:29:59 +0000
Received: from 70a12718b8b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C88D5D7F-7CDF-48F9-9603-0493581D19DA.1; 
 Thu, 07 Oct 2021 15:29:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70a12718b8b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 15:29:49 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6471.eurprd08.prod.outlook.com (2603:10a6:20b:338::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 15:29:47 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 15:29:47 +0000
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
X-Inumbo-ID: e3813c03-719e-4888-887b-4fa886017438
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMbvtsafk8HUbGV2INpIWlkzHN5DRDADVvr+1fMg1pM=;
 b=9sLPrO9Q0v77BhVLSNnUHNrjEtNFOYKxTymkDlLCaWgrYC6tNRU8hHgzOtA4UV7CWYiGyANrzeIhHvacYtbQ7uVK57xskl9YTZ3jgVbSq/VxDZT6oeOG5c75lc47WQJWIjZnH9/nPYggSD70ermjhZKH45ynXIGgRtEmdUaWZ/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e4891f7055c739b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/rm0oIVXBPe8qB+Oghf+1kSiSCt+7CrQM4KzUR4WrqUKAkJuUOdWOP4VLbgeAaRrEyf20Mm4TqeQQyDL0un/f3lLmGfZpEg3ti89+WBRXGaFdvWQCzLL1SITNv+sabsD1CE8JYDUcPzTsvza4v1xHQnpySd5Sw4rOfggwjA8UqvXuN7P1xeGMwGH1SHIQr3To38LXK3ZqkTQhMKL4bUX7HIoq6KWrwNOJhwshPGR+7ZtOiTUwCI7wLbQ0DS7V6iJsXiUVNGE+G52RDUBB0Mv5RxliT40VcUrGv4HibKwTKfWbA5YaOgDPCm0AUi86tjEM4iwx1czId8EJ8/3wJi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xMbvtsafk8HUbGV2INpIWlkzHN5DRDADVvr+1fMg1pM=;
 b=JfPyKIY8y7eIcBXlDo4YaIIAhTjjQo9evfAQZwk6jNWek9OqZqRM72QB/fTW3vTd1M3rZJaqnzoh1IJsUoIMhg9jsMm8BV6BN8htL7UEOpR6lycqhZSiU8ERmUY5j76wH3K1iozAnlWPItBlZq1PY1l4fSZ4fnxl4jUbpeILl406KIvQkx1FUi3JXnwlHmxhLfnLXZ1Gp6LiLtX7ZQnHDMhGzDAa3TGzMROzKupfwv5sz4oin6+RlTuBVLIUvdUfwRryPB8ub/6hD4AnOnM48Z67NPPNSulh3cSlDMOp+IBpPGpZUV7YuFae+nrGRVQXQiZ5D5qiLaInC9HL/My79A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMbvtsafk8HUbGV2INpIWlkzHN5DRDADVvr+1fMg1pM=;
 b=9sLPrO9Q0v77BhVLSNnUHNrjEtNFOYKxTymkDlLCaWgrYC6tNRU8hHgzOtA4UV7CWYiGyANrzeIhHvacYtbQ7uVK57xskl9YTZ3jgVbSq/VxDZT6oeOG5c75lc47WQJWIjZnH9/nPYggSD70ermjhZKH45ynXIGgRtEmdUaWZ/k=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXutl6z4iIfi6+uESKx+Wr4ZB/gavGQpyAgAEa5QCAAE0egA==
Date: Thu, 7 Oct 2021 15:29:47 +0000
Message-ID: <294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <24926.53690.621007.507249@mariner.uk.xensource.com>
In-Reply-To: <24926.53690.621007.507249@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb702a6-a3a3-40c7-657b-08d989a75390
x-ms-traffictypediagnostic: AS8PR08MB6471:|AM0PR08MB4034:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB40343ECD8E2B2714EDF62252FCB19@AM0PR08MB4034.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8okzO+UjStjIfyPb0Ufayoc+VNkscfUt1WpJ92qQmJnxe8haQXynDoY9ui087u9vrDxh6oxKFX0h33DXgGlz4Z7UV+qYbLPfncs2cWUDadG4eHiMRgUrgDiQXgghL9+jVp5N+hq9Qcf1bUnwmAChldw7BNcEnESMXXoENNYTP5kOhO22U7hMb5QIULWyBZDBG8YnuEnmyQ3qhkFNxj4Tj7wZ1R0VqyizJfJvDg6Zlvz3ftVg6nLBLb/fyh/61idzI15Jq5H4/A6HdUxMan1dorAjIT+V29WEB/ou862KwtM+keHzgwibHHdOC6PYEa3BuLa281M/EP3aWfb/z44kyrucb5SA0BKZC9ogmgBeImel8xHJiw8Co95ettdGOujvUDMdlaqxHgDX6+e/hVXSbdOPU/1DZBoKzytt1+xqtQhU0OwcHfabw30v9d2Z1MlsvCXxwh5jBHZ8ssNZgEbIgXW8lLV7Xnk0Tq3O0DZHI83t3/71mp2IzSRktqgon6SN0GiDqoe+w+ysx5RYipu6vAyfE+ffTw9QUngj//tvYJC5YTXgs6kVvXiFcMC2erA9baCpS7Bonsn6gA0bkiKOiA5pev5SymAUxCccGmqH8GMNBDTUAZOAUsFfXGWQRJCBxbsyiWMjxuAcyAQhwoanXsi1gInfJ1cljwuf+HM18LSDvxDyMhbx4d8cJbUepUgm3azka+YTzmjglG0VE80vDOeyEoQnhth8gVfpuXMFe3URuy5SVfUKuSnQNa9MyqRc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(4326008)(64756008)(36756003)(38100700002)(66556008)(8676002)(508600001)(2906002)(5660300002)(76116006)(66446008)(186003)(71200400001)(26005)(2616005)(66946007)(83380400001)(316002)(53546011)(6486002)(122000001)(6512007)(6506007)(38070700005)(33656002)(86362001)(54906003)(8936002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9637212E0FBFC944BBEB934E53E2BF1B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6471
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f749df1-d233-4aaf-4994-08d989a74bdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLqTbdlCenlnWSNh25RUJpyerPLN3ZVPVi7CiGiI2PErqn6TjI49DZP70FS/zA5qM5ZxiHoVMDsADs270WGvr04HqmU+UCgiDAI2kwNoPnyuBDKMM2+h7eP2BHvmLlAblAeTdrW6zeDXB6LElFo7YlEvHUQR0G1YpfSZtkvmKifMyBxrLYuN/subJfy19X6VOA9MXtJZpzl8GF2t6qBYkM9ARRQCRz288F1STloEUxER2Hbd8Sml9sU+PPT72kKubLBoSHr/SpbBlmYelEfhycA4pQweaKLr+jnv+HGF7f5lLQsI0PHLyDSMSTjJtgdBCuffLZoEgI40DMkvJdsXc8Uq75aEndlQadovCB8cVNio33dh5c3Ch7qg8Yqerv7+YtwemDYSFh04aQBdIIqHQ5X3CHuAiQuUBhPR4A3CJpsOBbTtM3PiQVL6TbQNabaf3P8Jsh6cC9GQ3ljjjmURXYz2GMQLqaeSYTOe9onD6xoLrf3wkny2e2e92+7SgeewxaiQexUT1uLSfwCKf52QVFRjFdeIgJlPYw9bYQcOsk3WZKiMqLMWUzGCmgv0FXxWvCbwee/DrmDd2mrKQqKlgusXs5bcttZhzl+iEBsycICIpPXn6gTY0wnhFr/9nNcRfiffQeo8q/Fy4w5rZUsN/qfnFEJvtE311gLe9CswyQgFKCDkwCCnMmu4D/DpQvvYymWdTBaGAT+RPBurBmA3uQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(53546011)(508600001)(186003)(6486002)(6862004)(6506007)(33656002)(26005)(336012)(36860700001)(47076005)(2616005)(4326008)(36756003)(2906002)(8676002)(70206006)(83380400001)(356005)(70586007)(82310400003)(81166007)(54906003)(6512007)(8936002)(107886003)(86362001)(316002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:30:00.3142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb702a6-a3a3-40c7-657b-08d989a75390
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4034

Hi Ian,

> On 7 Oct 2021, at 11:53 am, Ian Jackson <iwj@xenproject.org> wrote:
>=20
> Julien Grall writes ("Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device=
 tree node in libxl"):
>> On 06/10/2021 19:40, Rahul Singh wrote:
>>> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_=
types.idl
>>> index 3f9fff653a..78b1ddf0b8 100644
>>> --- a/tools/libs/light/libxl_types.idl
>>> +++ b/tools/libs/light/libxl_types.idl
>>> @@ -644,6 +644,7 @@ libxl_domain_build_info =3D Struct("domain_build_in=
fo",[
>>>=20
>>>      ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>>                                 ("vuart", libxl_vuart_type),
>>> +                               ("vpci", libxl_defbool),
>>=20
>> I have posted some comments regarding the field in v4. To summarize,=20
>> AFAICT, this option is meant to be only set by libxl but you still let=20
>> the toolstack (e.g. xl, libvirt) to set it.
>>=20
>> If you still want to expose to the toolstack, then I think the option=20
>> should be outside of arch_arm. Otherwise, this should be moved in an=20
>> internal structure (Ian, do you have any suggestion?).
>=20
> If it should be in an internal structure, probably the libxl create
> context.

As Stefano suggested in another email that we can remove the vpci option, i=
f we=20
reach to conclusion that we need vpci option I will move it to internal str=
ucture.
=20
> =20
> But I'm not convinced yet.  In particular, if enabling VPCI is
> necessary on ARM for hotplugged PCI devices[1], then there has to be
> a way for the admin to say "while this domain may not have any PCI
> devices right now, I may wish to hotplug some".  That's what the
> "passthrough=3D" option is for.

Yes I agree with you VPCI is necessary for hot plugged PCI device and once =
we=20
implement the hotplug in future we will use the passthrough=3D option to en=
able VPCI.

Regards,
Rahul =20

>=20
> See my other mail.
>=20
> [1] I think this is all true even if PCI hotplug for ARM is not
> currently implemented.
>=20
> Ian.


