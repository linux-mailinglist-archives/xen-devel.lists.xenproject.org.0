Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D959D148
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 08:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391678.629601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQNRY-0004cs-9B; Tue, 23 Aug 2022 06:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391678.629601; Tue, 23 Aug 2022 06:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQNRY-0004b1-5z; Tue, 23 Aug 2022 06:31:20 +0000
Received: by outflank-mailman (input) for mailman id 391678;
 Tue, 23 Aug 2022 06:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Ia=Y3=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1oQNRW-0004av-Jv
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 06:31:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2052.outbound.protection.outlook.com [40.107.104.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ffa76f4-22ad-11ed-9250-1f966e50362f;
 Tue, 23 Aug 2022 08:31:16 +0200 (CEST)
Received: from FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:97::9) by
 AM9PR08MB6100.eurprd08.prod.outlook.com (2603:10a6:20b:287::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Tue, 23 Aug 2022 06:31:13 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:97:cafe::1c) by FR0P281CA0123.outlook.office365.com
 (2603:10a6:d10:97::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14 via Frontend
 Transport; Tue, 23 Aug 2022 06:31:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Tue, 23 Aug 2022 06:31:12 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Tue, 23 Aug 2022 06:31:12 +0000
Received: from b5b57b3ab0d5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76A18032-EBC2-4C12-BEB7-0FBB1E9DDFF4.1; 
 Tue, 23 Aug 2022 06:31:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b5b57b3ab0d5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Aug 2022 06:31:05 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by AM0PR08MB3636.eurprd08.prod.outlook.com (2603:10a6:208:d4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 06:31:04 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::48c7:a78d:1802:5c35]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::48c7:a78d:1802:5c35%7]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 06:31:04 +0000
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
X-Inumbo-ID: 2ffa76f4-22ad-11ed-9250-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O4o390VE/hB7xqYh0xgi9j3Ix/MzMtOboOK4JLDeJaP0LHAm/PeqZYrMdhPppuSW37BA9JElfujwfuojHnletQJutrNniZcbE/B459Fi6T2ErXm06mSB0nKionJR/l7KCtVwvFBW8CXM0FTAfm0EuoZLTwkfhB8yQLWOlJ1vfqGfYFauyIMftacgyoYNnPQNtPZj1tGGGMNC9ObSwUFUJhRvRmq9E4lPS5jP/5SGs2VXLg6yeOdXA7IDnlPX1zAA+4/xGMYkYFH1ndPymMxgI76/cBfBDbd1h5VVVBsFkcSHv/5T7SyYDkVgboRIIQFue33Wqm7tOQgVU5OUmm55GQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkK6IIE3vSv9kfEftV9adnMM4d1GttRXHN0gg6N69KM=;
 b=FSBN0sFM9HkfK6FD6vWQtIQUk0Y4muAIfVhevYliNUU4bqifeV/d4exAlOr2N0sS+yIX2ZRkRASXUVBswVPkfgc+uZAum5AOPNxRmJcNxSg2nO1YbHeoI+8A30r7RKtYOq5UwDN8VxTjZjOXkLBjNYIf9VcGXOUW37GYJmTHhT0IQp3/pZUbEtFGFdo0/6g/9VprU4YXVOaijkibmWp1nwdNYd2anJxdKRBnniPt7TQPWoEwSWz3GsVWCdHURzkcd25HyKEV9j6YyJoykFKAJ26uB+fG0QUknl2GHP6pVC7lAQaw9yKdcuCycP/BrR27Ir305e7u1qAY0LLmJepzWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkK6IIE3vSv9kfEftV9adnMM4d1GttRXHN0gg6N69KM=;
 b=uYEWriAYcPgzUMnFkCj3wEsoNQe4pC6ynY/BbQQ4YcBbHDsDD/KEUyXdSSjKL+DcpU43CAIHjdeEtWo4R7OuwhdaqaeOfw77CTqmwV1WQSzRTMuzl5dcw98BqaZzLX/+d7cVSWsqV9G6K69EpGgI2HPnvgEOqOsQ6Jn52VlyurQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=go5+VR9YQQbrbfSQpUmla3icoQeAo7V01a097zv20s9miCjlXF4YpR1Emrle9mUFyUeTxQyNonTJEVupAyg5VkI4nFlEk2LyngF4QplNh2Hwq7La6zgMU7cSRoSL8I1cQz32Nlq44MO3mtYFlLagPeapTM1Sg98U7vAPve0hxI0iJhzdFmCbRp5TRXSZNKajrtmx52WUlkl+mqNFeos1v1oRmuAPKrRPzc1Zxu9ZMWYUzOuTCBwVMSObF35orLLue3nuNIjzeF8HO2m+m/N2h6EhfvjMbJVGSk5X8nQqqisBjIHiFP8i0jia3jtCnhm+KcynlFn6Ix5/MoiuHxmH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkK6IIE3vSv9kfEftV9adnMM4d1GttRXHN0gg6N69KM=;
 b=O2hf5E4FIq9EWN7A9ewZxFy2WPFU1zdE9kJtPwJnpVMtWiJK0aljuZpHj89/NYQTfmCNeZuBIO9oMNugdqz86opM+d+lKsqL9uWVWuzVJi/nH5pvsMR5R+7yytTMb6+eF+PTtFwJyhSl2EVuf2paSagmwdSR3oQzd4Dju8bzOP2WKRkajvSC+/uzZLJN0SNuX4hBTOQr+7w+LCPNCl59vhVwFnPXJ/neSQLO907WOG3A0Oxdnumj5z6P+2gpe0DyJTTRCitmkOcZ01jrP+4Ghcij2e7LrRmaJbHDFgaH4yFF8rbGYwiMl7vtNcTQRhUlfbemKpCAg6swXBPv79Ty/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkK6IIE3vSv9kfEftV9adnMM4d1GttRXHN0gg6N69KM=;
 b=uYEWriAYcPgzUMnFkCj3wEsoNQe4pC6ynY/BbQQ4YcBbHDsDD/KEUyXdSSjKL+DcpU43CAIHjdeEtWo4R7OuwhdaqaeOfw77CTqmwV1WQSzRTMuzl5dcw98BqaZzLX/+d7cVSWsqV9G6K69EpGgI2HPnvgEOqOsQ6Jn52VlyurQ=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Wei Liu
	<wl@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: RE: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
Thread-Topic: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2
 extended input/output registers
Thread-Index: AQHYsvEzozgpQMYVfkmR/IQ18gBgzq28CS1Q
Date: Tue, 23 Aug 2022 06:31:03 +0000
Message-ID:
 <AS8PR08MB76966554BF5B1FC83228BB6B92709@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-2-jens.wiklander@linaro.org>
In-Reply-To: <20220818105601.1896082-2-jens.wiklander@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 31334C768AEA284FB12F2D8D7EF0DF5E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 57305467-7a40-44b5-8a31-08da84d112f2
x-ms-traffictypediagnostic:
	AM0PR08MB3636:EE_|VE1EUR03FT052:EE_|AM9PR08MB6100:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ke7ZfBHtlLY3fmJzWDAPrDU+hUS590EZzmh9TJkJVMELoutNoCZKkZkzxjLCcyY9uAIfJTjNhq3Z/CdjXPqMdRHjqWumRtpDOJe1lcTW7fMEJJSsdaZox3myAa1P1kOXI+IkVNpTaa/krTUqevMwXN/X7k0omrVCu4+43e3IzeYNzwMOizEgGlnmrauSxdVVrc+jKXX+ABXfWQZhq9daTdmgHEJpfMul56vTlPdcMqgQLf8uzS2XspuFX97qIGx3sgyI7m64F26zkvoJz4vybCZQuHSUaayd922XN8pJCeARTU5DlaAhWvFoJbIlNqZOI2tgowLTEUW6vUO6sRDwsbHpZBWhRfUC/o4jZTOYiN5EHJv5EcYjgennXouhgvL4NZLuGI7r94M8beHmgZ/+dkfWKNB9QhhR+3qSyTpUodjjXGVU2M8uQ+soyfGgsLylcQoT5c2pHQqcsYGK8K8TtynJSv3rxLW35USi73vNEb80AHHC+5lkVBSL3i2STpD/E7niT16aPVaYOvGkNRuJqFCN9BCKrSh3+V0aS4Ct0ynq9oyz142LgkKS4C2+Jd+ipQn/PTzwXIGHvlW+6nCPf6Rz6QGM09sPyo2VXRwDU2dF4XlkFd9AweqWscCM5BKblUov6NjvW3LN85YV0LMysAFWQA9lZznafCayCwvoYk5HC68zlgjhbxNAO5h90yOYiYsrvmva5rrOhr/8TQ1lotpRkzN+4QWkmLv9vxsQ11yJEuGZC5bbzBsUjhOEskT5ljGL9biHy7lTVPpA69a1WWvCpdHi2kI0fhIjpVCSbU8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(52536014)(316002)(38070700005)(110136005)(54906003)(33656002)(86362001)(122000001)(38100700002)(41300700001)(83380400001)(478600001)(6506007)(7696005)(26005)(71200400001)(966005)(55016003)(9686003)(2906002)(64756008)(66476007)(66556008)(66446008)(76116006)(8936002)(66946007)(5660300002)(8676002)(53546011)(4326008)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3636
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c0ca5303-2cc7-4b51-fcad-08da84d10db0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Re+GLskWgsVztq1HEZu/XXEBw0mNsIlpZz7ps5Dj54ucSq1qEF8zlhgLp+LIGJyOel//EM2a4qA3NvUJE+zJhJJJ1UidaF8+31pMeCa//tZ4tlaDTBormD/0+dhmZk8L4xi4TiGXuHqWZ5VA5zKsA+KzT/e0vf+b+anHJxtFy+LeYEnjZ+Tq3qAAg4NNIKKr85U3YxycNj6hldOv4AaE+oU+Jn6ZdggxO96UoItO0mQ+XdVWo5R6xyGjYaisacevvmjkiT7tLrvGXM7vUPvkTi27mjCXofOxG4wrI1PIjFLV0a+0fwXfJnv/a4zd1Xlrm9NGGLWL0I7+KAJLZjC8XqjGnoWBDvp449nwVvsvu+wnAXEV2oFB/kxd2SosMSg2XiS6KvBNn1bdcKLRi2I4av1586nv2NYI3pWvfqj3un45iwri7D9MMMi9yUwxkPfKMi7HkN/J+psA4azvlyPixENnKFp6LYft47wfJUOvqXlqPUEnPEab504f2pGvuIIpI/KHApEsLUrLMhBf8eZiRQcB6uowbzdZ5rvSi2wK/rqzmpsTYvHR5iuBAqtzBPJmslrT88I/7iHtj/GmxPlN2EOPYXh+Lk4u7WC5Mbt/ABukf/622YYV8a3oTAU8xIFFa+hniGr24a/ATV58XbvOLWBN5hnGDFAfff8luYxBxElss5L7FX3sieg/M73PZJSfVUQnZ50Z73954ZMUvnTKgVyx//adpvJQznLSSa2Fekp21eZAts/57tJYLmOJpGCe71xAtDHSFCuYwu4WGlkDZQOja+w4qb2/wzGfAoc5fc8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(346002)(376002)(40470700004)(36840700001)(46966006)(52536014)(83380400001)(47076005)(82310400005)(5660300002)(2906002)(8936002)(8676002)(70206006)(4326008)(70586007)(9686003)(41300700001)(53546011)(7696005)(26005)(6506007)(33656002)(336012)(478600001)(186003)(966005)(40480700001)(55016003)(356005)(40460700003)(36860700001)(86362001)(316002)(110136005)(54906003)(81166007)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 06:31:12.5856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57305467-7a40-44b5-8a31-08da84d112f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6100


Hi
I build and run it on armv8a, and start dom0 with two cpus. Cpu off and on =
tests passed. It seems it don't break current cpu basic functions.

Best wishes
Jiamei Xie


> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Jens Wiklander
> Sent: Thursday, August 18, 2022 6:56 PM
> To: xen-devel@lists.xenproject.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen=
.org>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Bertrand Marquis
> <Bertrand.Marquis@arm.com>; Anthony PERARD
> <anthony.perard@citrix.com>; Juergen Gross <jgross@suse.com>; Wei Liu
> <wl@xen.org>; Jens Wiklander <jens.wiklander@linaro.org>; Luca Fancellu
> <Luca.Fancellu@arm.com>
> Subject: [PATCH v5 1/9] xen/arm: smccc: add support for SMCCCv1.2
> extended input/output registers
>=20
> SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
> registers and result registers for the SMC and HVC instructions.
>=20
> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> parameter and result registers.
>=20
> Let us add new interface to support this extended set of input/output
> registers.
>=20
> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> extended input/output registers") by Sudeep Holla from the Linux kernel
>=20
> The SMCCC version reported to the VM is bumped to 1.2 in order to support
> handling FF-A messages.
>=20
> [1] https://developer.arm.com/documentation/den0028/c/?lang=3Den
>=20
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
>  xen/arch/arm/arm64/smc.S         | 43
> ++++++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/smccc.h | 40
> +++++++++++++++++++++++++++++
>  xen/arch/arm/vsmc.c              |  2 +-
>  4 files changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-
> offsets.c
> index 280ddb55bfd4..1721e1ed26e1 100644
> --- a/xen/arch/arm/arm64/asm-offsets.c
> +++ b/xen/arch/arm/arm64/asm-offsets.c
> @@ -56,6 +56,15 @@ void __dummy__(void)
>     BLANK();
>     OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
>     OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs,
> a0);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X2_OFFS, struct arm_smccc_1_2_regs,
> a2);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X4_OFFS, struct arm_smccc_1_2_regs,
> a4);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X6_OFFS, struct arm_smccc_1_2_regs,
> a6);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X8_OFFS, struct arm_smccc_1_2_regs,
> a8);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X10_OFFS, struct arm_smccc_1_2_regs,
> a10);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs,
> a12);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs,
> a14);
> +   OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs,
> a16);
>  }
>=20
>  /*
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index 91bae62dd4d2..c546192e7f2d 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -27,3 +27,46 @@ ENTRY(__arm_smccc_1_0_smc)
>          stp     x2, x3, [x4, #SMCCC_RES_a2]
>  1:
>          ret
> +
> +
> +/*
> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> + *                        struct arm_smccc_1_2_regs *res)
> + */
> +ENTRY(arm_smccc_1_2_smc)
> +    /* Save `res` and free a GPR that won't be clobbered */
> +    stp     x1, x19, [sp, #-16]!
> +
> +    /* Ensure `args` won't be clobbered while loading regs in next step =
*/
> +    mov	x19, x0
> +
> +    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
> +    ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> +    ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> +    ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> +    ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> +    ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> +    ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> +    ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> +    ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> +    ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> +
> +    smc #0
> +
> +    /* Load the `res` from the stack */
> +    ldr	x19, [sp]
> +
> +    /* Store the registers x0 - x17 into the result structure */
> +    stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
> +    stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
> +    stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
> +    stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
> +    stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
> +    stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
> +    stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
> +    stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
> +    stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
> +
> +    /* Restore original x19 */
> +    ldp     xzr, x19, [sp], #16
> +    ret
> diff --git a/xen/arch/arm/include/asm/smccc.h
> b/xen/arch/arm/include/asm/smccc.h
> index b3dbeecc90ad..b5e3f67eb34e 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -33,6 +33,7 @@
>=20
>  #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
>  #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
> +#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
>=20
>  /*
>   * This file provides common defines for ARM SMC Calling Convention as
> @@ -265,6 +266,45 @@ void __arm_smccc_1_0_smc(register_t a0,
> register_t a1, register_t a2,
>          else                                                    \
>              arm_smccc_1_0_smc(__VA_ARGS__);                     \
>      } while ( 0 )
> +
> +/**
> + * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
> + * @a0-a17 argument values from registers 0 to 17
> + */
> +struct arm_smccc_1_2_regs {
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long a8;
> +    unsigned long a9;
> +    unsigned long a10;
> +    unsigned long a11;
> +    unsigned long a12;
> +    unsigned long a13;
> +    unsigned long a14;
> +    unsigned long a15;
> +    unsigned long a16;
> +    unsigned long a17;
> +};
> +
> +/**
> + * arm_smccc_1_2_smc() - make SMC calls
> + * @args: arguments passed via struct arm_smccc_1_2_regs
> + * @res: result values via struct arm_smccc_1_2_regs
> + *
> + * This function is used to make SMC calls following SMC Calling Convent=
ion
> + * v1.2 or above. The content of the supplied param are copied from the
> + * structure to registers prior to the SMC instruction. The return value=
s
> + * are updated with the content from registers on return from the SMC
> + * instruction.
> + */
> +void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> +                       struct arm_smccc_1_2_regs *res);
>  #endif /* CONFIG_ARM_64 */
>=20
>  #endif /* __ASSEMBLY__ */
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 676740ef1520..6f90c08a6304 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>      switch ( fid )
>      {
>      case ARM_SMCCC_VERSION_FID:
> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>          return true;
>=20
>      case ARM_SMCCC_ARCH_FEATURES_FID:
> --
> 2.31.1
>=20


