Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E32745A602
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 15:46:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229668.397171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpX3E-0002UQ-AC; Tue, 23 Nov 2021 14:45:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229668.397171; Tue, 23 Nov 2021 14:45:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpX3E-0002Rk-7C; Tue, 23 Nov 2021 14:45:40 +0000
Received: by outflank-mailman (input) for mailman id 229668;
 Tue, 23 Nov 2021 14:45:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6oU=QK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mpX3B-0002RU-Fm
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 14:45:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe07::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0475581c-4c6c-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 15:45:36 +0100 (CET)
Received: from AM6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::26)
 by AM0PR08MB4403.eurprd08.prod.outlook.com (2603:10a6:208:141::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Tue, 23 Nov
 2021 14:45:32 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::ca) by AM6P191CA0049.outlook.office365.com
 (2603:10a6:209:7f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 23 Nov 2021 14:45:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 14:45:32 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Tue, 23 Nov 2021 14:45:32 +0000
Received: from d764d2ed4d3f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B81F37D7-280A-4DA8-BE04-9937953CE072.1; 
 Tue, 23 Nov 2021 14:45:20 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d764d2ed4d3f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Nov 2021 14:45:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3367.eurprd08.prod.outlook.com (2603:10a6:20b:44::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Tue, 23 Nov
 2021 14:45:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4713.025; Tue, 23 Nov 2021
 14:45:16 +0000
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
X-Inumbo-ID: 0475581c-4c6c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDPhrhNp8c4RyScvZPAQiS28zsf54b2antgvUA/wqDY=;
 b=K6ZWsyl6R9irEqxGr3XGqPFjHRKvrlmCykBotNVVoNZ+i+HPnZIExEEDZDTIXmXKxtXyXCNd7CusRHVzNP3UqBoK9ZHJrctBGOJCHNiCpYmz5kFz/I/0YahnwqVZ3nglCEVnPmiK4hp5WtM6YZv0W4Qhib48T54qHMjORteJfEc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f013f2b427da65a4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqF79gkG+P/2bMMq81uOoODLscnDrmgjCmXXXbqyaaOrvvJ8SqiVTls+3CZWMiUYjVWFA5/Z7SJNeyrze7qAcIlzhaIC+rrtCArX/BkQJ5ZA8hGKzWbgHogyzxwMuVMpZaxX2p5eN/LYolHMQ0BGWKyOkfJLWZG/243rum+JjfJO2AGek6hofpW5HmX2g+4OlNjUgERhnu3ALHHIq+URrDDTzHAR7aEOkufaBef2nNigB361kRkBT90Jk8DVworanPJqlQ4tyrdKJcPbUUjLJ0XU+pLd1uuU5vUc86/RupldyJyuWHSAWbVIhrR6ePagKIHiYtLyvrYBcG3Aoto0Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDPhrhNp8c4RyScvZPAQiS28zsf54b2antgvUA/wqDY=;
 b=YuW90gdT5QAKd2JXHIJENpa4pKSThTtsuUNur06TqaDoQ9e0nkTDbeObnbN07qPxRTDmQQBFa46297NP2+ZBdWqTjiS+okwSRMl8EADiY8BPNo0fM2Plq2jbkIATA30Uwtf363idJSY0M99FMeMf/gL9fUgPO90E6I5yDnw2w6QQ1zqmVApJ/TK7Nm9V6u3QEqEoWJWj/q2RzpYtYhC761y7GaRb2zfMvtvz9AWE04a4JsyW7nltq5lrCIeaZt8yY2PXGbT9cmRyJR+wAKaSJoBUmolCs2D2fDvDRELsdmSNfAbc0UStP4vxvhNBLXBLErQ0fARnujWXyxnSwrD9YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDPhrhNp8c4RyScvZPAQiS28zsf54b2antgvUA/wqDY=;
 b=K6ZWsyl6R9irEqxGr3XGqPFjHRKvrlmCykBotNVVoNZ+i+HPnZIExEEDZDTIXmXKxtXyXCNd7CusRHVzNP3UqBoK9ZHJrctBGOJCHNiCpYmz5kFz/I/0YahnwqVZ3nglCEVnPmiK4hp5WtM6YZv0W4Qhib48T54qHMjORteJfEc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Luca Fancellu <Luca.Fancellu@arm.com>,
	Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
Thread-Topic: [RFC PATCH 0/2] Boot time cpupools
Thread-Index:
 AQHX25mOHH0z58pAdkqC6AziO7R1GqwHg+AAgAAN94CAAAkVgIAABTgAgAB2SICAAHfeAIACmeEAgAAOqoCABfUlAIAADkaA
Date: Tue, 23 Nov 2021 14:45:16 +0000
Message-ID: <75B06FD4-B2EC-4C93-95B1-8E3C9A181913@arm.com>
References: <20211117095711.26596-1-luca.fancellu@arm.com>
 <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org>
 <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com>
 <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org>
 <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
 <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
 <17cd2c69-56cb-15b9-d381-f854aea55d27@xen.org>
 <alpine.DEB.2.22.394.2111191052050.1412361@ubuntu-linux-20-04-desktop>
 <d1139023-6788-2c58-5873-327e0917f868@xen.org>
In-Reply-To: <d1139023-6788-2c58-5873-327e0917f868@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a038824d-49c6-41bf-6ad6-08d9ae8fe6ca
x-ms-traffictypediagnostic: AM6PR08MB3367:|AM0PR08MB4403:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB440316BBF1D3537EB33AA6349D609@AM0PR08MB4403.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zhewgHgrYHrlgM21QZA5OvGin/iay3equIGUyiMgyGVgDql5R5K+CNmL1QwEFn14n3W4WZVrMNS2hqwS5eshtXOk/3b759Ml3Tmn2fr8wJavqmLT7l1mmxELkGvMMFS2gpAWjzAr8pbpC5q2eO/eBXHM74K0UmDA0bX33WoUq0n9b8eSN8c8P9/WoyJvk7OuerPSls157pW7J5S4jRK6JHHOk3BVKllDK2w8Tg7ma/urBXr5QCOIUOEXlwaciLzwoCaQffxfPHA0/inia1F46i+zP8QwZY+FZGRAGH4JWx1YlWq/6BSZsT+n6pLlsU1Ik9u7ilYgTOc4Rw7875mlcIiAFuozZuOpETN5C/Pht4cpufnhkYbx1nbruWCuVNT22vgNiESmKLoi3kRLzEOig67or/XXw/YLYkBcrrMxMjN+Rv74iepBOrtcNKsOwuCw1sh/JHMnYG37BMBiiriSvAJ4/nRXevovxhVru9PROkila4OrzuOPa0tjWF8knL+iBkqVnDgxj5KW6JZHImJ1KT7kXZzRi1NfWq9FfI2tDJ7Betze1l8zadJOzqDOsOlyOY7D31l/u9ZfgYkJ+X5hqAByhNiMQnkQsu+wXcBGZv8iTC3ZsIVb14ARrajKi8CcdgZu2bJMkixPjjZBfCJ+WmYtDqFpegSqwkPkBcHZml6hvG/3UCAZ3pPT2AA/dyMOTCZp8dyJxpeebLvPDmRfhqxHmPMQ9RoSQuGn9QFqChWBRiblklRC25r/9Qge9K2m
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(186003)(86362001)(26005)(2906002)(2616005)(76116006)(38070700005)(91956017)(6916009)(8936002)(71200400001)(66446008)(64756008)(66556008)(66476007)(54906003)(66946007)(508600001)(316002)(5660300002)(6486002)(8676002)(53546011)(6512007)(6506007)(122000001)(38100700002)(33656002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6787D72FCAB7740902413998A0D7865@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3367
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26f2d739-107a-4ffe-ed6a-08d9ae8fdd56
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sdqcJiPxR1jRaI+EKarlMfF/WGpBjeUosL5e/lPGETrGaXerWocoWFiIJ0fTI4I+wjLS8Rr5jYUNiGHyXqPhDUcE51Gf7dH0qTQP48pT1FPJg7vDHIiHNAjz5j/ECXWZSlwHUEbqbkWuTNup7tiQzg6K+aueriSuRHnZFtJE5lSJ7s5m97q0tunogBKjiCD4kapCYikeQrqdiIFX1vrmcaCCs4cAC6Y4Yaz8Tc9HmRcGTISO+9WJowaRBJNLnPNRNtoaJeaL6UhDTLK/1uMaKYRjb+dApmou52iWtYfAUi6+vHZ/v9Q5E2SykuHhaoN658eOcC4TlX71gJxk04VfJ57Jh0wwqpxaneOyrJEIGjP6bPgY3kINleqANDJVDnFz5A9Iod32MdCCJxr9IOJeDQUEgjdUDTr4agep4X9jkGNoqFNEZkgouh3am6SOJMNgkM0dggDoOgstIre2CKRjwPD6F4xUQhb/cqiPJ644+U+eNYHxLNNwhy8eeKJPOjixYH2OlDtDWT6ZNFOb3JXSoYaDJSPPhzU1tlSMl/NG52yQ0K1vhdKAFIqzdUNLcVTJZ/S77WiEH+jHsYg1IpCd7+0m1bYEMHiVHHveCebokSgayw0X4z/eusjBmmHSTXWrvKA1OOlqQ3xqEx7ofcvEHz/YqJjNQoI2YeoxCue2RGFgfb7qPLMmFK8mJ9fcSn8ZQcm5PJMaO5G3A4YIBKvRBA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6512007)(86362001)(356005)(26005)(508600001)(107886003)(186003)(47076005)(6862004)(316002)(33656002)(6506007)(8936002)(82310400004)(53546011)(6486002)(4326008)(70206006)(81166007)(36756003)(5660300002)(36860700001)(2906002)(70586007)(54906003)(8676002)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 14:45:32.4617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a038824d-49c6-41bf-6ad6-08d9ae8fe6ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4403

Hi Julien,

> On 23 Nov 2021, at 13:54, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Stefano,
>=20
> On 19/11/2021 18:55, Stefano Stabellini wrote:
>> On Fri, 19 Nov 2021, Julien Grall wrote:
>>> I like better Juergen's version. But before agreeing on the command lin=
e , I
>>> would like to understand how Linux is dealing with big.LITTLE today (se=
e my
>>> question above).
>> I also like Juergen's version better :-)
>> The device tree binding that covers big.LITTLE is the same that covers
>> cpus: Documentation/devicetree/bindings/arm/cpus.yaml
>=20
> Are you sure? I found Documentation/devicetree/bindings/arm/cpu-capacity.=
txt.
>=20
>> So basically, you can tell it is a big.LITTLE system because the
>> compatible strings differ between certain cpus, e.g.:
>>       cpu@0 {
>>         device_type =3D "cpu";
>>         compatible =3D "arm,cortex-a15";
>>         reg =3D <0x0>;
>>       };
>>       cpu@1 {
>>         device_type =3D "cpu";
>>         compatible =3D "arm,cortex-a15";
>>         reg =3D <0x1>;
>>       };
>>       cpu@100 {
>>         device_type =3D "cpu";
>>         compatible =3D "arm,cortex-a7";
>>         reg =3D <0x100>;
>>       };
>>       cpu@101 {
>>         device_type =3D "cpu";
>>         compatible =3D "arm,cortex-a7";
>>         reg =3D <0x101>;
>>       };
>=20
> I have not found any code in Linux using the compatible. Instead, they al=
l seem to use the cpu-map (see drivers/base/arch_topology.c).
>=20
> Anyway, to me it would be better to parse the Device-Tree over using the =
MIDR. The advantage is we can cover a wide range of cases (you may have pro=
cessor with the same MIDR but different frequency). For now, we could creat=
e a cpupool per cluster.

This is a really good idea as this could also work for NUMA systems.

So reg & ~0xff would give the cluster number ?

We will probably end up splitting cores into different cpupools even if the=
y are all the same as there are several CPUs having several clusters but th=
e same cores (I recall some NXP boards being like that).

Some device tree also have a cpu-map definition:
        cpu-map {
            cluster0 {
                core0 {
                    cpu =3D <&A57_0>;
                };
                core1 {
                    cpu =3D <&A57_1>;
                };
            };

            cluster1 {
                core0 {
                    cpu =3D <&A53_0>;
                };
                core1 {
                    cpu =3D <&A53_1>;
                };
                core2 {
                    cpu =3D <&A53_2>;
                };
                core3 {
                    cpu =3D <&A53_3>;
                };
            };
        };

@stefano: is the cpu-map something standard ? Lots of device trees do have =
it in Linux now but I do not recall seeing that on older device trees.

Maybe using cpu-map could be a solution, we could say that device tree with=
out a cpu-map are not supported.

Cheers
Bertrand



>=20
> Cheers,
>=20
> --=20
> Julien Grall


