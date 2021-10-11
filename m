Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43124293DD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 17:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206287.361822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxeI-0007ob-J7; Mon, 11 Oct 2021 15:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206287.361822; Mon, 11 Oct 2021 15:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZxeI-0007mg-Fa; Mon, 11 Oct 2021 15:55:34 +0000
Received: by outflank-mailman (input) for mailman id 206287;
 Mon, 11 Oct 2021 15:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mZxeH-0007mY-Fg
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 15:55:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.61]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71581beb-edc9-4671-884b-0dd0b57d88db;
 Mon, 11 Oct 2021 15:55:30 +0000 (UTC)
Received: from DB6PR0301CA0069.eurprd03.prod.outlook.com (2603:10a6:6:30::16)
 by VI1PR08MB2942.eurprd08.prod.outlook.com (2603:10a6:802:20::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 11 Oct
 2021 15:55:19 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::f6) by DB6PR0301CA0069.outlook.office365.com
 (2603:10a6:6:30::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 15:55:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 15:55:19 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Mon, 11 Oct 2021 15:55:19 +0000
Received: from 94ba99320258.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B1DA395-307E-4BA3-AA97-144A5D09E5FD.1; 
 Mon, 11 Oct 2021 15:55:09 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94ba99320258.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 15:55:09 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6941.eurprd08.prod.outlook.com (2603:10a6:102:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 15:55:07 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 15:55:07 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Mon, 11 Oct 2021 15:55:06 +0000
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
X-Inumbo-ID: 71581beb-edc9-4671-884b-0dd0b57d88db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrdISgWU1TXTXhiTb6iQpelua/sSvu1oNckl8E8JWC4=;
 b=G12ZE7GuZE72tNVd+/ivY0ayWhTCVpCDO2KikAyWq5cVGHR8vVANDU1XDMiYg9P1H68FcTniCqgbGKvgBR1wqa4PX4kXQr2rVCOOXfsWJDP7iZpb5bGRo2AM045QMM3Sk7rJawyUl0DkMm+ih7srMdV504oHIiZg04VLavuEwpA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc9f24d5ce076af6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1A8+yPdYaTMnCBS7UOnLBXKFJ5fOLfH1fJ4xwwoUw4CTF2te/pfVq1ozq4Jn2++FWR3oIZHFyGsyXG639eC8S++Mb/n7EfF3p6CthS0CBTmywAESpWjNq7YmVTR5p1GYh+fLtv4i/FmXo1Mesxf2/c/uxbwC5dwY6LLaalKBRxVj7RvytTMNlJnxbJ9dUuZhbosbQfyCBySR0Lad7XI7gjfMx1KCBPI5FqslaSP4MeH6NBZ5BECnpr6h8/YdugPVjKb0vHrRNzNrFNR84KvY8Of2nMtFwzpv4JjEoNpnaFmngWOzICY3iYRk3M3XHGw0KktLNRCc7L2OgF0uNuyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrdISgWU1TXTXhiTb6iQpelua/sSvu1oNckl8E8JWC4=;
 b=kKViQaT65/UgPWnZgT2Q48JB4MAft603iy4m+9hOO/kKRw16eyEM3S15ymxyaLWYPD9ZCdVvTZvHkmwHnIOjc/QMw+73xhJempobgqAe8wEXbRxZ/IkfUP5wj4GfH6eWgeJzMbqe8bgeC31fIv4KjuVCuQtYEZKL09LYK+jcmu/pLNaJu9uQdxs6AxPuHJU7Uz0OcyJSfD3zth200gtt/EcQGlZcN6kFAFNdWn2M07+GGWfVaR5H3nyp+CxTvfpoSu+cHqLOWCnvgR5HwZ6ONH5GBet4biHM/pCN+AaUN7lhzc8JOMRX5hueBE74Na/L+4rZgx5UNPmeUxFkiG+kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrdISgWU1TXTXhiTb6iQpelua/sSvu1oNckl8E8JWC4=;
 b=G12ZE7GuZE72tNVd+/ivY0ayWhTCVpCDO2KikAyWq5cVGHR8vVANDU1XDMiYg9P1H68FcTniCqgbGKvgBR1wqa4PX4kXQr2rVCOOXfsWJDP7iZpb5bGRo2AM045QMM3Sk7rJawyUl0DkMm+ih7srMdV504oHIiZg04VLavuEwpA=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <bfe9cb38-7b06-2d99-2e4a-b5025f4c1ab0@xen.org>
Date: Mon, 11 Oct 2021 16:55:03 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BD1BB549-7146-4062-926D-BA633ADF0006@arm.com>
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
 <81e30575-d823-830b-6f80-4e7a7fb4f9ff@xen.org>
 <BC2506EC-8BCD-487C-AFF4-0C99A9020BDA@arm.com>
 <bfe9cb38-7b06-2d99-2e4a-b5025f4c1ab0@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0474.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::11) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e42acbc1-cf90-4841-d974-08d98ccf8673
X-MS-TrafficTypeDiagnostic: PAXPR08MB6941:|VI1PR08MB2942:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB29420469ABE48B633AE91319E4B59@VI1PR08MB2942.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0fa1L3R5VhEdTUSrZvVm7BjV2BC87kVdFfDCUWhjAQoQPc5sjr6eL5Xvuef9V7lsv5deluFunPvITL4BRKnmNSzXDpRSUTNQAkrV6RZLMV8mn2X8EVS+V4FOGFubFopmlhfT1VIMU2iJcVjxmS4JqEMyeqsO5V6Lo/Us4Z9/fNf/qRpkoOhk/0KPwss3j+xDFohYXca/VlAmfoNZFgC+BgiijaWt+3Ir31dZIjHz3ibTgVCAMNUAoydnk8xPdK70PKs+mOwG1mtFfDvQBY121qfcQVt2KDJ+a36YEn8sFm9Nx1rbQzp6e57cIzqJEUuijsnNrCucg5nt9BgfjhAHS0WacsqPemgHfUP3Dx7QNbakDtVrBFJ1jHBdvCKXXjTBnYaypL2rBJ6+Obf2FAnNb5RUkwx1LEUUNuduX97pR+S2S13s4QQ9rTNl9kt7jWMlBFoCxgeIYRxsadLrSb4KlhZhw7u6fYKV5ODXHbknGiRk2rAAxIcv6tS+IbOnpGTDoHh7SRUZCzwto8gIaQqy4TxWmKEQBUH7GYMRkmU8INhh5tyqJ/5ylEV2eOfI6vU6CHueGPb67wYtbUw+W9ISJN7O5MHntI8dbNy9lyk8V5cO85qf0B7I1lXpIQ0yhteldyTFu5S8qXl51gTmAZRuVz1CjPVjw9CHkan5DU4F/ANxcuoNmvSMCKQBY6Jru3rMhvmtijBa3My0AWBgYNCFRRKe47AfLGmgAlXZYxlb39xFXU6T59mnLM5KYQm1keKR
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(44832011)(6486002)(6506007)(66556008)(66476007)(66946007)(8676002)(86362001)(8936002)(52116002)(36756003)(508600001)(6916009)(54906003)(26005)(6666004)(316002)(956004)(6512007)(33656002)(4326008)(2906002)(186003)(38350700002)(38100700002)(5660300002)(2616005)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6941
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75656bf3-7cc0-4482-c103-08d98ccf7f4a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Eic8cJhvQu0toFcfuPXWpUs6QoYKLMUW6/ugnM2sCz607ziS4x+mIp6De9yIVzk+1funuDzvF9LEzRGJ9VGlMShUcYGA/3cEHPwJJO4KCk6k8nq+/Mrt3b42LFXkxuCYpL8G/ARjzFIOS0dnJ7axUzFpV8Pj6tG0/5bxigGxu7xVoMGhG0gkaAADWweK0yDnwmrD3AwgCfon0WbiQMwt3z3W54y8whdWCEvbewY5bq47sUGORHf464f9ePSy+gWAj7sz1LLf0SP3ETEFdG9svcVVwI+ZuTL94HSam6fv2n/kU1W3erfp0H5bniBAShWP3A1K4Q+Xm5OClH3NGsh/WdydrL042wXJ1QhPyRxmwzNin2vnfGfhLBXAZcZ4x9Oe6u1urznZfx/1xYUoh6bmL9lwJvhdRMvKMYNG+HtBpo6tgfu0GYIDqFdF/7t422eX8bf2aWtDte7W56CQ9S5UHJUI82c4rs5xDlYYgT8C/CM0WGLS2pUqFvu46oA2o0OI4MqoVXTsQ8th6p297BfOOgvYb02V9CKPsmpSmaKl5RmLCLzSAoOse0IBzPwDfDl/FmevQwR7npxdzUx06ZpMJ0Wzg4sCvXIqFnwEuJW5ht++GfyPeDvQcpAjxh5A6TEmJ/OqmI6unRarQT0AHz37FCXIBKHlsZveY+Odh4mjm0gL2tthgPV6AN51GEmBZTfb4WQm3/L7KghxctzVWOXuMepBB+gkYGDtuwYmecsWBeg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(82310400003)(4326008)(6486002)(6666004)(33656002)(508600001)(186003)(86362001)(44832011)(47076005)(2616005)(53546011)(956004)(70206006)(6862004)(5660300002)(70586007)(54906003)(356005)(36756003)(336012)(81166007)(6506007)(316002)(2906002)(26005)(8676002)(6512007)(8936002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 15:55:19.1424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e42acbc1-cf90-4841-d974-08d98ccf8673
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2942



> On 11 Oct 2021, at 12:32, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 11/10/2021 12:23, Luca Fancellu wrote:
>>> On 11 Oct 2021, at 10:39, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Luca,
>>>=20
>> Hi Julien,
>>> On 11/10/2021 09:03, Luca Fancellu wrote:
>>>> +static bool __init is_boot_module(int dt_module_offset)
>>>> +{
>>>> +    if ( (fdt_node_check_compatible(fdt, dt_module_offset,
>>>> +                                    "multiboot,kernel") =3D=3D 0) ||
>>>> +         (fdt_node_check_compatible(fdt, dt_module_offset,
>>>> +                                    "multiboot,ramdisk") =3D=3D 0) ||
>>>> +         (fdt_node_check_compatible(fdt, dt_module_offset,
>>>> +                                    "multiboot,device-tree") =3D=3D 0=
) )
>>>> +        return true;
>>>=20
>>> A boot module *must* have the compatible "multiboot,module". I would pr=
efer if we simply check that "multiboot,module" is present.
>>>=20
>>> This will also make easier to add new boot module in the future.
>> I thought that also the XSM policy was a multiboot,module so I checked e=
xplicitly for kernel, ramdisk, device-tree that are supported
>> by domU.
>=20
> The XSM policy is indeed a multiboot module and should not be used by the=
 domU.
>=20
>> Do you still think that I should check just for multiboot,module instead=
?
>=20
> Yes please. I think this is not the EFI stub job to check that the most s=
pecific compatible is correct.

Ok, I will push the v6 with this change.

Cheers,
Luca

>=20
> Cheers,
>=20
> --=20
> Julien Grall


