Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5328461F23A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 12:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439344.693399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0gy-0005qX-MK; Mon, 07 Nov 2022 11:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439344.693399; Mon, 07 Nov 2022 11:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1os0gy-0005nW-IZ; Mon, 07 Nov 2022 11:53:28 +0000
Received: by outflank-mailman (input) for mailman id 439344;
 Mon, 07 Nov 2022 11:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or3T=3H=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1os0gx-0005nQ-Gu
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 11:53:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8aa9811-5e92-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 12:53:24 +0100 (CET)
Received: from DB6P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::22) by
 AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 11:53:22 +0000
Received: from DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::de) by DB6P195CA0012.outlook.office365.com
 (2603:10a6:4:cb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25 via Frontend
 Transport; Mon, 7 Nov 2022 11:53:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT022.mail.protection.outlook.com (100.127.142.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 11:53:19 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Mon, 07 Nov 2022 11:53:19 +0000
Received: from 28341e60ad05.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5337AEC4-47EB-4985-B3B6-AB45161F21BF.1; 
 Mon, 07 Nov 2022 11:53:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 28341e60ad05.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 11:53:12 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB9648.eurprd08.prod.outlook.com (2603:10a6:20b:617::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 11:53:10 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::a504:d47b:217:4893%4]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 11:53:10 +0000
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
X-Inumbo-ID: c8aa9811-5e92-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eNCSNHWW/oy0QCNfk+EIIvJ3J9U2sodAPJWYU/2ilHotGkEk199GwtuymeiVzatIsarzUuSSIX91QJ+VuMO10/suinPBJiqcFC7v01+MHcY6XzHpMKPxlYS1qdmsZ+Lg0lcWKuo4dkdksLHe0fe+Dz8+ElRthh4sT8GZog3TsRyPUc7TCWaoldr0xNLKVvTk8n3mYT8ieAWACqoCqMEKwpxi/+UEQfhGgRfirIxjKNpPuASMrlbN/2EvvQo8upDktjW0wjc7rflXhW/4Ulvo+4GR8sPFWLFNG7QTTg3wh3XNldo99fsVk0y/lER3WIlPJp264Z2GyU1qbOJh99dcNQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHjIOY1lQCDI06OJXzFqzGEEUHu6UGB33E623c5gWuA=;
 b=P8NFSBknvabDudjypyMoX0vexGuw5XSxnkm493S7ki9btIip2CsGAteoRph7MamTseTHZzUy+NEH3MokAfQwHvWRjPik+xYs1z/nZaS7YIR5MQZYhBkukDsJ2LcD32IRDHsQVf+wQzjwBfwRjNiy1UMIE54Ucj4vcxZLKDklhVTVoLSrsalzDtWAPj3tAvKRlniJ4MSvGRoZKwDezkuYa5rbGOO2Y0uMAgPUtP3LfCZjelgBlZn93Jpq6Vxc07fRnrvqEme/pzT0NC/3g4hk6Uj76LbZhzmv2Hxo98PaQOWHogzMv5XluX9XMtfMlJ7WZzfrMe+hspL1+9qtIPoMAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHjIOY1lQCDI06OJXzFqzGEEUHu6UGB33E623c5gWuA=;
 b=QX6IYNZVAajiqzo6A5gLDSzNiY8IVTMW2dSgjPFbypJGgyo1Zd2zp3vfOFxw/RoGAKSCb5pSxtQWIuw6RmSwAjWXasTdLCLS1ilLCVmRfAQRH6N4i7sSl+mSlV+plimspbufmFyPU21hUs4La0edfL9Fxmbbq/YF2n1MOWhXBtk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9d9122aff0fabae
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+QB0d6G9qsJNGJRgNO8uDpQHandlJa0I0oJuLBeX7QHWVfgq0y439wY21W8JnEEVPu0qK+c1FGam01EAbf6r4nxUncQEDt6FhlciLD1d+qUl8Q6rIqr9QrBlOZHOyFSfwgdWQGijWjDTbDPPLl5VtY8zbhL3FpN2oCaLZK0HOEUPsRfa5FohXBqjmsCD2bZ7Nb96IlxREE8YG+t+TStMocwCs6S3dDk/kwxer6dZf+apdjbVBMlTA5R+q81l38ZUxklVuPaqgANpddI4+a4KJaJ9uPg2QaO2gJv8+an+ss+Vq2rCNPpWB9Z2RgOo0/ekb3vaxQB9STWrxUaJsElyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHjIOY1lQCDI06OJXzFqzGEEUHu6UGB33E623c5gWuA=;
 b=gif6V1WQIyJlZ94W7WjxnjKsmn+lXkU8pRCaATN0Ew9gTfqhx11RGEE/6FzBPpQxwFFEEa3T9ViwDRCgfOHgESnbKDYlcIHmcfCs0qCbkIMXazLSMnjA4hJkv7AaL4XVEvqkOh/h05+EiAZcntO1IVttNs/r+PfTkouJ/K77r3qIlrDQrjLgV7vh+WSgTFPayz/t+7ZStMVb8XTXgGRwaR684XooH49v6WM9t3FGBVNoaZD8KB9YniiEylXOsgXJqLf/hBM8xQn7clzJihi3xO11E3GKvA9xuVVZUKeicrQZxY2aKHALA4u/sVSaB0RZT+uNxm34CK5lQNGYu/xcwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHjIOY1lQCDI06OJXzFqzGEEUHu6UGB33E623c5gWuA=;
 b=QX6IYNZVAajiqzo6A5gLDSzNiY8IVTMW2dSgjPFbypJGgyo1Zd2zp3vfOFxw/RoGAKSCb5pSxtQWIuw6RmSwAjWXasTdLCLS1ilLCVmRfAQRH6N4i7sSl+mSlV+plimspbufmFyPU21hUs4La0edfL9Fxmbbq/YF2n1MOWhXBtk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Thread-Topic: [RFC PATCH 4/4] xen: Justify linker script defined symbols in
 include/xen/kernel.h
Thread-Index: AQHY8pZ4QA3C9Pi6Y066NaE9A9ULoK4zWNUAgAABAIA=
Date: Mon, 7 Nov 2022 11:53:10 +0000
Message-ID: <3925276F-8B6E-4B19-9EC2-C085FE88A637@arm.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-5-luca.fancellu@arm.com>
 <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
In-Reply-To: <5caf911d-e96d-39e4-d945-db6537412f60@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB9648:EE_|DBAEUR03FT022:EE_|AS2PR08MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: 529cb98c-8523-43c9-1d28-08dac0b6aa20
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XeKYHDNKXLjceZZAjpNjEBNawUp8KBnoqmmfHKqGjtair8S8Bmh+afJ4ATMv3i2ocJOw7LP4vUABiov+cy5E8Hm1I3nhESVPEaxTZVf/WQClLNkABJfaMtGyKOlAY0i58zM5esksFR2I94EH5SdOR2ZV+AEPJEmg2j87EIHWLshXMe4hxHVeZOYBrj+/YuvHPv99GqCy0q9gm9YcYYY0FxR3jAvYp/I7dlXHDr/6uekftlixwnNpDs8lPq/MSrtahZmtgXqkiaSekmra1mi0bkXQ08BcLqQkZcoNOxlXskIpWj3EkA/79HEwBuiggID4D7LwghQv4vo2N13mmTo4yIsvw9rUHn/kjGlr188DbHwwgoHJJt8TMxlb6EY3EOvT85TddhCYqJVr8FrCoxcyYoBbXQV6DHAjXMS9s0o0+3suVtlKt9DqzfheHveHqUIDwFWBN76oCAPs2X+XUNCwx48Mu5RJOHYGJNBUCqxeBPgy9a/vMyvUV/M3XqOQ3CMbBDahjo3Q3Nv4HqhKlR/zw9qIZIfy4ihwZNBSUO7GlozD3qVUEZ1vNaNNs0XayVMM93E44IxMzBi2KnMgk7yH/NIuFrujSvDlxS+p4nAXUS+BjYT9A5/xoAydyAxjUW2CwS4+ae+dL5yBCJUbeTI6fQUGWcPOAKW5fKbiI9M7K7xKf2ZlP9dR6c6Dvnye5u1s+X4BtJtH3WouohOBlLZMmchK80JQc++6xCGIUyJkierRlw6+Kfy2XkDNqfIUqgg3hb341hhUDZSII7lPcWvTQX50I9ayXZo2Cuo3+XemH6w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(186003)(66556008)(41300700001)(66476007)(66446008)(8676002)(4326008)(66946007)(64756008)(54906003)(6916009)(38070700005)(8936002)(478600001)(71200400001)(6486002)(2906002)(33656002)(316002)(5660300002)(36756003)(91956017)(26005)(6512007)(2616005)(122000001)(53546011)(76116006)(86362001)(38100700002)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <975DE91281A42E4887C8667EA76214BF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9648
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a89277eb-7de4-46bf-eb1a-08dac0b6a4d3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	upXeqTwcLhi8ByGKHN45yYieefSB4Iqv9vmO9o5MG9/pPDSzT/4rQ8PmDBcM0VQEfngIFr+MxiT+a3VWZT6rPsQ1eMgbGWIFbMUKy8/R7xw/w5VN5O1oPZM4ry2YGTSKVMYGXKj0oiLFQE6hzj7Fv+Lcn1vaLBL3Ak94/rlefFQEBRIZil7qpyYx1fcvJH0sAN3BGtkyh4AtNRPvP180olZbT6FUqSNCZa5ZTzY0mPDWv512n8qa3aVxlBaTrRXciB4bxkXBjPptqEGXQ0WlEH/a9quyg2IJrxajGeG4UYMkAFmy6gUSzFWQVtIo2jZqeZi+SMXODwVdhZQl4lcm1BEr+yfzbN6KAsxAEXFuQLRz18Bv8IqAJzsGlaJcgHv+6AL9mhN7Fgu9CZqlXbAfs+2UUIq/PMo/uju0clqv+6mX8A2Yvq/pdpO7+1GbtR2s0oqXyMYOHRzUdVznxnG4gcPnoPlSZVeb37AO9C5bJPnVsW1S3t32eTr3wykf0gi9+SXje/KQOnpmhA4VgvTNuJ9QEHjtcLc+MSqF7LCI6AkD71cf/GZvWfl8U6FmYAA2Gu2AkWFnI0A08S6f04Of/6tZFOgrDods0nHpObI7RBi+KYq/KsgBG6jWfGgzNWYCrffagUyUfCbrDWCEYBnmLuRZEtUkYBpQiDeSQ1E+d1vFCVpnWh+x9EDgGtzqEb54s673PQ2lF0Ho1suQZK8MUhvVG2xvnrjBT9grmlBBur+2PdZdP0Fq1vJ0iAfhzc55NkRPbow8kbp7laZm39vAEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(8676002)(4326008)(33656002)(54906003)(70206006)(316002)(70586007)(81166007)(356005)(5660300002)(40480700001)(8936002)(41300700001)(6862004)(6486002)(478600001)(2906002)(2616005)(53546011)(47076005)(6512007)(26005)(40460700003)(336012)(186003)(36860700001)(82740400003)(86362001)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 11:53:19.7002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 529cb98c-8523-43c9-1d28-08dac0b6aa20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286



> On 7 Nov 2022, at 11:49, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 07.11.2022 11:47, Luca Fancellu wrote:
>> --- a/xen/include/xen/kernel.h
>> +++ b/xen/include/xen/kernel.h
>> @@ -65,24 +65,28 @@
>> 	1;                                      \
>> })
>>=20
>> +/* SAF-0-safe R8.6 linker script defined symbols */
>> extern char _start[], _end[], start[];
>> #define is_kernel(p) ({                         \
>>     char *__p =3D (char *)(unsigned long)(p);     \
>>     (__p >=3D _start) && (__p < _end);            \
>> })
>>=20
>> +/* SAF-0-safe R8.6 linker script defined symbols */
>> extern char _stext[], _etext[];
>> #define is_kernel_text(p) ({                    \
>>     char *__p =3D (char *)(unsigned long)(p);     \
>>     (__p >=3D _stext) && (__p < _etext);          \
>> })
>>=20
>> +/* SAF-0-safe R8.6 linker script defined symbols */
>> extern const char _srodata[], _erodata[];
>> #define is_kernel_rodata(p) ({                  \
>>     const char *__p =3D (const char *)(unsigned long)(p);     \
>>     (__p >=3D _srodata) && (__p < _erodata);      \
>> })
>>=20
>> +/* SAF-0-safe R8.6 linker script defined symbols */
>> extern char _sinittext[], _einittext[];
>> #define is_kernel_inittext(p) ({                \
>>     char *__p =3D (char *)(unsigned long)(p);     \
>=20

Hi Jan,

> Why the "R8.6" everywhere here? Didn't we agree that the in-code
> comments should be tool-agnostic?

The R8.6 is not tool specific, it is to give the quick hint that we are dev=
iating
from MISRA Rule 8.6.


>=20
> Jan


