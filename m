Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A74A744A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:13:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264309.457364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHJg-0005Cm-NG; Wed, 02 Feb 2022 15:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264309.457364; Wed, 02 Feb 2022 15:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHJg-0005Ag-Jl; Wed, 02 Feb 2022 15:13:04 +0000
Received: by outflank-mailman (input) for mailman id 264309;
 Wed, 02 Feb 2022 15:13:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFHJf-0005Aa-P3
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:13:03 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c7e490d-843a-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 16:13:02 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212F3iBF011355;
 Wed, 2 Feb 2022 15:12:58 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyv8sg2y5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 15:12:57 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5588.eurprd03.prod.outlook.com (2603:10a6:208:169::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 15:12:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:12:50 +0000
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
X-Inumbo-ID: 9c7e490d-843a-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iISk6llah5Q1WiQXpILThIWfZRZztQmAvu5ciux23swPfdoV6/T0bkAJolum4Cc3THi5JudO3iRaq1rxBmPdnxjPrwtPuRAxBBC4WuhLogeqR1NKW9Pax5bGLbwXEENvVNGlWdOtDK/84l54Z1buOGkYXznBeOb3LhM2wVAw/wq1of4B9lNK8kOPYQHF6DIq4RUYjq5EC41oWNGkgWYli0Cy3cWmEGUl6Ar26OGX23Ax3U3epbnRTX/sLK9wT3JKnPn5av7dTruLBxHCAt1GT7zK+Xse7MLfbvp7GhHe+BI87z+9l/ycJVznI7YNlJ0B99ObD0yezDThnPirQE+YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgzRHKqqQ2C66rWBFNOEo/b3u7BEPjwLbpKyLxBVUME=;
 b=eHUZKKIREwN903bSHFHTiNY+iYx1d1WfT0nbQEfnX5ssaeKrg0EvFmoIJMn3oCqId5WOSs44aIgoF7aYq05YtjvmV87DrDF4VX8IkZDt/0OpajuA5wS/niaJBfNxyarEyuJV5H2E4ujzsjsX5L63a0sdaVEOyWIWXG9wd/GIZfNWZXDoYLxUCO71cFChXbLEEfv4WjJvf1ryhCwFj20FIK4tUhQscYUaQOicIMmvyS2T9cMEs9k5nPmvLRgV42E35xVwkBbhLR+JzUO8PxtJ43SR3ONDpzf43gPVajg6r98I6LJUAJ7qhhfg3Sx5AmdV9N/IE5eVcAluVqWSTp8DiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgzRHKqqQ2C66rWBFNOEo/b3u7BEPjwLbpKyLxBVUME=;
 b=Lw869QYQCjZy5d0U2NG+84GhguxVIXypANiV5Ng1psVUs9hVM31E2YhmedqWBAGn0D/5ROJIQcHyZfNdIXWiiy46Cz6g6vp43QyN9JlsM5RhX6klKgvMrehW9pxMxabbAjb4nbw2wBS6WoSYkR+d0GxtaWTFNLyPuo+qhdqu1xNG0cNP+r4wkd+LDTLu5N9TMm/TPH7R3nknr5126QrzCIAUcOwkzdvMGSkBX+l53o/fghXYeJgRNi9V0bTzYeJudvGssUApn7oWp0Z/y1aeZk3cqQe5qSRUbPmSQfbiZVFojSgrJOs46wP699Qd/YJq4VZCmXT3lV3y1Ngl/FhKQA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: 
 AQHX4ewK3mPSKCsK30iVfRQpWoVIB6xhEugAgB+P6YCAAAvvAIAABD6AgAAIlwCAAAJMgIAAAWUAgAAJGICAAAE5AIAAAT0A
Date: Wed, 2 Feb 2022 15:12:50 +0000
Message-ID: <6cc0d636-8cbe-22b0-01fe-b43e92ba7a98@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
 <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
 <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
 <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
 <f93d4d54-a2ac-67c0-8a04-d8321b0828e5@suse.com>
 <4fb06bb7-442f-e041-ef95-daec81e1d3a0@epam.com>
 <3f75acfe-bb88-5982-5f8e-04e0d1755c1a@suse.com>
In-Reply-To: <3f75acfe-bb88-5982-5f8e-04e0d1755c1a@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76529cef-fbb9-4341-f0df-08d9e65e7a4a
x-ms-traffictypediagnostic: AM0PR03MB5588:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5588A22949C909D03CF88999E7279@AM0PR03MB5588.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +h/vWnIoznwSg/J0RGlbZJuD4yeIruf4xEca3BOM2sbNX3zFYSphl5oYyhLpSYrudWMBT9f5awbHIZxB9kyyhegYTadDnseglJ7nXMQwsNQiR2Uy1oCAca+NJdy5BjDk2KEAEvQ/8ilhAn0uTW1sxrJPccB3J/zdd2TlRKzYN6skNzbxFBYr8O6EFBIFVd20M1bSrdeSKEqfO03WCI9O+U63XVkqXbLIsM6L7R7TmVwE9Lfhx0NuoIEF+pv7b5/7uLLa8gFE5I39eOHw1NzM+AVU9GGLgZxlpMq0B4Jj6AMFNpJ7x5HxpmaCSrPADniulwmq/Q83JXdyhU+MDBUI8bcyNxZIGI4mGFYkLLLNiwlB8Bl4adqTCaijPuD058XATKUh9DYpKb1SuwwyxG+FR9JPGk2aXr/4Miko79xmc+exrV35BJTMak1vQ4s+1IoCHS5obzHq8Ncc7YGr3q3MKv9LOTmKQ1Rxsc2MSRZtJF30HGnTa2GXy6l/jTxT5hE03x//yJKef4wQXwBZfMM8vEJBWttP30Hbe8lbIoid9fBqL0isJxG+yOE3uN90nAPhSUFvASjKZf0WUMAkjovnmbYEJuf5JBT+Oz3YsMWoaVm6ND6ghLWqRlN1yTkMRns/Y614bLc9UHQXfZ2E+soCJCcJm5UMjrQefMZ7AekJQ1dfkcBBW1y4IIgmuCm/4lDXXsb5Gg2FSzPcLCkDMh1ZkNYzKVe9yEq9ehDs/emCSOrJQd+QajMBwb5JVwUvPuIv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7416002)(71200400001)(186003)(26005)(38100700002)(122000001)(83380400001)(5660300002)(6506007)(31686004)(36756003)(2906002)(53546011)(86362001)(8676002)(8936002)(2616005)(54906003)(66446008)(6916009)(66476007)(31696002)(66556008)(6512007)(76116006)(64756008)(66946007)(4326008)(91956017)(316002)(508600001)(107886003)(6486002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RjVVcFA3TVdKbGRuTloweUEwd3piVzVIdlZ1ZTdHZCtJTDZLQ1FuNjlIYm00?=
 =?utf-8?B?R3J4NlJPZEgydFFKaHNTK1F0RjRhYVAzWnc4UjdYSGJtOWhrZGFhNHBtYlFP?=
 =?utf-8?B?N2ZleWJsVVhPc3NzVmNaVXp2Z1hLTFhKeTZIUEpBbi8yNUJ3MEJZWnpWSHhD?=
 =?utf-8?B?N3VrcUtQcHNPNXJIeE5vcTJJMUZKMENjMXNWYlRlVmd2SHdtYUtRNUtleHdO?=
 =?utf-8?B?TG1lYkN2OE5KQUhlYmpFdkhwSEdKQmd6T3d0UklKN2o1aWpxNFE1R1RuK1Rj?=
 =?utf-8?B?WkdBdVh4MUNRak83U1ozeHd6WXkxWHVwVHI3Q2ovc0wvaCs4bHZJMVJVQlk3?=
 =?utf-8?B?b0FZdmVaM0dYcEdQVHFZSXlXMEUvem1DcTJCY3ZUUmdUMkhQMUxQVEp0bGxC?=
 =?utf-8?B?RnJPMUNuNGRFd2VtdFJSUU5JTEV4clQxUnp0WHNvUlpmTEVpM3lnRFhNK2tz?=
 =?utf-8?B?RXBpczZDOFpVT2ZnbUpYazR1WWcwVitrNHFsb1JJSytZdFZWcVVrRlQyODI5?=
 =?utf-8?B?T2F4U1Fhc2NBLzM5QVFMWDY5c1NhVTg3aTFMOHlkTXVNczViOEFnQU5pS0c3?=
 =?utf-8?B?dHQ3bExiZmxwc2pwVW9JcXdKU1JPdFRjYzlBZ25oUGVKMDYyQ1BKaXVVNjZk?=
 =?utf-8?B?RzZnaTE1OXI2YWRRcC85WTgvWUVYQ3hQNDk5SkoxVitkQkN0Y2grampRMlFq?=
 =?utf-8?B?WTZQWnNqRVdnbEtQWjZoNmkzM0IwYWZQSm9UK0M3QVdiTXdGYnlqSmJwZ1hu?=
 =?utf-8?B?b0gxYTltT2ZDaEtFN0RDTEI1KzMxTzVGWFY1N2IxZ0U0VmhyZzlWMVBZaitl?=
 =?utf-8?B?S2E4WjV6bEJhUjVaSDkzQUVVd2gvSkdtRmg1U2cwYWtEWTZzZEkzWUxCMWZx?=
 =?utf-8?B?Qm5xTHIwRnZUWnhNVTkrNk5zUENHTG40cVJYUlU4QUUzYWovKzZqdVp3UUxF?=
 =?utf-8?B?QXBjaW02M01QVXVXKzlkZExremZmQ1drZUxaMjV4VThCNkVrV0NUcElUaEtj?=
 =?utf-8?B?K3hVdVhPY0dZQUxXRkhmUmVUL1FsSmw1aS80akFlRVAyNTNnRFRMWDZvcTVV?=
 =?utf-8?B?OXJrK1pwRzJpWlJjWjlYVVpVcFVVRDVOcTNXSFdNaVdyb1FxUVN3UlZLcFZo?=
 =?utf-8?B?bmxZVDA0ZWFJSkFGRWl1TndUTVFPMXluSVI5TmhKZHVwdHVoTVdsNUg3MGJo?=
 =?utf-8?B?TFdYeGpkVWtPWkNvMHduM0FJTW5ZSHBmcGF2OXNWQXg2b0RYK2J5Y2NmT1hS?=
 =?utf-8?B?OXZYYkt5RUdYbDA1MkZpUlhFNXgwZ0dMQ1hFaDlzWE1LZDNiZGFpam1pNUdw?=
 =?utf-8?B?dDk4V1I3aXE1VGkvaXA5RWh0OFlMaElLWVFSVFFFVmp4SExDbzhjaDM4Y3JI?=
 =?utf-8?B?bGJ3cjRjc0s4alNQMjFmT2FOTXB0aUVrSmpxNU1scThhbkx6MXlRcUMxVVE4?=
 =?utf-8?B?N0J4QUJ6amNTY0NiQXYzc05lc3F0N29sUHAwdVpGN21yRnc5c2YzNlpVWnBK?=
 =?utf-8?B?aHpmKzFOTm1mNllHOGhpUVk0bk5UWElmK2tGVE5XVC9FVXlEQ3RVanl1dUha?=
 =?utf-8?B?cXRHZFNpM25kMCtyWDZ0RWp5R0t0SVBEaTRJSkZvVDQ3bzFnSjc3RUE0Skor?=
 =?utf-8?B?c0ZXeldHbDBYY0c0eGU0UmIraDBoNDF5QW5RemxYTHUrTm4wN3lpcWxwUU11?=
 =?utf-8?B?cGZrVmdoVVhzZSthVTJLeFZqNlBDclRKd3hDT2lKVkMzZG1YRzZuSVFnb1V4?=
 =?utf-8?B?UE1yU3V2aGlVUFJjRWpVM0xqR2txaEt0VzZZalRpWjJmSHhnMmFpYzdkY01o?=
 =?utf-8?B?aWFEelpxRm50WTdxK1J6dTRuWUdjYjByUjdZSDdKYzQwZUlkWjR0akNaMzhz?=
 =?utf-8?B?VC9DaWJMOXVKNlNKYm4yVGZaWXZpajY1RUg3cHBHQkRNR0p6UFptaEM0MlU5?=
 =?utf-8?B?MUR3a085aVJRMXpuZlpDM2tJdW8rNlBKM1FUR3A5M25ZMy9sZ2hrZVFsa3ZI?=
 =?utf-8?B?UG1XRUtBM0NsQWVUT0VPaXpIVWZ2WVdSeHRJdzVwNERRWGlHSXpZMWRaajNI?=
 =?utf-8?B?MURyalFkMWZOdGtQcnpqRzNkQjNpTmRycVU4cWYvZzdySjJUODBsaDRkZi9B?=
 =?utf-8?B?ZFprbHd3bDNWbWQ3VEtETnMra1prd21kRVNPQXllVVh2bGtDc2RsbEFzTGYr?=
 =?utf-8?B?bThTR1NubzJVL0dLdlc1VW1UeTRJNUFSaDdpclBDcy9RdHU4alFCYmQxS3o0?=
 =?utf-8?B?b1B2bG1VdzFTZ1A3cTk0d0NOcHcrTjY1WlJCZklqUm9GbGVrUzFmZWJlMUFt?=
 =?utf-8?B?R2pBb3BjOUd0Mk9tcFUrQjc4NGxsQjJTQWtTbWhsREZkZ2dneWRqUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A65D317045377E40B5DC5AA70423DE6D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76529cef-fbb9-4341-f0df-08d9e65e7a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 15:12:50.2213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6LeGhX0gbYMeVmKawVp9Y11iLqRmHznp0HIAMDc2Tc+Jto9iEVh9DDPn4nB9NSN90bHshecp1Uvbp1tNFUroxuEm0XoTeOctX+4BpzFRNZ/d1cj3Igjvreyvqx5mNw8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5588
X-Proofpoint-ORIG-GUID: vpO2yYcSjKEOl2qeRHicNy-91gZh8rBZ
X-Proofpoint-GUID: vpO2yYcSjKEOl2qeRHicNy-91gZh8rBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_07,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=810 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020085

DQoNCk9uIDAyLjAyLjIyIDE3OjA4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxNjowNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDIuMDIu
MjIgMTY6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAyLjAyLjIwMjIgMTU6MjYsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwMi4wMi4yMiAxNjoxOCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwMi4wMi4yMDIyIDE0OjQ3LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4gT24gMDIuMDIuMjAyMiAxMzo0OSwgT2xla3NhbmRy
IEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+PiBPbiAxMy4wMS4yMiAxMjo1MCwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4+PiBPbiBUaHUsIE5vdiAyNSwgMjAyMSBhdCAwMTow
Mjo0NlBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4+PiArKysgYi94ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+Pj4+IEBAIC00OTEsNiArNDkxLDIyIEBAIHN0YXRp
YyB2b2lkIGNtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50
IHJlZywNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNi
ZGYsIHJlZywgY21kKTsNCj4+Pj4+Pj4+Pj4gICAgICAgfQ0KPj4+Pj4+Pj4+PiAgICAgICANCj4+
Pj4+Pj4+Pj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBjbWQsIHZvaWQgKmRhdGEpDQo+Pj4+Pj4+Pj4+ICt7DQo+Pj4+
Pj4+Pj4+ICsgICAgLyogVE9ETzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBiaXRzIG9m
IHRoZSBjb21tYW5kIHJlZ2lzdGVyLiAqLw0KPj4+Pj4+Pj4+PiArDQo+Pj4+Pj4+Pj4+ICsjaWZk
ZWYgQ09ORklHX0hBU19QQ0lfTVNJDQo+Pj4+Pj4+Pj4+ICsgICAgaWYgKCBwZGV2LT52cGNpLT5t
c2ktPmVuYWJsZWQgKQ0KPj4+Pj4+Pj4+IFlvdSBuZWVkIHRvIGNoZWNrIGZvciBNU0ktWCBhbHNv
LCBwZGV2LT52cGNpLT5tc2l4LT5lbmFibGVkLg0KPj4+Pj4+Pj4gSW5kZWVkLCB0aGFuayB5b3UN
Cj4+Pj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+Pj4+ICsgICAgICAgIC8qIEd1ZXN0IHdhbnRzIHRv
IGVuYWJsZSBJTlR4LiBJdCBjYW4ndCBiZSBlbmFibGVkIGlmIE1TSS9NU0ktWCBlbmFibGVkLiAq
Lw0KPj4+Pj4+Pj4+PiArICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFOw0K
Pj4+Pj4+Pj4+IFlvdSB3aWxsIGFsc28gbmVlZCB0byBtYWtlIHN1cmUgUENJX0NPTU1BTkRfSU5U
WF9ESVNBQkxFIGlzIHNldCBpbiB0aGUNCj4+Pj4+Pj4+PiBjb21tYW5kIHJlZ2lzdGVyIHdoZW4g
YXR0ZW1wdGluZyB0byBlbmFibGUgTVNJIG9yIE1TSVggY2FwYWJpbGl0aWVzLg0KPj4+Pj4+Pj4g
SXNuJ3QgaXQgZW5vdWdoIHRoYXQgd2UganVzdCBjaGVjayBhYm92ZSBpZiBNU0kvTVNJLVggZW5h
YmxlZCB0aGVuIG1ha2UNCj4+Pj4+Pj4+IHN1cmUgSU5UWCBkaXNhYmxlZD8gSSBhbSBub3QgZm9s
bG93aW5nIHlvdSBoZXJlIG9uIHdoYXQgZWxzZSBuZWVkcyB0bw0KPj4+Pj4+Pj4gYmUgZG9uZS4N
Cj4+Pj4+Pj4gTm8sIHlvdSBuZWVkIHRvIGRlYWwgd2l0aCB0aGUgcG90ZW50aWFsbHkgYmFkIGNv
bWJpbmF0aW9uIG9uIGJvdGgNCj4+Pj4+Pj4gcGF0aHMgLSBjb21tYW5kIHJlZ2lzdGVyIHdyaXRl
cyAoaGVyZSkgYW5kIE1TSS9NU0ktWCBjb250cm9sIHJlZ2lzdGVyDQo+Pj4+Pj4+IHdyaXRlcyAo
d2hpY2ggaXMgd2hhdCBSb2dlciBwb2ludHMgeW91IGF0KS4gSSB3b3VsZCBsaWtlIHRvIHN1Z2dl
c3QNCj4+Pj4+Pj4gdG8gY29uc2lkZXIgc2ltcGx5IGZvcmNpbmcgSU5UWF9ESVNBQkxFIG9uIGJl
aGluZCB0aGUgZ3Vlc3QncyBiYWNrDQo+Pj4+Pj4+IGZvciB0aG9zZSBvdGhlciB0d28gcGF0aHMu
DQo+Pj4+Pj4gRG8geW91IHN1Z2dlc3QgdGhhdCB3ZSBuZWVkIHRvIGhhdmUgc29tZSBjb2RlIHdo
aWNoIHdpbGwNCj4+Pj4+PiB3cml0ZSBQQ0lfQ09NTUFORCB3aGlsZSB3ZSB3cml0ZSBNU0kvTVNJ
LVggY29udHJvbCByZWdpc3Rlcg0KPj4+Pj4+IGZvciB0aGF0IGtpbmQgb2YgY29uc2lzdGVuY3k/
IEUuZy4gY29udHJvbCByZWdpc3RlciBoYW5kbGVyIHdpbGwNCj4+Pj4+PiBuZWVkIHRvIHdyaXRl
IHRvIFBDSV9DT01NQU5EIGFuZCBnbyB0aHJvdWdoIGVtdWxhdGlvbiBmb3INCj4+Pj4+PiBndWVz
dHM/DQo+Pj4+PiBFaXRoZXIgY2hlY2sgb3Igd3JpdGUsIHllcy4gU2luY2UgeW91J3JlIHNldHRp
bmcgdGhlIGJpdCBoZXJlIGJlaGluZA0KPj4+Pj4gdGhlIGd1ZXN0J3MgYmFjaywgc2V0dGluZyBp
dCBvbiB0aGUgb3RoZXIgcGF0aHMgYXMgd2VsbCB3b3VsZCBvbmx5DQo+Pj4+PiBsb29rIGNvbnNp
c3RlbnQgdG8gbWUuDQo+Pj4+IEkgY2FuJ3QgZmluZCBhbnkgYWNjZXNzIHRvIFBDSV9DT01NQU5E
IHJlZ2lzdGVyIGZyb20gdk1TSS92TVNJLVgNCj4+Pj4gY29kZSwgc28gd2hhdCdzIHRoZSBjb25j
ZXJuPw0KPj4+IEFnYWluOiBPbmx5IG9uZSBvZiBJTlRYLCBNU0ksIG9yIE1TSS1YIG1heSBiZSBl
bmFibGVkIGF0IGEgdGltZS4NCj4+IFRoaXMgaXMgY2xlYXIgYW5kIEkgZG9uJ3QgcXVlc3Rpb24g
dGhhdA0KPj4+IFRoaXMgbmVlZHMgdG8gYmUgY2hlY2tlZCB3aGVuZXZlciBhbnkgb25lIG9mIHRo
ZSB0aHJlZSBpcyBhYm91dA0KPj4+IHRvIGNoYW5nZSBzdGF0ZS4gU2luY2UgZmFpbGluZyBjb25m
aWcgc3BhY2Ugd3JpdGVzIGlzbid0IHJlYWxseQ0KPj4+IGFuIG9wdGlvbiAodGhlcmUncyBubyBl
cnJvciBjb2RlIHRvIGhhbmQgYmFjayBhbmQgcmFpc2luZyBhbg0KPj4+IGV4Y2VwdGlvbiBpcyBu
b3RoaW5nIHJlYWwgaGFyZHdhcmUgd291bGQgZG8pLCBhZGp1c3Rpbmcgc3RhdGUgdG8NCj4+PiBi
ZSBzYW5lIGJlaGluZCB0aGUgYmFjayBvZiB0aGUgZ3Vlc3QgbG9va3MgdG8gYmUgdGhlIGxlYXN0
IGJhZA0KPj4+IG9wdGlvbi4NCj4+IFdvdWxkIGl0IGJlIGVub3VnaCBpZiBJIHJlYWQgUENJX01T
SVhfRkxBR1NfRU5BQkxFIGFuZA0KPj4gUENJX01TSV9GTEFHU19FTkFCTEUgaW4gZ3Vlc3RfY21k
X3dyaXRlIHRvIG1ha2UgYQ0KPj4gZGVjaXNpb24gb24gSU5UWD8NCj4+DQo+PiBPbiB0aGUgb3Ro
ZXIgaGFuZCBtc2ktPmVuYWJsZWQgYW5kIG1zaXgtPmVuYWJsZWQNCj4+IGFscmVhZHkgaGF2ZSB0
aGlzIGluZm9ybWF0aW9uIGlmIEkgdW5kZXJzdGFuZCB0aGUNCj4+IE1TSS9NU0ktWCBjb2RlIGNv
cnJlY3RseS4NCj4+DQo+PiBPciBkbyB3ZSB3YW50IHNvbWUgYWRkaXRpb25hbCBjb2RlIGluIE1T
SS9NU0ktWCdzIGNvbnRyb2xfd3JpdGUNCj4+IGZ1bmN0aW9ucyB0byBzZXQgSU5UWCBiaXQgdGhl
cmUgYXMgd2VsbD8NCj4gV2VsbCwgeWVzLCB0aGlzIGlzIHdoYXQgUm9nZXIgYW5kIEkgaGF2ZSBi
ZWVuIGFza2luZyB5b3UgdG8gYWRkLg0KRG8gd2Ugb25seSB3YW50IHRoaXMgZm9yICFpc19oYXJk
d2FyZV9kb21haW4oZCkgb3IgdW5jb25kaXRpb25hbGx5Pw0KPg0KPj4gSSBtZWFuIHRoYXQgaW4g
dGhpcyBndWVzdF9jbWRfd3JpdGUgaGFuZGxlciB3ZSBjYW4gb25seSBzZWUNCj4+IGlmIHdlIHdy
aXRlIGEgY29uc2lzdGVudCB3cnQgTVNJL01TSS1YIFBDSV9DT01NQU5EIHZhbHVlDQo+Pg0KPj4g
SWYgd2Ugd2FudCBzb21lIG1vcmUgY2hlY2tzIHdoZW4gd2UgYWx0ZXIgUENJX01TSVhfRkxBR1Nf
RU5BQkxFDQo+PiBhbmQvb3IgUENJX01TSV9GTEFHU19FTkFCTEUgYml0cywgdGhpcyBtZWFucyB3
ZSBuZWVkIGEgcmVsZXZhbnQNCj4+IFBDSV9DT01NQU5EIHdyaXRlIHRoZXJlIHRvIGJlIGFkZGVk
ICh3aGljaCBkb2Vzbid0IGV4aXN0IG5vdykNCj4+IHRvIG1ha2Ugc3VyZSBJTlRYIGJpdCBpcyBz
ZXQuDQo+IEV4YWN0bHkuDQpPaw0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

