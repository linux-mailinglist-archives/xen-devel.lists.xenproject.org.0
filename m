Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8397BC32E
	for <lists+xen-devel@lfdr.de>; Sat,  7 Oct 2023 02:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613856.954680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qouim-0000Ib-5u; Fri, 06 Oct 2023 23:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613856.954680; Fri, 06 Oct 2023 23:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qouim-0000Fn-3D; Fri, 06 Oct 2023 23:59:04 +0000
Received: by outflank-mailman (input) for mailman id 613856;
 Fri, 06 Oct 2023 23:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3TD=FU=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qouik-0000Fc-IK
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 23:59:02 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ee9995e-64a4-11ee-9b0d-b553b5be7939;
 Sat, 07 Oct 2023 01:58:56 +0200 (CEST)
Received: from AS4P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::15)
 by VI1PR08MB10052.eurprd08.prod.outlook.com (2603:10a6:800:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 23:58:48 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d0:cafe::37) by AS4P190CA0024.outlook.office365.com
 (2603:10a6:20b:5d0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Fri, 6 Oct 2023 23:58:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.17 via Frontend Transport; Fri, 6 Oct 2023 23:58:47 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Fri, 06 Oct 2023 23:58:46 +0000
Received: from f58b4441f286.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A44B26ED-7345-4D1F-92F1-BA610456CD14.1; 
 Fri, 06 Oct 2023 23:58:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f58b4441f286.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 06 Oct 2023 23:58:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Fri, 6 Oct
 2023 23:58:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.040; Fri, 6 Oct 2023
 23:58:36 +0000
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
X-Inumbo-ID: 4ee9995e-64a4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk9ukUfAwqaY1S5PssxvM4J0viIgAEzY8L0eArFhfsk=;
 b=L3E+SFyjw79fJal6pMxWzy0rsxkSKSsS+6MwH2gqBmH56xktyU7LY976abUXejMOu0COBpbO77fhM0sPp0GBlhr7GyZxRzCUf1t3YHxzNx2F40obZ/qk5rAHlqzYlnsuHRDPsMnPATKUbkigcUUG0esiJZKyo0kFXNeXnJlAWVA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 51a88817f2d08d81
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgN2dCKF2gXC6AAc5I29Gyb8hNjqkB/Ot0VzMW9QHR+92rEmMwcdylao1PmMJe1ozqgqanK/ZY9mLBl4fXQhl/TZcqDEgC7pZXabZRffeooIq8dHLjJBGzbhDqpkwoDaM6IpbtMjhrhl62jWeDSKrc5hBpLX8InlzFKKrQeeZ7kDb9x2N/ImCKzTVZZ69x+2yT+10368P/7tUXx4XGhDYJFbAIXazbrIdK3L8xM0pu98FZeSc7gANChO+4xDoHFfx7pK3VwXiD3WI70zwJCAV0xX83nVJIqkybuVdcYjjHeesjC7R8ITL154PP2ahBbgiEF/ddMs91pdR1FEOT+mJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk9ukUfAwqaY1S5PssxvM4J0viIgAEzY8L0eArFhfsk=;
 b=U3jjKtXnsz59QmKAlrxkz7avhpsBbuJfIfJVFpz9d3hdSjt7Me5JRoc3V1ZMfxcoRHA5A/gItdKTIurSvyZnz3w07Oj5M3lYphLPR7hYGBdxmFo3/ZIUfLouYb4UsQQrldGdqTe5o8lkWWwKuldbREPNvB1JDM0+FQTxoYHeqyBBASB6lvkVH10ISjv53J+Z8ix9RTZVuYoMSS6Ow+V1qBGWVjGhkSwVVzHPW992SngHmJDj7ZSBX5trnkiBS/Gx6RJu0gKKziHZgbMgvI2CR8I2hdyNtosk5FwBJNBHQaT8KCvk9s8MRB4lHv6VOdWpl3DkCQvLCMDGOAVUYsmJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk9ukUfAwqaY1S5PssxvM4J0viIgAEzY8L0eArFhfsk=;
 b=L3E+SFyjw79fJal6pMxWzy0rsxkSKSsS+6MwH2gqBmH56xktyU7LY976abUXejMOu0COBpbO77fhM0sPp0GBlhr7GyZxRzCUf1t3YHxzNx2F40obZ/qk5rAHlqzYlnsuHRDPsMnPATKUbkigcUUG0esiJZKyo0kFXNeXnJlAWVA=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH for-4.18 v2 1/2] docs/spnix: Switch hypercall-abi.rst to
 named footnotes
Thread-Topic: [PATCH for-4.18 v2 1/2] docs/spnix: Switch hypercall-abi.rst to
 named footnotes
Thread-Index: AQHZ+IaKby48NZZwo0qwoJDsTtN9HrA9cO+A
Date: Fri, 6 Oct 2023 23:58:36 +0000
Message-ID: <4F5006AE-01A7-49CB-B49B-7F1B6BD27BAC@arm.com>
References: <20231006185402.1098400-1-andrew.cooper3@citrix.com>
 <20231006185402.1098400-2-andrew.cooper3@citrix.com>
In-Reply-To: <20231006185402.1098400-2-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PA4PR08MB6032:EE_|AM7EUR03FT027:EE_|VI1PR08MB10052:EE_
X-MS-Office365-Filtering-Correlation-Id: 85f2a10a-19d8-4796-95e9-08dbc6c82e2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K5amFKT3eK2c4b+liOGDCuvNLQY/KysUz5BwJx2TjmXgtZIlXEiffncLfZ/CFrVDcqpSRH5RK9g8oaGtSdY9AUeJlGbgBRs6ZwsNj3UPwUfZ/JEQ/FaUeH0yl+1KPd3Zfa1F2YPzLHONZ89OCgqxHKL3SFkIPBuzucMEpvPlGTy0+yv8vhgmqs1MRAcKl0rq/yXH3NseIwxaCRbKXbls081saiFf50hDQDDH36xk1kK0xD3DrfOvNDd+oB0K+21LsqP1H371Vl4vrRGc/p8+uhmC/3Kuu7ijMpmaIiBZH9wBHaLPIS6IQilFAncGcqiDlWvgjKv1QLni1m9tslmmAVxlb1vbhDYQrJ/4tRF44xTIsYTBSAZK6ZxNRL+AS8q8+5gc9bpwIN98yKsZITnlAmOL/SRILM/IxCxEKckf0ja1v2814l0lf1A/ZNNUY8TtKe701bUuElFfXSDdKjSoPVEFGbXs7IANtz2oj7dViYMnGZvQqpvBtPfMn2GdGtPAStdvSz8s/1vsLx/8fNx1V8iqURcHT7QPZq5k4gntxkqJpLHeW1V47r23W+L9kj8CV8mtoYKH80Zzpzeitxh/v32eGRhXz6lF+cQHSTpTrI1Jf7WS8Mu5WqlXbFzZznMjIX+u8lH6ZFBazq5rEO0nWA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(5660300002)(8936002)(4326008)(86362001)(8676002)(83380400001)(33656002)(2906002)(41300700001)(54906003)(64756008)(316002)(66476007)(6916009)(66446008)(66556008)(91956017)(26005)(36756003)(6512007)(66946007)(76116006)(53546011)(6486002)(6506007)(122000001)(478600001)(38100700002)(38070700005)(2616005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <905EB56FEE693949A75593E9B3B90543@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	039c5ea8-d6e4-491d-891e-08dbc6c82772
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XUjb8mL8ZpnkLZcJZJeAlBZ7rXlJ95k5CZwvtg3h8+YWFENvbM2i53CnzpJeh2Kv086PWO/ghjE8eSYnctgF48iov5UIWYGHH91aXZJKWUSZAuIOo28tlX4j5QEblsHYlimkrDXvqLNRmP7Zac5Yy1+Lusn10atOyVA3Wayjq4zBnSH6nHPmBGr1sLrPSRJf2kWijPzZjPTx0ZbwrlhlhhXAoEDmz8s5xnGCyQdvKJ2IdmygxoN0m2Ze6+7WRZbSxrmTVIi7iHpoaGSBvgINSEFNG8IIFDxio9Xk2IZ06NSo3I/wg+RKrydoV4FW42Yu0uKM6GU0zlR7+WLcd5mCMYJw/HmUaZ0gjcKpJJOgvAm0EXhDmhPPQjVSu4dsMAHVmhLC9vIt6URvngN8ghHtOA8KW2Lr4GEvSWUiRZKWX6Lm+AFBLHiSlucQFG+y0DZuvn7wXekUUtUn5qxBmHTsoM2XgarekPuqSBMirL3/AE3XwNcubRyGlAjYE36/SaKeDT7QbPUXU+Cg6UnpXhlyzucmUfUco45PZk7FpPuoZ07UbxmmnG1PV6uXW8m3JKiK3MuiL92UqUjzMPFx6+ERy+O2giSfumb0xyllZYM8mJEeeu3v3HiR7FuCiXqHVI/n3pPqh63t2AsxLLCRNN4YMOmSlihnljKjes9oz7H4yZga8AhwP4fpwOXuqFXQIMa1FqkFmMUYuE+AniPk7pq+13QpYSKVcc6iDioNVxXpfypXQt8bIJJ8vTmcMaxClOZg
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39850400004)(396003)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(81166007)(356005)(83380400001)(40480700001)(41300700001)(8676002)(36756003)(5660300002)(8936002)(4326008)(6862004)(316002)(54906003)(86362001)(2616005)(33656002)(478600001)(70586007)(70206006)(6486002)(6506007)(26005)(53546011)(336012)(6512007)(82740400003)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 23:58:47.2733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f2a10a-19d8-4796-95e9-08dbc6c82e2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10052

Hi Andrew,

Title typo: s/spnix/sphinx/. Can be fixed on commit.

> On Oct 7, 2023, at 02:54, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> This will simplify inserting a new one in the middle.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> ---
> docs/guest-guide/x86/hypercall-abi.rst | 24 ++++++++++++------------
> 1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/docs/guest-guide/x86/hypercall-abi.rst b/docs/guest-guide/x8=
6/hypercall-abi.rst
> index 14c48929d748..42a820386b68 100644
> --- a/docs/guest-guide/x86/hypercall-abi.rst
> +++ b/docs/guest-guide/x86/hypercall-abi.rst
> @@ -6,7 +6,7 @@ Hypercall ABI
> Hypercalls are system calls to Xen.  Two modes of guest operation are
> supported, and up to 6 individual parameters are supported.
>=20
> -Hypercalls may only be issued by kernel-level software [1]_.
> +Hypercalls may only be issued by kernel-level software [#kern]_.
>=20
> Registers
> ---------
> @@ -33,7 +33,7 @@ The registers used for hypercalls depends on the operat=
ing mode of the guest.
>=20
> 32 and 64bit PV guests have an ABI fixed by their guest type.  The ABI fo=
r an
> HVM guest depends on whether the vCPU is operating in a 64bit segment or =
not
> -[2]_.
> +[#mode]_.
>=20
>=20
> Parameters
> @@ -87,7 +87,7 @@ written by Xen, is mapped with executable permissions s=
o it may be used.
> Multiple hypercall pages may be created by the guest, if it wishes.
>=20
> The stubs are arranged by hypercall index, and start on 32-byte boundarie=
s.
> -To invoke a specific hypercall, ``call`` the relevant stub [3]_:
> +To invoke a specific hypercall, ``call`` the relevant stub [#iret]_:
>=20
> .. code-block:: none
>=20
> @@ -116,14 +116,14 @@ means.
>=20
> .. rubric:: Footnotes
>=20
> -.. [1] For HVM guests, ``HVMOP_guest_request_vm_event`` may be configure=
d to
> -       be usable from userspace, but this behaviour is not default.
> +.. [#kern] For HVM guests, ``HVMOP_guest_request_vm_event`` may be confi=
gured
> +   to be usable from userspace, but this behaviour is not default.
>=20
> -.. [2] While it is possible to use compatibility mode segments in a 64bi=
t
> -       kernel, hypercalls issues from such a mode will be interpreted wi=
th the
> -       32bit ABI.  Such a setup is not expected in production scenarios.
> +.. [#mode] While it is possible to use compatibility mode segments in a =
64bit
> +   kernel, hypercalls issues from such a mode will be interpreted with t=
he
> +   32bit ABI.  Such a setup is not expected in production scenarios.
>=20
> -.. [3] ``HYPERCALL_iret`` is special.  It is only implemented for PV gue=
sts
> -       and takes all its parameters on the stack.  This stub should be
> -       ``jmp``'d to, rather than ``call``'d.  HVM guests have this stub
> -       implemented as ``ud2a`` to prevent accidental use.
> +.. [#iret] ``HYPERCALL_iret`` is special.  It is only implemented for PV
> +   guests and takes all its parameters on the stack.  This stub should b=
e
> +   ``jmp``'d to, rather than ``call``'d.  HVM guests have this stub
> +   implemented as ``ud2a`` to prevent accidental use.
> --=20
> 2.30.2
>=20


