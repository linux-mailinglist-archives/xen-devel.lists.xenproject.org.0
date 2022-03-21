Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA314E2CE0
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 16:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293065.497790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKK1-0008Ba-Lo; Mon, 21 Mar 2022 15:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293065.497790; Mon, 21 Mar 2022 15:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWKK1-000896-I6; Mon, 21 Mar 2022 15:51:53 +0000
Received: by outflank-mailman (input) for mailman id 293065;
 Mon, 21 Mar 2022 15:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7HK=UA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWKJz-000890-SR
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 15:51:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1537a2c-a92e-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 16:51:49 +0100 (CET)
Received: from DB8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::14)
 by AM6PR08MB4673.eurprd08.prod.outlook.com (2603:10a6:20b:c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.22; Mon, 21 Mar
 2022 15:51:47 +0000
Received: from DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::6) by DB8P191CA0004.outlook.office365.com
 (2603:10a6:10:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19 via Frontend
 Transport; Mon, 21 Mar 2022 15:51:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT059.mail.protection.outlook.com (10.152.21.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 15:51:46 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 21 Mar 2022 15:51:46 +0000
Received: from f6638d7615c0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37C44294-E424-4D27-93EC-F5228F04E8B7.1; 
 Mon, 21 Mar 2022 15:51:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6638d7615c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Mar 2022 15:51:35 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by HE1PR0802MB2522.eurprd08.prod.outlook.com (2603:10a6:3:dc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Mon, 21 Mar
 2022 15:51:33 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 15:51:33 +0000
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
X-Inumbo-ID: d1537a2c-a92e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO9UQ3ob3jLfGND+gxvmNC+GzyGbY3efxpwulWkAt8Y=;
 b=+CtZY2z3mj0nhqgjg4ACH1jlXgzbcFKXK2NsloUFkYi7b3gHe742MSvfXM1uP86aNhicGzUMkEObb+sJzPRIDt1kcYnQ7grAMdqEq2CibZDeeEvU+FfuTiRBE6/HqzQb4x4vhHw4hWxZ5kuQqTn6i5lI5d6lGYzKS1qJdCaIC9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3a531fa364348c54
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYwIbFtut9CGV8wj3uXn4907gbttPuWOYQPUtSUi7JXozW19/WtETS5YhxNTJSqsXbnkBldPM7gkQrrRJ20l4PGnotX1UR9WdHHO7iCuWYqbopKubsOrRzF2M7Qvgf8rnVxlJ/DDOQRXwszIJzKbuUCtgNVG66TQUvOogsOI4/3blnF/eyNhM2+nsvQFFy4iHWsT5rAv7E404Gl4PHbeK7U7Eqv38yomRhsyTGQtSQ3c8uMchRKPMjUj5PY/TypYMgxkRmqJV+AoSi6wbwhb4c4bx3mDVys5T2zwHbZ+VnIjh6FkPgs4u1XRXCTfLI+Moxw1Tn+ozu7a2PDex5iEmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO9UQ3ob3jLfGND+gxvmNC+GzyGbY3efxpwulWkAt8Y=;
 b=ghpMW2Fj27VLYBbS1xGZjbdtWijkNVDVlEGknDVqNZKaCYuKvXcEROmdKUI0riCVBfCwe5gN8UvnlI5ZYzEv45tiKRy7DbMtYz94SLavnrgc0rL/mYdeew/ZjNbP9FobpzTDU7KNF21AqH9be+u8CjzN2dj8JyiJval73HOUAG9i5mgqb8/1sB+xVvSoDGbUyMyKwpfQ9sH/XSykI3NweFeyArHqTd+KuR6rl03DhRZc6S1XIUE7quASenDl/HrXS9RkPSkuBbfdSO9uUTrTbGPjKUQesDV6hDDBZnJI26pkLVnhWik7vzfKM5BDdv7A0t2g2zfadW7Bt+r1UdyZ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO9UQ3ob3jLfGND+gxvmNC+GzyGbY3efxpwulWkAt8Y=;
 b=+CtZY2z3mj0nhqgjg4ACH1jlXgzbcFKXK2NsloUFkYi7b3gHe742MSvfXM1uP86aNhicGzUMkEObb+sJzPRIDt1kcYnQ7grAMdqEq2CibZDeeEvU+FfuTiRBE6/HqzQb4x4vhHw4hWxZ5kuQqTn6i5lI5d6lGYzKS1qJdCaIC9Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index: AQHYOtySiWfuTiIQkkqv44WbBvDftKzJkVgAgABwAQA=
Date: Mon, 21 Mar 2022 15:51:32 +0000
Message-ID: <9F79D423-E65A-484C-BDC7-4C701239920E@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <d16f98aa-8307-3add-8253-0616cf5ba2b1@suse.com>
In-Reply-To: <d16f98aa-8307-3add-8253-0616cf5ba2b1@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 705d2db1-e3bb-4345-5613-08da0b52b464
x-ms-traffictypediagnostic:
	HE1PR0802MB2522:EE_|DB5EUR03FT059:EE_|AM6PR08MB4673:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4673B4BA1E5A69C3B07DEC97E4169@AM6PR08MB4673.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NT2gQVI5KZZjLjvr/hfjgpgLJWSZvNql5vYZTOcWvU5yRdPlR/Mb/oTSpnEFosmaLF7GACFN4kDcilJME6qbV6R3WYd5Heez7gFiFwOF+Fa8VMv7DvJ9fPDgocynnTm4/Ep2IB2EQT9Z8l1vKuMSU+f4jUJeRfKmr5EqsJXZV9o0LIwSSpnXeKnWSLtOO5I7VFQred0pfS0IFSLLPgP4p/hFSS4WaxoNinYdhT92wajiEdLDFFg7RTlEq+Uc6y6kyWZ6ocUFs5tilNEbRGcDeAQcOlCsk+U45yFtATTwZvE4UKm/mz4oSjF61GrVXJwcgVIQmr7ietE8hXqFtr4u2Z7EFAL0oM+NnegRiMR1zyYLjrQc7EWvljGWrrIYF8cXAR3Z3wnroxqOrTHDn6I2s6P8h1Puu2yCYH6VXxI9eSuXe9VQc/SSr4hA+jlzIn447Bs+SciSc9hjaVvj+jL2AckquS8E2Fh53BbTeSkPSoLkYZ7vKFT4r4A9J4M0esl5c6iLM36z7YQBl4ZoVHWsdPa8vpuMibWk5esCMVr4sAQNkFPuVOVvK6O1c/lIAw1E9lxq9578N5schvqbfUgWEPcIOL8jKGurlasEt/d7LeY9Wq8liuDfYtiqfq665MfWy6GmxIk0BYNzocT3Z9E9HeC9GlPUUwYbc9APD0hnK8GEjcbKosuzzdyxdYjETwza5lzBQphoSJj6lRTbeHQL8ApdP2De+A3qbAsT8g+CrxsrtxO8yWM/JBQNLbxoJmia
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(26005)(8936002)(54906003)(5660300002)(33656002)(6916009)(316002)(36756003)(7416002)(86362001)(38070700005)(2616005)(38100700002)(76116006)(53546011)(6486002)(122000001)(71200400001)(6512007)(66446008)(66946007)(64756008)(66556008)(66476007)(8676002)(4326008)(2906002)(508600001)(6506007)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B2DB7D2496275C448F464FBD91C07CFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	89deaa24-a8c6-42a6-f572-08da0b52ac31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zY0iLQoCNML5/Gf/4r60s36phXuKewVREWLf/Pl7xBcBNc6yeFjaIG42ab8nki1114PXuZeJhw+lasQSbO+IWSl/6kvnd04ro40Qe6Qn4MwWK+f+hUlzgKwV0WDboq/OZZKBb57NEL/9Bl9RSOI/QtIzppfR9qI8wNvixB8MWs5/S7bN0sgzWSB8NjsBa5bicRQCAv4D6G4NbodfDyzPV0Fmrz74gu6JA5icsXsLVOTGGHlsJ2in902SI7BF1VQAZDr9w0CT1E4C0qI3Q1twAi+3xYzisIK7cP5Wi4ELjpVHAH6uE76nKocg4VQ52FDLJrbbQEmJMp4xO+sPKE/LPbWUrFXk98PBI+K2r6sC1Wb49FUbbQK/p+vkCjQia61M+TJ3HEaFw9WZAzn6YQwFv8Vc2hfE9VKYfrFqRnupAt51CG5yXhC4KC3O6J39XjjhbzDb0oiiAOXhuR5PVba+OpN0aVyc9L2996LcSymcXf3O4YVh9v2DKSZsagfXv2Qxk1H2l/KM9Tf9fvHlK4p1is81iZ6XhpopSumPopeVzUBnMk5PO7ZtYB+SCQYQ78o7JSJljPHRoVB5QdiOaPOHIPnT0vhK6Pr2FFrpD5YidMMvbqdLgLTJ3tdKuOs5SlLB2NcT4doc8Gdup0FfRf6Y+CptJBkVLB2oaN9MbkuClIml8OpHDYbGbshupkeDe8PW
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(81166007)(53546011)(356005)(54906003)(2906002)(6506007)(6512007)(36756003)(33656002)(508600001)(36860700001)(40460700003)(6486002)(6862004)(316002)(47076005)(186003)(336012)(26005)(4326008)(70586007)(70206006)(2616005)(8676002)(5660300002)(86362001)(82310400004)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 15:51:46.8044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 705d2db1-e3bb-4345-5613-08da0b52b464
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4673



> On 21 Mar 2022, at 09:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 18.03.2022 16:25, Luca Fancellu wrote:
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -1,5 +1,6 @@
>> obj-$(CONFIG_ARGO) +=3D argo.o
>> obj-y +=3D bitmap.o
>> +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) +=3D boot_cpupools.o
>=20
> By the looks of it you appear to want to specify boot_cpupools.init.o
> here: All functions there are __init and all data is __initdata. That
> was string literals (e.g. as used for printk() invocations) will also
> move to .init.*.
>=20
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -1176,6 +1176,25 @@ extern void cf_check dump_runq(unsigned char key)=
;
>>=20
>> void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
>>=20
>> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
>> +void btcpupools_allocate_pools(void);
>> +unsigned int btcpupools_get_cpupool_id(unsigned int cpu);
>> +
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +void btcpupools_dtb_parse(void);
>> +#else
>> +static inline void btcpupools_dtb_parse(void) {}
>=20
> I think you want to avoid having two stubs for this - one here and ...
>=20
>> +#endif
>> +
>> +#else /* !CONFIG_BOOT_TIME_CPUPOOLS */
>> +static inline void btcpupools_allocate_pools(void) {}
>> +static inline void btcpupools_dtb_parse(void) {}
>=20
> ... another one here.
>=20

Hi Jan,

Thank you for your review, yes I will fix your findings in the next serie.

Cheers,
Luca

> Jan
>=20
>=20


