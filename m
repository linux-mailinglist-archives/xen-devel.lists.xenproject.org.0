Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD0B750361
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 11:39:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562115.878688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJWJo-0002uD-GM; Wed, 12 Jul 2023 09:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562115.878688; Wed, 12 Jul 2023 09:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJWJo-0002sG-DN; Wed, 12 Jul 2023 09:39:32 +0000
Received: by outflank-mailman (input) for mailman id 562115;
 Wed, 12 Jul 2023 09:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhes=C6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qJWJm-0002ry-Ik
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 09:39:30 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff9482cb-2097-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 11:39:29 +0200 (CEST)
Received: from DUZPR01CA0275.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::6) by DBBPR08MB6092.eurprd08.prod.outlook.com
 (2603:10a6:10:20e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 09:39:26 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b9:cafe::5e) by DUZPR01CA0275.outlook.office365.com
 (2603:10a6:10:4b9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 09:39:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 09:39:26 +0000
Received: ("Tessian outbound ba2f3d95109c:v145");
 Wed, 12 Jul 2023 09:39:26 +0000
Received: from 70b896db243b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C04A3BE4-E9F3-47DB-961E-834E01234F8C.1; 
 Wed, 12 Jul 2023 09:39:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 70b896db243b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 09:39:13 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10110.eurprd08.prod.outlook.com (2603:10a6:20b:62e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 09:39:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::488c:5182:718d:7759%4]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 09:39:08 +0000
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
X-Inumbo-ID: ff9482cb-2097-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsT6bN6mclgUWAyo5qoKvIOvhbHp1xLY4CgkY0xsxhU=;
 b=70XfeJEl2kKIZ+4y+LaOaCuz6LVnrrcfwShBji3rgT6pFS5/e8HsKaBAT4PeWM9XvZnZQdWw/GsdcKEtwRcN4Pkoj0bPUpSw8GSiVHUuuh1Vn3ewuRa69NfV6YRynKTRcHZOZ/aYEOEv0uFpzik1HvsHuZ0uK5x2xh4YwpcMs6o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d2b15425a6df23ee
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcarSUHn4zv1SDW/B7Vle9YaJO4f8NcwxHrLDrveUN9JXR5tqIaB+qe8jFA3BifKs44ElXwxpVn+bFpyBis1Zjtw+XCm5ujepy5r1qbNAo16ru1OtBpNu20T+sPPGUdAF4F4Fnk1ceVfFmBqbQcW+B30i30do6lcSQM7XuoWtzNotZVfX5aH0kQr17C3DnHXrvlZPHTRIhsQLgWfoKHR688YTi1kkNrSqY5OUXk1bxMPCUnGAKr8buZBsoYLq3rNlQMV+4AxFhdu6cV/g1mKoQ0pOlqmjc+cmd7UazCuLZF8Z42cd9tRiFlYViwwse5qp2axoGWfTcjkBVWurFNmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsT6bN6mclgUWAyo5qoKvIOvhbHp1xLY4CgkY0xsxhU=;
 b=mUYxXFHIFHosX/iE9E460oU9qyMV71+rbeDZGqGSIPA+rYB2OkiZ31XoLgGgEU4RUzqq0j4ZUsxOpF/9oJ67Z7lz65TX5JXJpZi6dZKFzAWTqS2HWBQGmbnTZ3iJegSrHh0YLFSNh7mX0Au23Y/9DLtxaEeXeqandx6EZe2G7nLi09FGjgil1erZVy0AQgkFTxdpQdfHcAoA/INLtR5qaXfk9GWk1yzQdwFfyysQdAUpggI3TqqlScDln+CaH8iAaAThqdnj98x4NUmbSXR6kKYuJsrVN5n6L6QuOUdO5rT0egi9Pt74hDTUqut9oKtNEe+m5/HF1DFlAFBZVDhUsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsT6bN6mclgUWAyo5qoKvIOvhbHp1xLY4CgkY0xsxhU=;
 b=70XfeJEl2kKIZ+4y+LaOaCuz6LVnrrcfwShBji3rgT6pFS5/e8HsKaBAT4PeWM9XvZnZQdWw/GsdcKEtwRcN4Pkoj0bPUpSw8GSiVHUuuh1Vn3ewuRa69NfV6YRynKTRcHZOZ/aYEOEv0uFpzik1HvsHuZ0uK5x2xh4YwpcMs6o=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [XEN PATCH v9 00/24] Xen FF-A mediator
Thread-Topic: [XEN PATCH v9 00/24] Xen FF-A mediator
Thread-Index: AQHZryQNERDOaolIdEep8BfaVs4WwK+16xOA
Date: Wed, 12 Jul 2023 09:39:07 +0000
Message-ID: <480AA225-0590-40BE-BCD5-ADCCB1BC2274@arm.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10110:EE_|DBAEUR03FT049:EE_|DBBPR08MB6092:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecd77e1-cd21-4123-261e-08db82bbe1f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oL1mV+Oa6SQhEnQG8m0bhQxeHGHKfNz3TQhdlk5Fy7/UnbvfWjQDFbjcpeJT99Hc0z8zqPeMR6ZjjBWLRdkaXHA5htmqhX2VsfKJZZKe/8kCuKR2Q5R2LEVyvzP9X+pS3nn+1ZsJolc1uS1yGSiAZ3DLAQuuts4b7pwM12Qta4UfRlmDXHPRfbd3e7U9YYEcRK6AuWCF8wBBoVdy9j3amHPDhXkMIjTbtFo/zEoqTd35ck0El4DFAX12IGMjbqbR7MGAtVxptm2eP2VSy5l0KdWPsxrFyxexgScIsbrdjB7FPTbNS7nYoFtBLuXlyKIHRfvymqHHYddkQGUpW0f87cUyaJcTnlul4Ngj+oY14gXBe/USvHLwGfly/ZKoLiAJ1fogNpumWWs18oTlevlG2axSHKsAlVnxBqHLE98UB+AkPzV/KtwYmlmwXXCTxFPGzqwNi6MtbIT7zVIIuVLGh95QlpWeXcm0f71pUMrfKx6swLQ7nSuwexFba2teXHhKHhm6OsTWHA0/8Yc1gTd1jB4szicmEeertDMKiwNxT1TzuLqKHH+qg8gPB0Q62/8AxGuUfbm0uOuwOce0JQUjK29D9fPlu0G+VLj710OE6OQ9oHwANJcNclAzVDh93N93dP1R5G/C4U1kginUmE37pA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199021)(86362001)(8676002)(8936002)(33656002)(186003)(30864003)(2906002)(2616005)(83380400001)(36756003)(5660300002)(7416002)(53546011)(6506007)(122000001)(54906003)(71200400001)(38100700002)(76116006)(66946007)(64756008)(66446008)(91956017)(66556008)(6486002)(6916009)(4326008)(66476007)(478600001)(38070700005)(41300700001)(316002)(966005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E2F7ED5342D782489833BE1128270FC7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10110
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c108849-de1c-46ed-a939-08db82bbd6eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9t4DUcn3Ute63oI2y6ABAD6cJrNlCGW3p+Gy7wCYlPNBsQQcPh8k/zSHGfbDoGD62jBmsBxfn9oc2719FmqsPCjzB0RewWN1MeANsfaNzCXWrMTurDaivjRHzFnn1qPWZQ0hT5iEpF1Q6SBg+/cA4Fgp9QUhNUyq0DNr1qyRW0OaNescCg4GBZJt09D4R/yn6FCqNUL9tvHrj7dF6wTXAta57JOMPGTpy+w3jxIcgotLprH6Wa0Y8lbGzCOBFpCutQJcaMBkv1HJNiHYdXUMaZBr8VltoN9g0W6sT4hKb7Ssff/kehRFmcm1EwyQujftw2fjdta97K8yrTOA0Ttak3podbeWeL0aSPitTDRZUFS1bHehIZjYYaQnOksEjdE7740cMf3LwrWKymy5OHjkWA3ACOOlz144GcLKys9S9FjDEpOtGfZuoJBrImajtUW61eB2nNpD8b8ry6GhbEbtGNAQXRzcN1o4yTkd4cC1NfFw/WTQJQTuBptyL3bbM1BLqJC/5AEloPqkQPxJV4REtfP7T2TP8ieSg0CMmOU9WcKRCLKGTsmvi7O97HyoOnrV+qLAgrE8KE7kO6cTO+2xM3B0fFsydR/flM1mz/yB0RJUpxgWBTXKUurtBUfg3F31R9gD48RzHixVCwfx7WkEf9AVDEw4CQSsAC5J91+/EP0tdF/QypB+oo6ItsdGh3GpU629i4MdqRAVR4stcuS8soKhQ4gcFBUGxZJaCkVlfRw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(40470700004)(46966006)(36840700001)(70206006)(70586007)(4326008)(36860700001)(40460700003)(478600001)(36756003)(54906003)(40480700001)(86362001)(336012)(26005)(6506007)(53546011)(107886003)(186003)(33656002)(6512007)(966005)(6486002)(47076005)(83380400001)(82310400005)(82740400003)(81166007)(356005)(41300700001)(2616005)(6862004)(8936002)(8676002)(30864003)(316002)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 09:39:26.3070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecd77e1-cd21-4123-261e-08db82bbe1f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6092

Hi Jens,

> On 5 Jul 2023, at 11:34, Jens Wiklander <jens.wiklander@linaro.org> wrote=
:
>=20
> Hi,
>=20
> This patch sets add an FF-A [1] mediator to the TEE mediator framework
> already present in Xen.  The FF-A mediator implements the subset of the
> FF-A 1.1 specification needed to communicate with OP-TEE using FF-A as
> transport mechanism instead of SMC/HVC as with the TEE mediator. It allow=
s
> a similar design in OP-TEE as with the TEE mediator where OP-TEE presents
> one virtual partition of itself to each guest in Xen.
>=20
> The FF-A mediator is generic in the sense it has nothing OP-TEE specific
> except that only the subset needed for OP-TEE is implemented so far. The
> hooks needed to inform OP-TEE that a guest is created or destroyed are pa=
rt
> of the FF-A specification.
>=20
> It should be possible to extend the FF-A mediator to implement a larger
> portion of the FF-A 1.1 specification without breaking with the way OP-TE=
E
> is communicated with here. So it should be possible to support any TEE or
> Secure Partition using FF-A as transport with this mediator.
>=20
> The patches are also available at https://github.com/jenswi-linaro/xen
> branch "xen_ffa_v9".
>=20
> With help from Bertrand I've integrated this in a test setup with OP-TEE.
> Please check prerequisites at
> https://optee.readthedocs.io/en/latest/building/prerequisites.html
>=20
> My setup is duplicated using:
> repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml=
 \
>        -b qemu_xen_ffa
> repo sync -j8
> cd build
> make -j8 toolchains
> make -j8 all
> make run-only
>=20
> Test in dom0 with for instance:
> xtest 1004
>=20
> at the prompt.
>=20
> To start up a domu and connect to it do:
> cd /mnt/host/build/qemu_v8/xen
> xl create guest_ffa.cfg
> xl console domu
>=20
> Then test as usual with "xtest 1004".
>=20
> The setup uses the branch "ffa" from https://github.com/jenswi-linaro/xen=
.
> That's currently the same as the "xen_ffa_v9" branch, but the "ffa" branc=
h
> may change later as I update for a new version of the patch set.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
>=20
> Thanks,
> Jens
>=20
> v8->v9:
> * Patch "xen/arm: ffa: add remaining SMC function IDs"
>  - mention the documentation number used
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> * Patch "xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET"
>  - Adding a reference to the documentation
>  - Renaming FFA_PART_PROP_IS_MASK to FFA_PART_PROP_IS_TYPE_MASK
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> * Patch "xen/arm: ffa: add defines for framework direct request/response =
messages"
>  - add a reference to the documentation
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> * Patch "docs: add Arm FF-A mediator"
>  - Updating the wording as requested.
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>  - Fixing a few typos and adding a reference to the code for a list of
>    limitations
> * Patch "xen/arm: ffa: list current limitations"
>  - Fixing a couple of typos
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>  - Removing an invalid limitation of FFA_RXTX_MAP_*
> * Patch "xen/arm: ffa: add defines for sharing memory"
>  - Fixing a few typos
>  - Adding a reference to the documentation
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>  - Updating FFA_MAX_SHM_PAGE_COUNT to have a safe margin to
>    TEEC_CONFIG_SHAREDMEM_MAX_SIZE
> * Patch "xen/arm: ffa: add direct request support"
>  - Fixing a coding style issue
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>  - Updating the TODO comment about features.
> * Patch "xen/arm: ffa: send guest events to Secure Partitions"
>  - Adding a TODO comment and a limit on the loop in ffa_direct_req_send_v=
m()
> * Patch "xen/arm: ffa: support mapping guest RX/TX buffers"
>  - Change FFA_MAX_RXTX_PAGE_COUNT to 1 with a TODO for a larger value
>  - Replace !p2m_is_ram(t) test with t !=3D p2m_ram_rw
>  - Rename the introduced field tx_is_free to tx_is_free
> * Patch "xen/arm: ffa: support sharing memory"
>  - Fixing read_atomic() issue in get_shm_pages()
>  - Fixing style issue in free_ffa_shm_mem()
>  - Replace !p2m_is_ram(t) test with t !=3D p2m_ram_rw in get_shm_pages()
> * Patch "tools: add Arm FF-A mediator"
>  - Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>  - Adding Acked-by: Anthony PERARD <anthony.perard@citrix.com>
>  - Moving the patch to just before the docs patch.
> * Adding Reviewed-by: Henry Wang <Henry.Wang@arm.com to:
>  - "xen/arm: ffa: enforce dependency on 4k pages"
>  - "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h"
>  - "xen/arm: ffa: add ABI structs for sharing memory"
> * Adding "xen: Introduce arch_domain_teardown()" by Andrew Cooper
> * Adding "xen/arm: add TEE teardown to arch_domain_teardown()"=20
>  based on a patch from Andrew Cooper

It makes it easier for reviewers if you put the changelog per patch
instead of having all of them in the cover letter.

Cheers
Bertrand

>=20
> v7->v8:
> * Adding "xen/arm: ffa: list current limitations" as requested
> * Adding tags to "xen/arm: smccc: add support for SMCCCv1.2 extended
>  input/output registers"
> * Patch "xen/arm: tee: add a primitive FF-A mediator":
>  - Changing license for ffa.h and ffa.c to GPL-2.0-only
>  - Avoiding IS_ENABLED() in the constant FFA_NR_FUNCS
>  - Accepting version 1.1 SPMC only to keep things simple
>  - Removes 32bit and only supports 64bit to keep things simple
> * Patch "tools: add Arm FF-A mediator"
>  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>  - Adding LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE_FFA for the "ffa" value=20
>    in arch_arm.tee
> * Patch "docs: add Arm FF-A mediator"
>  - Fixing a spell error
>  - Moving the patch last in the series
> * Patch "xen/arm: ffa: add remaining SMC function IDs"
>  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>  - Renaming the define FFA_MSG_RUN to FFA_RUN to match the specification
> * Patch "xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET"
>  - Updating the comment describing the flags for FFA_PARTITION_INFO_GET
> * Patch "xen/arm: ffa: add defines for framework direct request/response
>  messages"
>  - Updating the comment describing the flags for MSG_SEND_DIRECT_REQ/RESP
> * Patch "xen/arm: ffa: enforce dependency on 4k pages"
>  - Updating title of patch
>  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> * Patch "xen/arm: ffa: add support for FFA_ID_GET"
>  - In ffa_domain_init(), check that domain_id isn't greater than
>    UINT16_MAX to avoid a future potential integer overflow in get_vm_id()
> * Patch "xen/arm: ffa: add direct request support"
>  - Move preemption (interrupted) parts to a separate patch "xen/arm: ffa:
>    support preemption of SP during direct request"
>  - Remove loop in handle_msg_send_direct_req() to return eventual
>    errors back to the VM instead of the SP.
> * Patch "xen/arm: ffa: map SPMC rx/tx buffers"
>  - Adding a FFA_RXTX_PAGE_COUNT define instead of using 1 directly
> * New patch "xen/arm: ffa: support preemption of SP during direct request=
"
> * Patch "xen/arm: ffa: send guest events to Secure Partitions"
>  - Replacing unsigned int with uint16_t for subscr_vm_created_count and
>    subscr_vm_destroyed_count plus the needed range check to see that
>    they don't overflow.
> * Patch "xen/arm: ffa: support mapping guest RX/TX buffers"
>  - Limit the number of pages in VM RX/TX buffers to 32 using a new
>    FFA_MAX_RXTX_PAGE_COUNT define.
> * Patch "xen/arm: ffa: support guest FFA_PARTITION_INFO_GET"
>  - Renaming tx_is_mine to rx_is_free as requested
>  - Simplified the FFA_PARTITION_INFO_GET_COUNT_FLAG check in
>    handle_partition_info_get()
>  - Adding a comment on ownership of the RX buffer
>  - Adding the patch "xen/arm: ffa: improve lock granularity" to address
>    parts of the locking concerns.
> * Patch "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to reg=
s.h"
>  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> * Patch "xen/arm: ffa: add defines for sharing memory"
>  - Fixing reference for FFA_NORMAL_MEM_REG_ATTR and FFA_MEM_ACC_RW
>  - Updating descirption for FFA_MAX_SHM_PAGE_COUNT
> * Patch "xen/arm: ffa: add ABI structs for sharing memory"
>  - Changing name of the "global_handle" memeber in struct
>    ffa_mem_transaction_* to "handle".
> * Patch "xen/arm: ffa: support sharing memory"
>  - Use FFA_MEM_SHARE_64 only since we changed to only suporting ARM_64.
>  - Rename struct ffa_mem_transaction_x to struct ffa_mem_transaction_int
>    as requested.
>  - Adding a check that shm->page_count isn't 0 before calling share_shm()
>  - Masking return value from FFA_MEM_FRAG_RX to avoid an implic cast to
>    the int32_t returned by ffa_mem_share().
> * Patch "xen/arm: ffa: add support to reclaim shared memory"
>  - Adding Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> * Patch "xen/arm: ffa: support sharing large memory ranges"
>  - Adding commetns for struct ffa_ctx
>  - Cleaning up and removing the fragmentation state if handle_mem_frag_tx=
()
>    detects an error.
> * Adding "xen/arm: ffa: improve lock granularity" to address some of the
>  locking concerns.
>=20
> v6->v7:
> * Split some of the larger patches into smaller patches for easier review=
.
>  For instance, the v6 patch "xen/arm: add a primitive FF-A mediator" has
>  been replaced with:
>  - "xen/arm: add a primitive FF-A mediator"
>  - "tools: add Arm FF-A mediator"
>  - "docs: add Arm FF-A mediator"
>  - "xen/arm: ffa: add remaining SMC function IDs"
> * Some small fixes in the error path for handle_mem_share()
> * Switched to SPDX for license in new files.
> * Fixed comment style issues in
>  "xen/arm: smccc: add support for SMCCCv1.2 extended input/output registe=
rs"
> * Made FFA support UNSUPPORTED in "xen/arm: add a primitive FF-A mediator=
"
> * Replaced ffa_get_call_count() with FFA_NR_FUNCS
> * Update the FFA_MAX_SHM_PAGE_COUNT with a formula instead of a value.
> * Replaced XEN_ARM_FLAGS_FFA with XEN_DOMCTL_CONFIG_TEE_FFA to minimize i=
mpact
>  on struct xen_arch_domainconfig. This works because the FF-A mediator an=
d
>  the OP-TEE mediator will not be used at the same time in by a guest.
> * Replaced "ffa" boolean in the guest config with a new "ffa" value to th=
e
>  enumeration "tee_type".
> * Integrated the FF-A mediator in the TEE mediator framework instead of
>  being its own.
> * Rebased on staging as of 2023-02-16
>=20
> v5->v6:
> * Updated "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to r=
egs.h"
>  commit message and moved the patch right before the patch which needs it=
.
>  Applied Michal Orzel's R-B tag.
> * Renamed the guest configuration option "ffa_enabled" to "ffa" and
>  updated the description.
> * More tools update in "xen/arm: add a primitive FF-A mediator" with the =
"ffa"
>  option, including golang and ocaml.
> * Update ffa_domain_init() to return an error if communication with
>  the SPMC can't be established.
> * Factored out a ffa_domain_destroy() from ffa_relinquish_resources().
> * Added ffa_get_call_count() to give an accurate number of FF-A function,
>  updated in each patch as new FF-A functions are added.
> * Added a flags field in struct xen_arch_domainconfig that replaces the
>  ffa_enabled field.
> * Made check_mandatory_feature() __init
> * Replaced a few printk() calls with gprintk() where needed.
> * Rebased on staging as of 2022-09-14
>=20
> V4->v5:
> * Added "xen/arm: move regpair_to_uint64() and uint64_to_regpair() to reg=
s.h"
> * Added documentation for the "ffa_enabled" guest config flag
> * Changed to GPL license for xen/arch/arm/ffa.c
> * Added __read_mostly and const where applicable
> * Added more describing comments in the code
> * Moved list of shared memory object ("ffa_mem_list") into the guest cont=
ext
>  as they are guest specific
> * Simplified a few of the simple wrapper functions for SMC to SPMC
> * Added a BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE) since the mediator
>  currently depends on the page size to be same as FFA_PAGE_SIZE (4k).
> * Added max number of shared memory object per guest and max number of
>  size of each shared memory object
> * Added helper macros to calculate offsets of different FF-A data structu=
res
>  in the communication buffer instead of relying on pointer arithmetic
> * Addressed style issues and other comments
> * Broke the commit "xen/arm: add FF-A mediator" into multiple parts, tryi=
ng
>  to add a few features at a time as requested
> * Added a missing call to rxtx_unmap() in ffa_relinquish_resources()
> * Assignment of "ffa_enabled" is kept as is until I have something defini=
tive
>  on the type etc.
> * Tested with CONFIG_DEBUG=3Dy
>=20
> v3->v4:
> * Missed v3 and sent a v4 instead by mistake.
>=20
> v2->v3:
> * Generates offsets into struct arm_smccc_1_2_regs with asm-offsets.c in
>  order to avoid hard coded offsets in the assembly function
>  arm_smccc_1_2_smc()
> * Adds an entry in SUPPORT.md on the FF-A status
> * Adds a configuration variable "ffa_enabled" to tell if FF-A should be
>  enabled for a particular domu guest
> * Moves the ffa_frag_list for fragmented memory share requests into
>  struct ffa_ctx instead to keep it per guest in order to avoid mixups
>  and simplify locking
> * Adds a spinlock to struct ffa_ctx for per guest locking
> * Addressing style issues and suggestions
> * Uses FFA_FEATURES to check that all the needed features are available
>  before initializing the mediator
> * Rebased on staging as of 2022-06-20
>=20
> v1->v2:
> * Rebased on staging to resolve some merge conflicts as requested
>=20
> Andrew Cooper (1):
>  xen: Introduce arch_domain_teardown()
>=20
> Jens Wiklander (23):
>  xen/arm: add TEE teardown to arch_domain_teardown()
>  xen/arm: smccc: add support for SMCCCv1.2 extended input/output
>    registers
>  xen/arm: tee: add a primitive FF-A mediator
>  xen/arm: ffa: add remaining SMC function IDs
>  xen/arm: ffa: add flags for FFA_PARTITION_INFO_GET
>  xen/arm: ffa: add defines for framework direct request/response
>    messages
>  xen/arm: ffa: enforce dependency on 4k pages
>  xen/arm: ffa: add support for FFA_ID_GET
>  xen/arm: ffa: add direct request support
>  xen/arm: ffa: map SPMC rx/tx buffers
>  xen/arm: ffa: send guest events to Secure Partitions
>  xen/arm: ffa: support mapping guest RX/TX buffers
>  xen/arm: ffa: support guest FFA_PARTITION_INFO_GET
>  xen/arm: move regpair_to_uint64() and uint64_to_regpair() to regs.h
>  xen/arm: ffa: add defines for sharing memory
>  xen/arm: ffa: add ABI structs for sharing memory
>  xen/arm: ffa: support sharing memory
>  xen/arm: ffa: add support to reclaim shared memory
>  xen/arm: ffa: support sharing large memory ranges
>  xen/arm: ffa: improve lock granularity
>  xen/arm: ffa: list current limitations
>  tools: add Arm FF-A mediator
>  docs: add Arm FF-A mediator
>=20
> SUPPORT.md                         |    9 +
> docs/man/xl.cfg.5.pod.in           |   15 +
> tools/include/libxl.h              |    5 +
> tools/libs/light/libxl_arm.c       |    3 +
> tools/libs/light/libxl_types.idl   |    3 +-
> xen/arch/arm/arm64/asm-offsets.c   |    9 +
> xen/arch/arm/arm64/smc.S           |   42 +
> xen/arch/arm/domain.c              |   41 +
> xen/arch/arm/include/asm/psci.h    |    4 +
> xen/arch/arm/include/asm/regs.h    |   12 +
> xen/arch/arm/include/asm/smccc.h   |   40 +
> xen/arch/arm/include/asm/tee/ffa.h |   35 +
> xen/arch/arm/include/asm/tee/tee.h |    7 +
> xen/arch/arm/tee/Kconfig           |   11 +
> xen/arch/arm/tee/Makefile          |    1 +
> xen/arch/arm/tee/ffa.c             | 1988 ++++++++++++++++++++++++++++
> xen/arch/arm/tee/optee.c           |   11 +-
> xen/arch/arm/tee/tee.c             |    8 +
> xen/arch/arm/vsmc.c                |   19 +-
> xen/arch/x86/domain.c              |    5 +
> xen/common/domain.c                |    6 +
> xen/include/public/arch-arm.h      |    1 +
> xen/include/xen/domain.h           |    1 +
> xen/include/xen/sched.h            |    1 +
> 24 files changed, 2264 insertions(+), 13 deletions(-)
> create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
> create mode 100644 xen/arch/arm/tee/ffa.c
>=20
> --=20
> 2.34.1
>=20


