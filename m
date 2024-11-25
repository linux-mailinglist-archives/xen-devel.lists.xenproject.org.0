Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7249D8EF9
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 00:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843202.1258847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFiQW-0000ji-Dh; Mon, 25 Nov 2024 23:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843202.1258847; Mon, 25 Nov 2024 23:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFiQW-0000hj-Az; Mon, 25 Nov 2024 23:23:32 +0000
Received: by outflank-mailman (input) for mailman id 843202;
 Mon, 25 Nov 2024 23:23:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJiL=SU=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tFiQV-0000hd-Dc
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 23:23:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2614::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 462755eb-ab84-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 00:23:27 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7996.eurprd03.prod.outlook.com
 (2603:10a6:20b:43f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 23:23:24 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Mon, 25 Nov 2024
 23:23:24 +0000
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
X-Inumbo-ID: 462755eb-ab84-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjJlIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ2Mjc1NWViLWFiODQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTc3MDA3Ljg3NjAzMiwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIR68V+R56z1PyadVHUJTtemopaB/G9WQwUednhbwRIgYKkkDUfAELUbTfEoOXRPx//ZrTR+d2Cn3BzfrwK6lI27EyDIAXRtSKln4I8J3NZn1jISZA2Y4qDWXlNhvgHa+DbwfjKHSm3KMdoskMjXCSnADui6fmQTDmQfGWLeDyhGGVyZ5DlNymJOeoMdnsFxiWveRgEVIOEMXA9Hmeq/poqO1a9oISYPBRr1zdhvrWO+b+nlh5dD9icfi2qul+j1hA/gEWmmnCY1bi09rQv8yBPsWdG7hBvwcVTz4IeQvRJyk8m3o6OjE8LR98BbReRYJGEuAmBilhkb/iE4bp/JWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+ypn+xtdaSRVSPn1xCrFQb32fWsefaxuIODkRrFmWc=;
 b=MszWDG1UaIIVw2SpidNGn+BDVW0OCjO3d+0ukuaFczQAd0lqY4dnJGAEDrT+KClOTnr7qypNaFqYqf384TBkvJlc5A9RiVA3HUrI1526pHLWVsxbrU5+rQZa652EHk/HxouI+Luuq9uM0d1rRpO2g7OoRMcRfkTI5+rmqOmGFioj+4kssQQao/O6Gi4qJcCx17rx0HIT3zq91UvyYMVHrJetwlgUM7Y4gDXn6VUxO8czeL5pAb+O+o61pZ3pwn+9tW9TF6k7KiVXNboIq+zsgPYFmL0DdYL7qE+8pgXS0ry64HgyRD3bHIvcyFtDYuvV2a2K0ZHUO7uo3ZTV6awXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+ypn+xtdaSRVSPn1xCrFQb32fWsefaxuIODkRrFmWc=;
 b=JCQkqvqFYR4s2eccYRxmO59+T3QbDtPj7CZoaDgX4YqIZrrtvj+RrstR3sJNn4O9qCdD5dLDMz1MRXz1mE/ARMt9bjFx0nIwtA1wDZv/zCLtorEHoTdk3AE0L7NMZAh6aKLIjlx86rn/7SmwbSZ0caMMWhBP2mDgi4uK0oQN6vRElhUwCZmaqaRPja7jUf3/hLET0o6nvqr/7bssN3bV23vbBdjowkSEdjZhmfStmXR0jhbXCrZDgmTarb6iGf5UYLy8Ewg3x+0ux22E+QXmWjRdSgWz+qMYeX1HFAJ4yMEr1EPTfY85uvaY3UdQjoYBpu0IWW2DjPYo01Hig2HF9w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Index: AQHbNucXRmUX3Y7lRUGcS7d55ZSXhw==
Date: Mon, 25 Nov 2024 23:23:23 +0000
Message-ID: <87plmikidx.fsf@epam.com>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
	<alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
	<875xojmexk.fsf@epam.com>
	<alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop>
	<87iksilod0.fsf@epam.com>
	<alpine.DEB.2.22.394.2411201406060.3516911@ubuntu-linux-20-04-desktop>
	<871pz4kwle.fsf@epam.com>
	<alpine.DEB.2.22.394.2411211637060.3516911@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2411211637060.3516911@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Thu, 21 Nov 2024 16:37:10 -0800	(PST)")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7996:EE_
x-ms-office365-filtering-correlation-id: 53340122-3235-4cc7-175d-08dd0da82866
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K1bsQtRRwQWbUwE+qMtHBl0PFW5ay8QNLxLy3UdhwOgVXc96YYFSGKc823?=
 =?iso-8859-1?Q?EgV7lphGIU9zBFMgyePa+78ZfwcE3dLP5lSHcXPPPHaz6oQp+Lzc00Z2Uy?=
 =?iso-8859-1?Q?XNcngX+Y6QXowtOCd4gfvtsBclzaaNXCaojj7ajCs6IpY51xCzNumP4mbK?=
 =?iso-8859-1?Q?I6FWXr2lSiCyXuvyJtzdt7KkScypBmovdFHDkgVVBDQjW2KxElRyoh1YBR?=
 =?iso-8859-1?Q?rtd2xcaRiagPi2IzZkjposgUMczk7HFZSYw02JWv/mwk2thKnvE3IdTmHM?=
 =?iso-8859-1?Q?0ywPvewGM3Ds1iSNeGI7R9iEes7Rq4gIBakw2c5BU0vIuiBB510PtkwhQ1?=
 =?iso-8859-1?Q?vJ8bILVcn6Co4MRKqd3RXmdjQZ65At4jZUr4ceXaULcibiiWO4uXi44orr?=
 =?iso-8859-1?Q?RmJtgDdodTub+Mu0XDLiNpDCnM07vekbRXbgDshbOlPvExK+ZPtPoMPN/B?=
 =?iso-8859-1?Q?DGXgudDhhssltsXObuK7b0AD9TE0TLV6o52HIKPoUcvFMqivsxWuJiDsQL?=
 =?iso-8859-1?Q?wX7gyBxZ4G3NNy3qe7O2Y5z08KghxmMua1TzfZq1wKUt5uGv2DEmaOp9cR?=
 =?iso-8859-1?Q?lDeuTIWoo/ciN7Td1Sw6YJs6+ljW70I4SU844zD2+x6/vb34anFqFPGayp?=
 =?iso-8859-1?Q?wHn/rz7qafyXjtBbcoV/vNnkhT1SD2xt4FvZC5ljTOS5303OaWCOy2N8p3?=
 =?iso-8859-1?Q?K3tx4ppodUmGQIdF102bCLiK2A4KlPwFCW3y4ynUjEpORnNx4Of8Ah8Qzk?=
 =?iso-8859-1?Q?SxnwJhC4PiXyDtSR3E+8gO0EBE0xt6hOL5ViG/tfQecv1dv5i7/MpcyZRc?=
 =?iso-8859-1?Q?9XYsXIgp24Dgo85p2IvjoZYkCrPKTwxl7r7PeTwwKVddIAICnn/2orHpHn?=
 =?iso-8859-1?Q?Z5JzPqpIjgAcogsfJLOafi3kBN89SYVKUDDeVBnrmSFDgdVmXgtrIcs3ln?=
 =?iso-8859-1?Q?+MBURedUyFWseoywIf+rrcfiKZZaZ1peCdOW6DuFhgFSI7vJ+yYNTeR/74?=
 =?iso-8859-1?Q?Y040B/BtZLBOtMED1cmBDqv0KAzRQtf/bFhnS4OMkrrc6X/Sp4gVwyultZ?=
 =?iso-8859-1?Q?UumElzc6yCuEwoEKWxni3l+UjUosqgJcdCQqttP3x2lh6EQ0JV8Uclpuvy?=
 =?iso-8859-1?Q?mh0VYD/bUNnooe6e1xtaQBdXo/p7XdYywm0IOjqpu3UirfZqfQxjQ7UN19?=
 =?iso-8859-1?Q?jkmuEoOWoSbyQB3aLNYm3k1+hER2xEIjX7a9B9M7IvM3MALMsCj3bas2c5?=
 =?iso-8859-1?Q?HuN+trD/5cp3jOnQzqF2KQkHlRAN0jvgciOqPEHvpztmvhVvKktaTPcOVm?=
 =?iso-8859-1?Q?90hzALpskFCZZtkIkKRYvxkuNxLjeAUa4gdvERLr8wmKL5TBav/BkAASVt?=
 =?iso-8859-1?Q?xhzIZbx4SgY8UXTN79PSR4AuOZCDjN+GeSxv/OuXnW3E05qcO7Djc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rMI1bafEil7Z7o6lDKDF/olrHDPLGTvxKjU3ZLwAvKZSNORMtdwVIS01aO?=
 =?iso-8859-1?Q?phUDPbU83sxTSiasCrt8bVqWijY0qoONu+m73yCIgYwrs3iLwMPgWKDrTX?=
 =?iso-8859-1?Q?qAYOIIKGtgGgvoVWRfjsIXtXuaaLjS+Xvr88nHI4uDC8jVLrxGSno2YHkj?=
 =?iso-8859-1?Q?gvLvlZOZkaoCSptPnAU9s7icDssBpJYi7uDQdVkoOJYUsQ9tO62YHUBnlx?=
 =?iso-8859-1?Q?mi4YJqzODvaoQjFGQauMpOAQ3D4iTNxyb8Udlx5r1dogzh6Nvkfg7OSypH?=
 =?iso-8859-1?Q?PcU/oO5+6fPc06NcK55sTEzGhFRg2A7g7P1RGuCfdNFuSaMolh15Hn2Ome?=
 =?iso-8859-1?Q?R80dnduFVE+/gVKS80fr8jKwUBNS2kIkHs+vxFILwS5kWeptY4U6/7JOWv?=
 =?iso-8859-1?Q?3KMkFvW8WY1GVi+DX3s0RXlCAQ7jKO5gLgpeiLvmXTKATn17uDVzM9jB8B?=
 =?iso-8859-1?Q?HFB+5bGlJQi6hoCHhz7WyEeX5X3FaJ6jCsWY1CP/NNuVwMhozkxJ95SilQ?=
 =?iso-8859-1?Q?sueDeFb/3IPTZWIKNfXWAGPcaPSW3zEPYGqPRY4mlcbo48vrQWR1AbuT+j?=
 =?iso-8859-1?Q?vGuZ2xEV8t7TfE42Imz1crkXx7ezB6XCdurcqoCWK0jyso1WncK2WIpCjg?=
 =?iso-8859-1?Q?eg4IzQFSsn3RZiACrmNbntRM/oAuS4B+r9dmvIIctcKHXBdoJvjkF/ZnSp?=
 =?iso-8859-1?Q?lfNPJqG9oSISkbJaavmjgVx7idByFY2+P7ngKmy39E45rRE3qowF4lj+Ja?=
 =?iso-8859-1?Q?77FXx24VrVCWyDdRTFHopty17eBhszFIxCGVeitk7ROQuVui22OMVtYc3Z?=
 =?iso-8859-1?Q?BAxbBs/pg9AsrxnckOlTKbPz5meoc8/KfPqk0J6gg/H3nw8vLPZi3lMR96?=
 =?iso-8859-1?Q?07HgHUKWmoSvl1QEpE6oBwHZToeo0qGkA+EhIgkNYmeA2ELji14EVIxDco?=
 =?iso-8859-1?Q?5yKnytBTInrwl4ICjBnEBASnWD3PiTDjCWQrdxPO5Opvnn2yE1MtDVU6r2?=
 =?iso-8859-1?Q?zEUoGBHPB8rjwNp1KS/AtaRpQtSuGnzIrgOpOSr86eeDvK1RYVP4zM2323?=
 =?iso-8859-1?Q?FgS1ZaUsGbJ6+D58qLkfKBMfPG9XiNbdInPU0xyoRcuIg08S7gvEqpFNYx?=
 =?iso-8859-1?Q?KrDl27aUEbXgyfHZq02HTMyC2Jfqfg6xgDSxisaxFFgo/OJN6cwJyhibws?=
 =?iso-8859-1?Q?MwcasjwuPWKIvBRxzh2TRDtAxrV+TO4cVpnlfVQ2DctT11aXGt+10VrJNe?=
 =?iso-8859-1?Q?a/ocz+NM3xsdIK7atf2LMbyjPTarbswbEe6tR/FI51ZPf/RW819RFf7qQy?=
 =?iso-8859-1?Q?M/Tvc45Oj8NgxGVnN62p6/4D5ec8VfiRPZme4U/6+F0QF1S7BroIAEuWz2?=
 =?iso-8859-1?Q?XeOQeJ7zQFYI4G94jTFGXRAJxE0eXV7R4OQ7El7F9ihSJ+KlcH7RJWXoU1?=
 =?iso-8859-1?Q?hDQF6KUCioRK25otLm9dpCIW5MxwihjN6RGGUfU1pxlsYz7vRTTJDpCLwV?=
 =?iso-8859-1?Q?FvZZwCn1a/7EmpmqxIcetCOsV+L8nspzQiyRJJzwAiPxGCKa6DYDewzj0A?=
 =?iso-8859-1?Q?eafin/8nMWWfUzAaJ6ABrWELJZ7/XdAqG3f/nBcoxh+wnPZvjKFBpTs26Q?=
 =?iso-8859-1?Q?oqa9AYKxiEaonwmgaizVvlnltNBcNBMT9sILfjWyo5z0+Bz1ebhWg5ug?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53340122-3235-4cc7-175d-08dd0da82866
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 23:23:23.9653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ek5aAGtMh1tAuQRtS6UyhVJNZxZP61eJoucGwwBYvaTxvtR+9xs0CJY8ucbKFmjY9saXXQRXnQ0qzupLzV18uth6jzD8ikOXd4TWNdBm0Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7996

Hello Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Thu, 21 Nov 2024, Volodymyr Babchuk wrote:
>> Hi Stefano,
>>
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>
>> > On Wed, 20 Nov 2024, Volodymyr Babchuk wrote:
>> >> Hi Stefano,
>> >>
>> >> (sorry, hit wrong Reply-To option, re-sending for wider audience)
>> >>
>> >> Stefano Stabellini <sstabellini@kernel.org> writes:
>> >>
>> >> > On Tue, 19 Nov 2024, Volodymyr Babchuk wrote:
>> >> >> Hi Stefano,
>> >> >>
>> >> >> Stefano Stabellini <sstabellini@kernel.org> writes:
>> >> >>
>>
>> [...]
>>
>> >> >>
>> >> >> I was considering this as well. Problem is that fuzzing should be
>> >> >> running for a prolonged periods of time. There is no clear consens=
us on
>> >> >> "how long", but most widely accepted time period is 24 hours. So l=
ooks
>> >> >> like it should be something like "nightly build" task. Fuzzer code
>> >> >> needs to be extended to support some runtime restriction, because =
right
>> >> >> now it runs indefinitely, until user stops it.
>> >> >
>> >> > We can let it run for 48 hours continuously every weekend using the
>> >> > Gitlab runners
>> >>
>> >> Great idea. Anyways, I need to add option to limit runtime to the fuz=
zer
>> >> and invent some method for reporting discovered crashes to the CI fir=
st.
>> >>
>> >> >
>> >> >> I am certainly going to implement this, but this is a separate top=
ic,
>> >> >> because it quires changes in the fuzzer app. Speaking on which... =
Right
>> >> >> now both fuzzer and test harness reside in our github repo, as you
>> >> >> noticed. I believe it is better to host it on xenbits as an offici=
al
>> >> >> part of the Xen Project.
>> >> >
>> >> > Yes we can create repos under gitlab.com/xen-project for this, mayb=
e a
>> >> > new subgroup gitlab.com/xen-project/fuzzer
>> >>
>> >> Good. Whom should I ask to do this?
>> >
>> > I created gitlab.com/xen-project/fuzzer as an empty group. What
>> > repositories do you need under it?
>>
>> Right now it is only the fuzzer itself
>> (https://github.com/xen-troops/xen-fuzzer-rs). If
>> we are going to use
>> XTF then we don't need additional repo for the the harness.
>
> Please see:
> https://gitlab.com/xen-project/fuzzer/xen-fuzzer

Thank you!

> Before pushing the master of
> https://github.com/xen-troops/xen-fuzzer-rs
> to
> https://gitlab.com/xen-project/fuzzer/xen-fuzzer,
> we need to make
> sure that an appropriate Open Source license is clearly specified for
> the project either with a top level COPYING file, or with an SPDX tag on
> top of each source file, or both. MIT is a good candidate as LibAFL is
> dual licensed as MIT.

Sure. I added COPYING with MIT license.

--
WBR, Volodymyr

