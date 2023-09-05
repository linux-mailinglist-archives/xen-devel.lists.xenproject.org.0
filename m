Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D34C7792355
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 16:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595719.929316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdWlD-0006nN-9C; Tue, 05 Sep 2023 14:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595719.929316; Tue, 05 Sep 2023 14:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdWlD-0006kc-4o; Tue, 05 Sep 2023 14:10:31 +0000
Received: by outflank-mailman (input) for mailman id 595719;
 Tue, 05 Sep 2023 14:10:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yb0f=EV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdWlA-0006kW-Rw
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 14:10:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f52cdfb2-4bf5-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 16:10:25 +0200 (CEST)
Received: from AS9PR01CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::28) by DBBPR08MB5945.eurprd08.prod.outlook.com
 (2603:10a6:10:1f7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:10:20 +0000
Received: from AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:540:cafe::75) by AS9PR01CA0015.outlook.office365.com
 (2603:10a6:20b:540::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 14:10:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT049.mail.protection.outlook.com (100.127.140.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 14:10:19 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Tue, 05 Sep 2023 14:10:18 +0000
Received: from ca22b360d433.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5788060F-EA19-4CD9-AB8A-970025261448.1; 
 Tue, 05 Sep 2023 14:10:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca22b360d433.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Sep 2023 14:10:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAVPR08MB9699.eurprd08.prod.outlook.com (2603:10a6:102:31e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 14:10:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 14:10:08 +0000
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
X-Inumbo-ID: f52cdfb2-4bf5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N7pg+g1BSB2/vvGwziM5rcMpVriXsJzZIVhXkBgxFQ=;
 b=qO3QiXtZHC2r+2LqQFwXdrquNURWv9bLrlvXv+GOx8nSrdoqrH6A6EC1AHLZggXm2LMtpUhnc9VVZgSoo8vB7P9yaCdIHixefr6qwyEbZbvowBBX50nZuJnxbPzG/nx3TBlG19WaqqiRBujN1IffN8/ew3gjJ1eR8/HWfpAa9d8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f53a287cf76ee9d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6G3dg4aw1lbkP+K79CTqm0sPURaZj8m031/XYbBqFwzyL8b2RgCOvuTpU+jYNVps5aQ+jDK6+jO82hbtF/5l8hYBJpjiomPJAwz91B+cYZMam5netMPn4Btv8BwsG/UTpIKaI90UxmHd8BbN0iDJcHHV+4IqId4noIYFMrCzV0efGZQ+89RJph4D/c5PT7EGjYunOlPBhBSr3zA3fnLlc4T8DmrN2PpqE33Y5sT04s6cssK2/QsMvokScfzxh9gPlWaySEdqRQeHi8pEGUjVgtN4G7G+iWCedtOTI1u0AeGpvdB19EmKZzVaQoPQWG4eAuczn/6HImzR3rgRDKdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+N7pg+g1BSB2/vvGwziM5rcMpVriXsJzZIVhXkBgxFQ=;
 b=DAhEt1DyoWpoQkxzGuK65V+VIFapM+5AfmRbN5nn9K4b8rqbNBwlmlSq3ejdT8cFxYYjadOeifL4W1przUsftb2U5ELHrJIzrkGXz0GgEBM7tQRhtkWeovBHkTXXiykqDdz6KhD2v1Atw8BedgZVvFUx4mIKToLuuNC8QcF8mFQN0eFtY8AQa2Fztl3bbMoVw+dBtV24ttMqE5hguXX7i2IjMBK+1aiJNuWFY1d6dyaS+WxOJdXZxUIYIzXHst+JnjuOC00uYcI0cA7VbW//3dRKs+Wns7QO5KZjbLrCPNgU1i4TAixqQowrrVcylPToO38MDu/ABFX4XaDtBnrFGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+N7pg+g1BSB2/vvGwziM5rcMpVriXsJzZIVhXkBgxFQ=;
 b=qO3QiXtZHC2r+2LqQFwXdrquNURWv9bLrlvXv+GOx8nSrdoqrH6A6EC1AHLZggXm2LMtpUhnc9VVZgSoo8vB7P9yaCdIHixefr6qwyEbZbvowBBX50nZuJnxbPzG/nx3TBlG19WaqqiRBujN1IffN8/ew3gjJ1eR8/HWfpAa9d8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii <oleksii.kurochko@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Thread-Topic: [PATCH v4 1/2] xen: asm-generic support
Thread-Index: AQHZ3O2/QR3JeW3CfU20DuxQPAN2rLAKsJgAgAGRsYCAAAklgA==
Date: Tue, 5 Sep 2023 14:10:08 +0000
Message-ID: <048CB17B-A139-4552-A51A-5696B019507B@arm.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
 <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
 <e2b6ee2ecae5512a23a3e33bba0083b90a1c8831.camel@gmail.com>
In-Reply-To: <e2b6ee2ecae5512a23a3e33bba0083b90a1c8831.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAVPR08MB9699:EE_|AM7EUR03FT049:EE_|DBBPR08MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: b9215422-0372-4bc9-62d1-08dbae19d645
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lrkdOY/b/Bh3tgSE2xO7UNEXeJpgNd1xlQg10IX6aS93ExgVN15/VfOfISnnmd6k8epxdj336PRjGq2N2iraHmP6hz549v8lCaIfxDKHdUi4wTRsBkCsjiMWKMgR4KXErkNxKJv+RB1X/oEEy9X7DJ5vCtMzYewClosuZsPds3n8kG8WhS7rYnzNfdj4STxR/4iQJYrrMMsFTJUp7BSYcrvId2W8akFAXvMNa2XmFuGCT3bWTBm8GAEJ4J8NJm+camEMeFEtwSNEFXrozC651T/c7g95+9oU19RG2K1qP0l2X7Q2AoTW4BvsiFM+OQQpCICi1fwGPXgVIz1s/kINooXag1+PGeLxD7a59nCWfSAmR+ofkuodyEv+xKZ85y+8c9q+F/fS3KQC525xuPu3fEf9vBkECtMYHHj5SPGueA1H99fOsxqqgY9/vU9OnDBxisfLS9sgKmS06e1+XnZh/hUuPt5M5YgrHmX7bcLtQ5I5hmU2ric3xI9HREYu8dn/4Ygtfq0KViBFntmJX0hC6iXdFfajqLhXqcuwhASQbsuQZWDw0zOGrFh/IAiny6LxeuhBWJlD+lL80shdQwHCz9j0IUUIy/WAE3FzOvRgqrwfYivq7JA5VieBEapPVAVcWJbdmfRpYxV7bqJmtDjeVpOADzeprB+F1Gy9CuAnaXg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(39860400002)(366004)(346002)(451199024)(1800799009)(186009)(2616005)(8936002)(316002)(64756008)(54906003)(6916009)(8676002)(4326008)(66946007)(66556008)(66476007)(66446008)(76116006)(122000001)(6486002)(6506007)(53546011)(6512007)(41300700001)(5660300002)(83380400001)(7416002)(26005)(91956017)(478600001)(71200400001)(2906002)(86362001)(36756003)(38100700002)(38070700005)(33656002)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8FFDE81F97BB4B4CAAF6BC82FD2AD29E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9699
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1f40cee-1437-4260-784e-08dbae19cfa2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ru5/rtwY5Uv1CHDsWvytaGPKyl9f0I8hHRAD4IbRHGhLcR+qLph6Z/1Wm4E/cKcfQdTJuEIIVxSs8FJcLER/lZWQYSPSu39CRYlniKSk/tYlhnrMSpNXX0vGtGcJCMMmQtT4MTDEqTEgbghlVlvudZaVx8+UYcr1GwrptaHnCznVm7wGkFQWv89EwYDXL2ydXR8/vf8Oz4U2FL8Mg630S6jwQrW1AWa+mcLBi38/3Unw9IdYC2uMV9hiM49RVpTWu071+QX0dFF0pWIsVC6b7FKD0sgDpxgkjF3cdkaVrKaTtuJnX5jbeMNcDH5BCQ2kCpHi8xbdO4E8FFsea6jAYnMZ9uUkihama/0jbvwoFA3483SUpPWGN1nYwIzhYreHH9b+cxr9v50dUWfM3rfv/HLn4cEwsxlMnx5cAPglfT9CGP2MsliMJ582yFhrhYO5gRHBrFP1NO4/+kDva193Cbo36QLLv7rUhZR437NOp+M11JEVtEc3XAAC3kobLi6kBqJtB8SiEo6CfgFLTAmEo3Cbg5jYDqCUTzUKhcNYSasLVxqON4hDo8eUAMI29L8tiI8VBhELdKtTGMyJb36SeU8qm7mpZnqajSV15WLtNA6UFf2FD3aJdjIdoU+zJBv41t2FjBB7Jqq6OmBaDK77TkKgwo/Eegg0qiOeZiX5FE8xx6/nRFSycbpt/yCgYsTV3Vy+KZwZqF8rlE85JxAXBLbV9+0YN5Owal+rY7MuYeeJc5qiyWLCpzjvfGqz+lOpr1XbM3x9dBDWphOMJOGelQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(70586007)(53546011)(70206006)(54906003)(40480700001)(6486002)(6506007)(316002)(41300700001)(6512007)(478600001)(6862004)(4326008)(8676002)(40460700003)(2616005)(107886003)(26005)(5660300002)(36756003)(36860700001)(33656002)(82740400003)(356005)(81166007)(336012)(2906002)(8936002)(47076005)(86362001)(83380400001)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 14:10:19.4406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9215422-0372-4bc9-62d1-08dbae19d645
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5945

Hi Oleksii,

> On 5 Sep 2023, at 15:37, Oleksii <oleksii.kurochko@gmail.com> wrote:
>=20
> Hi Bertrand,
>=20
> On Mon, 2023-09-04 at 13:39 +0000, Bertrand Marquis wrote:
>> Hi Oleksii,
>>=20
>>> On 1 Sep 2023, at 18:02, Oleksii Kurochko
>>> <oleksii.kurochko@gmail.com> wrote:
>>>=20
>>> Some headers are shared between individual architectures or are
>>> empty.
>>> To avoid duplication of these headers, asm-generic is introduced.
>>>=20
>>> With the following patch, an architecture uses generic headers
>>> mentioned in the file arch/$(ARCH)/include/asm/Kbuild.
>>=20
>> Kbuild refers to "Kernel build" I guess.
>> I am ok to keep that name to keep things simpler when compared to
>> Linux scripts but it would be good to mention that in the commit
>> message for future reference.
> Sure. I'll add that Kbuild refers to "Kernel build"
>>=20
>>>=20
>>> To use a generic header is needed to add to
>>> arch/$(ARCH)/include/asm/Kbuild :
>>>        generic-y +=3D <name-of-header-file.h>
>>>=20
>>> For each mentioned header in arch/$(ARCH)/include/asm/Kbuild,
>>> kbuild will generate the necessary wrapper in
>>> arch/$(ARCH)/include/generated/asm.
>>>=20
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V4:
>>> - introduce asm-generic support
>>> - update commit message
>>> ---
>>> Changes in V3:
>>> - Rename stubs dir to asm-generic
>>> ---
>>> Changes in V2:
>>> - Nothing changed.
>>> ---
>>> xen/Makefile                      | 10 +++++++++-
>>> xen/arch/arm/include/asm/Kbuild   |  1 +
>>> xen/arch/ppc/include/asm/Kbuild   |  1 +
>>> xen/arch/riscv/include/asm/Kbuild |  1 +
>>> xen/arch/x86/include/asm/Kbuild   |  1 +
>>> xen/scripts/Makefile.asm-generic  | 23 +++++++++++++++++++++++
>>> 6 files changed, 36 insertions(+), 1 deletion(-)
>>> create mode 100644 xen/arch/arm/include/asm/Kbuild
>>> create mode 100644 xen/arch/ppc/include/asm/Kbuild
>>> create mode 100644 xen/arch/riscv/include/asm/Kbuild
>>> create mode 100644 xen/arch/x86/include/asm/Kbuild
>>> create mode 100644 xen/scripts/Makefile.asm-generic
>>>=20
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index f57e5a596c..698d6ddeb8 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -438,6 +438,7 @@ ifdef building_out_of_srctree
>>> endif
>>> CFLAGS +=3D -I$(srctree)/include
>>> CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include
>>> +CFLAGS +=3D -I$(srctree)/arch/$(SRCARCH)/include/generated
>>=20
>> Why are we generating files in the source tree ?=20
>> Shouldn't we keep it unmodified ?
> I think you are right.
> I got myself confused because I do not use out-of-tree compilation so
> for me it looked like $(srctree).
>=20
> It would be better to use $(objtree) instead.

Ack

>>=20
>>>=20
>>> # Note that link order matters!
>>> ALL_OBJS-y                :=3D common/built_in.o
>>> @@ -580,6 +581,7 @@ _clean:
>>> rm -f $(TARGET).efi $(TARGET).efi.map $(TARGET).efi.elf
>>> $(TARGET).efi.stripped
>>> rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
>>> rm -f .banner .allconfig.tmp include/xen/compile.h
>>> + rm -rf arch/*/include/generated
>>>=20
>>=20
>> You must use the same as for CFLAGS here so $(srctree) would be
>> needed.
>> (or something else depending on the fix for previous comment)
> Thanks. I'll change to the value mentioned in CFLAGS.
>=20
>>=20
>>> .PHONY: _distclean
>>> _distclean: clean
>>> @@ -589,7 +591,7 @@ $(TARGET).gz: $(TARGET)
>>> gzip -n -f -9 < $< > $@.new
>>> mv $@.new $@
>>>=20
>>> -$(TARGET): outputmakefile FORCE
>>> +$(TARGET): outputmakefile asm-generic FORCE
>>> $(Q)$(MAKE) $(build)=3Dtools
>>> $(Q)$(MAKE) $(build)=3D. include/xen/compile.h
>>> $(Q)$(MAKE) $(build)=3Dinclude all
>>> @@ -667,6 +669,12 @@ endif # need-sub-make
>>> PHONY +=3D FORCE
>>> FORCE:
>>>=20
>>> +# Support for using generic headers in asm-generic
>>> +PHONY +=3D asm-generic
>>> +asm-generic:
>>> + $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.asm-generic \
>>> +            obj=3Darch/$(SRCARCH)/include/generated/asm
>>> +
>>> # Declare the contents of the PHONY variable as phony.  We keep
>>> that
>>> # information in a variable so we can use it in if_changed and
>>> friends.
>>> .PHONY: $(PHONY)
>>> diff --git a/xen/arch/arm/include/asm/Kbuild
>>> b/xen/arch/arm/include/asm/Kbuild
>>> new file mode 100644
>>> index 0000000000..a4e40e534e
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/Kbuild
>>> @@ -0,0 +1 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> diff --git a/xen/arch/ppc/include/asm/Kbuild
>>> b/xen/arch/ppc/include/asm/Kbuild
>>> new file mode 100644
>>> index 0000000000..a4e40e534e
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/include/asm/Kbuild
>>> @@ -0,0 +1 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> diff --git a/xen/arch/riscv/include/asm/Kbuild
>>> b/xen/arch/riscv/include/asm/Kbuild
>>> new file mode 100644
>>> index 0000000000..a4e40e534e
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/include/asm/Kbuild
>>> @@ -0,0 +1 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> diff --git a/xen/arch/x86/include/asm/Kbuild
>>> b/xen/arch/x86/include/asm/Kbuild
>>> new file mode 100644
>>> index 0000000000..a4e40e534e
>>> --- /dev/null
>>> +++ b/xen/arch/x86/include/asm/Kbuild
>>> @@ -0,0 +1 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> diff --git a/xen/scripts/Makefile.asm-generic
>>> b/xen/scripts/Makefile.asm-generic
>>> new file mode 100644
>>> index 0000000000..0aac3f50b8
>>> --- /dev/null
>>> +++ b/xen/scripts/Makefile.asm-generic
>>> @@ -0,0 +1,23 @@
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +# include/asm-generic contains a lot of files that are used
>>> +# verbatim by several architectures.
>>> +#
>>> +# This Makefile reads the file arch/$(SRCARCH)/include/asm/Kbuild
>>> +# and for each file listed in this file with generic-y creates
>>> +# a small wrapper file in $(obj)
>>> (arch/$(SRCARCH)/include/generated/asm)
>>> +
>>> +kbuild-file :=3D $(srctree)/arch/$(SRCARCH)/include/asm/Kbuild
>>> +include $(kbuild-file)
>>> +
>>> +include scripts/Kbuild.include
>>> +
>>> +# Create output directory if not already present
>>> +_dummy :=3D $(shell [ -d $(obj) ] || mkdir -p $(obj))
>>> +
>>> +quiet_cmd_wrap =3D WRAP    $@
>>> +cmd_wrap =3D echo "\#include <asm-generic/$*.h>" >$@
>>> +
>>> +all: $(patsubst %, $(obj)/%, $(generic-y))
>>> +
>>> +$(obj)/%.h:
>>> + $(call cmd,wrap)
>>=20
>> In fact i think your files are not generated in the srctree so this
>> will break if you use out of tree compilation.
> Why not? They will be generated in $obj which equal to
> obj=3Darch/$(SRCARCH)/include/generated/asm ( in my case ).

Right they are generated in the build tree but if it is not the same
as srctree it will not work due to CFLAGS.

>=20
> Anyway I think that obj should be equal to what is mentioned in CFLAGS.

We generate other files like asm-offsets.h and it could in fact be that
both srctree and build tree are already in include path.

There is in makefile a rule already removing asm-offsets.h which is generat=
ed
and this one does not use a prefix so we should follow this standard in fac=
t.

So we should not use any prefix (srctree or obj) i think.

@anthony: any suggestion here ?

Bertrand

>=20
> ~ Oleksii



