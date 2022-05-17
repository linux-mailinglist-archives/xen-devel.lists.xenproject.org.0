Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B823452A2E8
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:13:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330822.554220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx0I-0008KG-MT; Tue, 17 May 2022 13:12:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330822.554220; Tue, 17 May 2022 13:12:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx0I-0008I1-Iv; Tue, 17 May 2022 13:12:46 +0000
Received: by outflank-mailman (input) for mailman id 330822;
 Tue, 17 May 2022 13:12:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKH5=VZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nqx0G-0008Ht-VX
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:12:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08eea5a8-d5e3-11ec-837e-e5687231ffcc;
 Tue, 17 May 2022 15:12:43 +0200 (CEST)
Received: from AS9P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::18)
 by AM0PR08MB3554.eurprd08.prod.outlook.com (2603:10a6:208:e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Tue, 17 May
 2022 13:12:39 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::f2) by AS9P251CA0014.outlook.office365.com
 (2603:10a6:20b:50f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Tue, 17 May 2022 13:12:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Tue, 17 May 2022 13:12:38 +0000
Received: ("Tessian outbound 3314dea8c23c:v119");
 Tue, 17 May 2022 13:12:38 +0000
Received: from c49673a1986a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 501EA794-B914-4CD1-8741-00BC55B7A6F7.1; 
 Tue, 17 May 2022 13:12:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c49673a1986a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 May 2022 13:12:26 +0000
Received: from VI1PR08MB3824.eurprd08.prod.outlook.com (2603:10a6:803:bf::27)
 by AM0PR08MB4147.eurprd08.prod.outlook.com (2603:10a6:208:12c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 13:12:24 +0000
Received: from VI1PR08MB3824.eurprd08.prod.outlook.com
 ([fe80::f865:ef06:e407:238a]) by VI1PR08MB3824.eurprd08.prod.outlook.com
 ([fe80::f865:ef06:e407:238a%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:12:24 +0000
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
X-Inumbo-ID: 08eea5a8-d5e3-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DVD/wOf9R3Jo1UACD6pLb0i4LtRrBtNyrw0qtg/L5olBaKy1Ri2waWvcI6rZW7xkV7x8+ncMD8JL8aiGI3jZ2Jw1l3FGaS8e5QjV5aD5QIuiQR1yCYvyRzHFG5G272VFkzcLrdH4btkXq7PX6bxLCYTTS0NEKF6BYDrm6A8z0/ERAr7RdUnba1sNSxrUmOzcIkV+INwSobEiyz+y41WLStNxQ26Mm0tSHFjyYcHMCQ18/bS84wOExxtRWWff+FhTElZpV7AXgZP6X6FMSVHMjtzISbMqVxWlTLCqKoVOLMxvnEgLwKSvmqqSmcX6fYzndr7qGjfQDuTpM2I34bKO1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT3qqzCM1rytj1S/U2ZJuxGW5T0wuNP59LeExPBQcZ8=;
 b=NXQo6ss/S9icFwLdf8r7K6jlGwOsI2SJoRQYvwWw8Ly1tfpXn7wmcL2LLlpekmV0c2v74MrRwUkoiuWnUK9/pzXaCXWf4U8wyzFMERavkq5XpBL57dcS7KvXmbnNvbk0pTlBnB67W3NEfZ8ktpAFOx+p29YWGxfFWuyQjBld+uKnbc5P2EQmc4XtQa1ufSvpfhm/1oScIrvmlGaSQAa4XzV3zS+87NWd/11a3u9hcoMDZOctwa1UzGDppQHhY1XtQm0OJPlN4PrrRU399ekMAVGrmhgyqh4hZW5EldbG4Gs15AlQZbrOz7EtKmxltEZ86AAYHe47nNvw4iTXrZchzA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT3qqzCM1rytj1S/U2ZJuxGW5T0wuNP59LeExPBQcZ8=;
 b=ex2qDT0ApPEhcO0ddMjLlOjxCxWinxY5NaFUMEctkjpyW/2II8nDkzALjogsnAFfasigH//qp/iCFdu0ADBEuep7s5I2C7/bE/+3ThcR5/5m2PGIitWW96rjxhSeDGyHPg3WWG5qqXEqOpCAL3BBSP296zOcOS5GPnbM6ABWC2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8276c37d8f64fb63
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awSsS9IqAxsvJcuwXdglMnHcqcidB9f6LRJiZHBoRUjzC+DN8ArokLjmJZH9nEa0jZrmD/XNVce42/iVl0W3ahHu/5/Gck8RLRFEyrpLLtR8uO5Le6TFCg1+JbxYkPZhHlLXxJJ1WH50fX28Iw0vjq5VFE+C4CbE9DaOhYaz6bo/EBwYJYpZvG+ymeChbIiCzWYpw0fE/7hTTG5JNFApLC5+mPZxJ09Wma88styAaI61U7SUD7knMEtfJpL3SnDILurgQ5vEPjI0bIDax0Nmg69AZ5cx7W52r337Cc6QI/+KtyIOPiIZK4W9iXShmlPaAMjaXP3H6mOVUgqpm/Ma1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT3qqzCM1rytj1S/U2ZJuxGW5T0wuNP59LeExPBQcZ8=;
 b=F0J0f9ES08NZW5nFWsl3/ssaaOwRYgRdt56LRL6SIV68PtmDnf1mPOTmgg4W7QO9UBKk+e+N+AaoPiBJ4U+umURcbNTNTaK+M3rIF8jNS4UvnGQetHxsTfl0ayGVbqpo+F383b95Bv9QPYADkeq1gukP2zW6grXmOLHrzoOLSZnOdj5TlBwEown4qb8ywsSWYG1qj/QyqD2SMRUd42zk+szZvpPMgpyc0Jz417ukXRyCxkoJDd/CO5zVoa3vrqmmkOvSVAu11qKVAMY8iwq4410ieMw1Ejgi3omURrMV13DFdGyE1NdREAzg0TRkR4W2Xx7vwE18uu4vwykSmj+nJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KT3qqzCM1rytj1S/U2ZJuxGW5T0wuNP59LeExPBQcZ8=;
 b=ex2qDT0ApPEhcO0ddMjLlOjxCxWinxY5NaFUMEctkjpyW/2II8nDkzALjogsnAFfasigH//qp/iCFdu0ADBEuep7s5I2C7/bE/+3ThcR5/5m2PGIitWW96rjxhSeDGyHPg3WWG5qqXEqOpCAL3BBSP296zOcOS5GPnbM6ABWC2o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [REGRESSION] [PATCH v8 6/7] arm/dom0less: assign dom0less guests
 to cpupools
Thread-Topic: [REGRESSION] [PATCH v8 6/7] arm/dom0less: assign dom0less guests
 to cpupools
Thread-Index: AQHYae+/wTiZ8QXf0kGBx86KT+V7ZA==
Date: Tue, 17 May 2022 13:12:24 +0000
Message-ID: <60E49E06-BFFE-47BD-81F1-CEE26E471359@arm.com>
References: <20220506120012.32326-1-luca.fancellu@arm.com>
 <20220506120012.32326-7-luca.fancellu@arm.com>
 <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
In-Reply-To: <e434527b-5804-324c-3619-51a552802d2f@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 90a7ee9b-62a1-4c23-26b7-08da3806eb0d
x-ms-traffictypediagnostic:
	AM0PR08MB4147:EE_|VE1EUR03FT049:EE_|AM0PR08MB3554:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB35541F6F0896C5433DDA4928E4CE9@AM0PR08MB3554.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jOoxAY1qOH2QyAwnPgzaKGlc8pQaaGXBe8WlLg/fRTIrmtJ+gCfpRpZKGDiHGFR0u6Wi+RBZSOr0EV8TOOER/J1eA72/OmqeMmJ0zd6kiOtn72g63d09SZLx7IWAKaYW+461N48814Wuszf61KVKiCMZdGjUA4/jysDZ7lnIgKrldoNUI6Pn7HflveBueHjW/QFSO4aYUD5MO9i2OxC8qvPyp8axblBvZUKm577Q4/PEuF0KoCx46woFs0ssdHmj0hLk744+kHVmp4t6LIhdLdEH0rNQ5dj9uY2QPrkmoOhH7Fqx1Jg8EUKIzsLC4t2N6rDEomtimgJpCKIq3BufSLjG7YE+G+yuGvAgp/u1ucTa+mFURak+Pedn66zNakwQLFcJcybqdQkp36PImPpuiYvVnizWjSwfiJ3kYxpL+2cC3CwYoRHOAOOVQGuYo324P0DpeFHDEx5DWtqanwPxwVBiUIia93kC3YUqmbuVu/77cFERcRTM5WFqoNA2G37gMk0fIaTzqI6nUbJGwClf9yJ/hCFDrsLzITC2g2QuOy8wR++/bDOOA4hCUnE1J3iBDDdw2NHbMhEjHPzHxFyrpVw6jKLmOsf52dd1+13XTBjdIirPXJqUYIbIrlvJWVdlHoI0VA2/ekJ8jYcq872VQOrl7AqQxxVuBv7aBrAwdhqvBu43bCD6KiJWiiJWMX6GA8JWxdt/2tZKECThY91uDJAzOJmLgQi7h4gbqYryjoDzYJuQaDddZTYLrVzvODbTmG9FtNClOEsrZK5gKkGSsQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3824.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(53546011)(2616005)(38100700002)(122000001)(38070700005)(83380400001)(86362001)(5660300002)(66446008)(66476007)(4326008)(8676002)(66556008)(64756008)(91956017)(8936002)(66946007)(36756003)(76116006)(2906002)(6506007)(33656002)(6486002)(71200400001)(26005)(7416002)(54906003)(6512007)(508600001)(6916009)(316002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C30A96692616B24DA579630F9F6A69C3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4147
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	842bbbfa-aef0-4fb0-00b5-08da3806e254
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WYaKCgddR5NZqmKKVqjb2KHnmPZSmeMXXNwEgd6Cy+DnCgjxUl916biLg4f4JCVjbkPjun3yZcBcm4NZ3tJBIMn4hshtGD/Lu8lkY+WrIpIliKHqnABRSUEaprjKXJpbSOjpdh04E/4UtwJAzX938phd4+/6KXacD3a24JXlswm4SBREOU0Mg0uitqTFaAsoFFeFIAVRxbknC5qt8zRh7cSA93eByX9lDsVzrVQR3J2Oc1WTPzOULNYvCx+QYnnOZWIz43pEa+zl/nl4Dr9GadVia/n7vHjqmPYge/6c7uKzfXmhMsIrHC36SBMZdsusHsA/qO2S27Ur6PQPqFdMEGdk0NH1oBfRU87TtSPpOEU8u/yLf2kljc4vmyU5HMXHL/R3lU7emVqAj7IH74pCezYNbTGiK93U14UYNi+qlxBWQ3QJcudyPY8KM1h8rEsKtIaGj4hac+IIano00h/rCCbqo6Hh4XdT11xgvUQ8BVAeWqm9cwLrdwmNXtWApvwJkf0sUrYp0/Qa3sS4sQsa3L5Mficg2RlufFGhPSb2JNZjXtKmk+9FEBcAnA4NrKdROI1KtURcN8miygLJkCQSfwT8jcY7vuRD/AEZ0EcktF62ijER4INQgS8TRNjiy2/zoGrxSwr0elUOK3u8DYNCKFWB6oTQqMjXyXghPc4z8NrYBKrmwGR54JxgzLb4v7BljiWMvihA+mJ1sVWMqUzDmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(6486002)(26005)(36756003)(4326008)(508600001)(6862004)(81166007)(8936002)(6512007)(70206006)(54906003)(356005)(86362001)(6506007)(82310400005)(316002)(47076005)(107886003)(36860700001)(33656002)(186003)(336012)(2616005)(8676002)(83380400001)(53546011)(70586007)(5660300002)(2906002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:12:38.9675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a7ee9b-62a1-4c23-26b7-08da3806eb0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3554

Hi Andrew,

> On 17 May 2022, at 14:01, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote=
:
>=20
> On 06/05/2022 13:00, Luca Fancellu wrote:
>> Introduce domain-cpupool property of a xen,domain device tree node,
>> that specifies the cpupool device tree handle of a xen,cpupool node
>> that identifies a cpupool created at boot time where the guest will
>> be assigned on creation.
>>=20
>> Add member to the xen_domctl_createdomain public interface so the
>> XEN_DOMCTL_INTERFACE_VERSION version is bumped.
>>=20
>> Add public function to retrieve a pool id from the device tree
>> cpupool node.
>>=20
>> Update documentation about the property.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> This has broken the Ocaml bindings, and is conceptually wrong.

Ok, can you tell me what to do to update the Ocaml bindings? Do we have som=
e resources
somewhere?

>=20
> The cpupool to use is a property of the vcpu, not the domain.  It isn't
> legitimately part of createdomain.

I agree with Juergen on that, could you explain it better for me to underst=
and your point?

>=20
> ~Andrew


