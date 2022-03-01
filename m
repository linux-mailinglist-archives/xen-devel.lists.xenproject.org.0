Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493934C8E6B
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:57:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281623.480039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3w5-0008Pg-Ah; Tue, 01 Mar 2022 14:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281623.480039; Tue, 01 Mar 2022 14:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3w5-0008NK-67; Tue, 01 Mar 2022 14:57:09 +0000
Received: by outflank-mailman (input) for mailman id 281623;
 Tue, 01 Mar 2022 14:57:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNgs=TM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nP3w3-0008My-4O
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:57:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe10499-996f-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 15:57:05 +0100 (CET)
Received: from AM6PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:20b:92::35)
 by VE1PR08MB5615.eurprd08.prod.outlook.com (2603:10a6:800:1b3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 14:57:02 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::8) by AM6PR04CA0022.outlook.office365.com
 (2603:10a6:20b:92::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Tue, 1 Mar 2022 14:57:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 14:57:02 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Tue, 01 Mar 2022 14:57:01 +0000
Received: from 2123dd14850d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CCA1B9B7-9360-4DD4-8B39-FD90FAD0D9AA.1; 
 Tue, 01 Mar 2022 14:56:55 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2123dd14850d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 14:56:55 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by HE1PR0801MB1675.eurprd08.prod.outlook.com (2603:10a6:3:87::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:56:52 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:56:52 +0000
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
X-Inumbo-ID: dbe10499-996f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMo1hLmk0qH/EB55HU7/OnIZLjY9f/TCFdkVU0IOvuU=;
 b=twf5ZRYA5mDhOu+ycKsmocpAf6+/wEhTlTS8QCppKFYLDnhVYABPoGdwkcc7ik1l5Z7qwJeN5bll08b09hhOaElbTKslKMJ/d37Gnl5IJvW/b17gU9cZcB5S0FxQrHM6TKeurZMfKIE1tpAqx7eC0KRB/qSrmPNgRjQ19u0S8qw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac41b1ebd037f7db
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwZ8ToyfGnaSkHm+Ya4iI5RNUMkode7abK0XCsk+RnujlwBVsJ/B8fxMP2eH3Smr3SmVkrEhYxjA4GK9PISGC3yHWTUXoF0HsJlJ/SbicIT5zX33+1hXKtSNmQZ9UdoxDw7dZGPrNmfr9WR5tGqTmPjOTccWWGODc3hpwSnLMCn/bTIYEo4Y0W4ITvQZddXT2XoJowOxfKM5y6ugpvzMkWjTd3alHDaFOEoifLN+LMWApIsFaCwC7harSOXfxYMB9YPYlCYiPMdpfo3shit22Iqp7M/2B5NTdVnedELZ6G8bYgreNQ/8JhPzgoXsbj+D181y2mq42AkPv4z1ajjTqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMo1hLmk0qH/EB55HU7/OnIZLjY9f/TCFdkVU0IOvuU=;
 b=f6c4cWZ7kxk3mouMoNBvNzMGgtpQn4+zrmqDa+sUYSF2PS01GpMdijtX9BvkqGAESDnxo75SVmPsMvrcEB/OJz01PY6O/qQuryya36syQy5TIV4GbvoVRzWqNJ8xVOFMYgNbE6N+VR26joadrCKJAllz+8u7L8mhTwHf/9yoi14nJ6bP2i9v+jSAUztqzaM/C30epm8oJL7DJJTdCYlEc7Pjr7122T/roOYn9nbFnUahcUrIZRtJ2AjIHZgGd26AgoSo4uNJjAWb+3KhN0wK5UhFcSgsBiYi2diqh/FHIkpofx0proXf7LklYHP9poq3R1f7o5JpN5HOcD6lSQSo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMo1hLmk0qH/EB55HU7/OnIZLjY9f/TCFdkVU0IOvuU=;
 b=twf5ZRYA5mDhOu+ycKsmocpAf6+/wEhTlTS8QCppKFYLDnhVYABPoGdwkcc7ik1l5Z7qwJeN5bll08b09hhOaElbTKslKMJ/d37Gnl5IJvW/b17gU9cZcB5S0FxQrHM6TKeurZMfKIE1tpAqx7eC0KRB/qSrmPNgRjQ19u0S8qw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm64: head: Mark the end of subroutines with ENDPROC
 (take two)
Thread-Topic: [PATCH] xen/arm64: head: Mark the end of subroutines with
 ENDPROC (take two)
Thread-Index: AQHYLIsbZnt9ucibr0G+vW8JMwB0sqyqoBUA
Date: Tue, 1 Mar 2022 14:56:52 +0000
Message-ID: <A5C64930-A718-4F9B-99BE-F8389EE5722C@arm.com>
References: <20220228100805.60918-1-julien@xen.org>
In-Reply-To: <20220228100805.60918-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6dfd0050-63a5-46a5-12ba-08d9fb93be5c
x-ms-traffictypediagnostic:
	HE1PR0801MB1675:EE_|VE1EUR03FT043:EE_|VE1PR08MB5615:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB56155DBF0F7BF960685AE6109D029@VE1PR08MB5615.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wrFErsKjH2nHZ2u389m0TauJnuCJCFXNytbHC9mrE+ouzV0jnxxkYLWTvDJ/ctM2G5pEsNRXU+hqffJd+wNLA6VQE2zJHkt92wtYG0BxgozaJ0tXSd6/rPaeyg4tfyw6Ja/eppjR9IH6eovOGi5oQAvg6bkyEseU7aa86+BEIaA2eQHcRo3UfernVatMQjUEe0gG9UzF9WJXc4wBU5eXMMjt7WVV4SeyziYeAthnUZSSUP5r6gG4Zr+jQnhU/4w5dbu81kDzAtGcXew91I+OXKX5+eLM1c+VT8Jb/0i34Bv4OZfoQD0GLokd9C/TxPtFm0RtFhMHysCoAhc65VVyAVH06KUUiDhJFn8yjXguXnbjS/KCaq8TRrhRo6jemWVr0CTF1K2VwgReEJpy2W6ZOm9A197YHKRUo1n+pHLpcl5JqAgPSQhjfJtQJ9eS9YctWGzCLzXup7RlIryHzzX4DC45884Gp48wIkVV7nrmm3O1qV70njvl6M5wiOR3UVf6LNrl1wkx3KjWzZG190Y1dGc+IK2Z9Rh15BraGeVxCR8SRyQld+dE525IUb9EBZDQ8W20SfghaRGUMlOZPZl9nmt135TDFftzaF2MBfxP1IV7Hchz2JVlIXZ/RW4givMIiSladsX9OkrKYzgPqni3C3ESalLuqgjZJUne5LGuISZUsNJZGuERGgs0XgSTCe7K/pOOEF0Zfok/UScUqK+l2Cm8R1aDkYXg9tQAEp5/tV+y/F0iaFsECAE+0Nwn1ufl
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(6486002)(33656002)(83380400001)(86362001)(508600001)(38070700005)(2616005)(6506007)(54906003)(6916009)(66446008)(53546011)(64756008)(4326008)(66556008)(76116006)(66946007)(8676002)(26005)(186003)(6512007)(91956017)(66476007)(316002)(38100700002)(2906002)(36756003)(122000001)(5660300002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D097B401A9A204E90868CD84E3D6C82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1675
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a357c5c3-f99f-47c6-df27-08d9fb93b8a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NtThdvEuh3+5Os6eRpZP0bF5K46wm4aZ8RY/sOaxmkOfLyt9aa0XQj+zws4hzJPI2o4qL9SOKnqHlDTGFX4VgbXZ0ykXDddqWGf/YLfcZKAJ+0xGJqFtouMzgFLYKHmqPEHiho0aBa4w0/Ooi0kLKFP9QpzZVgEp7IzIAOUSIlSIv0DZ2g6Y0GPpbt3KHJyOAqxz0trYvzM4mQFv8+0sJwStu7uvLKmrNzN5Xs/oqZsbzbTggNosDHyEKCADellPzZ612mH2t5xl0TtWFXvCzCyCla6JMkSPxB4YwRq4f1p8g0NYTsh8ahsMo/YeFBpV8lSiMThzsgVrJ4sMp+jOWSdB/N0GYMcs9xr9V6unmf9jy+7IJOtOul6gipJxc4Utv6yuqo0aH9BGYxYMmIK48Tk4qgNhctc8mG9M0rECR4pFWEv1Do25gH53qcjMRngw0LOTuZ8Omi/K1ZPNm+NXzB5eM+SuQJ+nB3WhfaMfqV+WllXSkVTczkKtfw3chZrv+4Xx4LSeqExcJfAMuNEansuNBmqkXkWggDdD8xBIAyM3t6yGhpMc+dGjumTyEh5NBUdpJNDjw5cFxULKoB0fy1HWn+AKnmK5JBRI0qn3KXZ4hcWnnA0R4SXL4TI8b7Equx3DJ0Dg01jybxVV8GfbAlGZqZX9gZmdGf7crUwhJsbT3tFo1zLxyZCjgTDhRLZ3
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(5660300002)(2616005)(107886003)(6506007)(336012)(8936002)(86362001)(82310400004)(70206006)(70586007)(8676002)(2906002)(26005)(186003)(33656002)(4326008)(36756003)(356005)(81166007)(6486002)(53546011)(508600001)(83380400001)(54906003)(36860700001)(6512007)(47076005)(40460700003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:57:02.1027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfd0050-63a5-46a5-12ba-08d9fb93be5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5615

Hi Julien,

> On 28 Feb 2022, at 10:08, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 13c03002c5df ("xen/arm64: head: Mark the end of subroutines
> with ENDPROC") intended to mark all the subroutines with ENDPROC.
>=20
> Unfortunately, I missed fail(), switch_ttbr() and init_uart(). Add
> ENDPROC for the benefits of static analysis tools and the reader.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm64/head.S | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 314b800b3f8e..66d862fc8137 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -800,6 +800,7 @@ ENDPROC(launch)
> fail:   PRINT("- Boot failed -\r\n")
> 1:      wfe
>         b     1b
> +ENDPROC(fail)
>=20
> GLOBAL(_end_boot)
>=20
> @@ -830,6 +831,7 @@ ENTRY(switch_ttbr)
>         isb
>=20
>         ret
> +ENDPROC(switch_ttbr)
>=20
> #ifdef CONFIG_EARLY_PRINTK
> /*
> @@ -847,6 +849,7 @@ init_uart:
> #endif
>         PRINT("- UART enabled -\r\n")
>         ret
> +ENDPROC(init_uart)
>=20
> /* Print early debug messages.
>  * x0: Nul-terminated string to print.
> --=20
> 2.32.0
>=20


