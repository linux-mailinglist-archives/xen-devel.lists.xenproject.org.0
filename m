Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4252598551
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 16:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389589.626625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgBQ-0003Q7-Ho; Thu, 18 Aug 2022 14:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389589.626625; Thu, 18 Aug 2022 14:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOgBQ-0003N0-Dy; Thu, 18 Aug 2022 14:07:40 +0000
Received: by outflank-mailman (input) for mailman id 389589;
 Thu, 18 Aug 2022 14:07:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLbC=YW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oOgBO-0002G0-Gm
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 14:07:38 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80085.outbound.protection.outlook.com [40.107.8.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d6a421a-1eff-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 16:07:38 +0200 (CEST)
Received: from AS9PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:20b:465::17)
 by DB9PR08MB8579.eurprd08.prod.outlook.com (2603:10a6:10:3d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Thu, 18 Aug
 2022 14:07:35 +0000
Received: from AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::5e) by AS9PR06CA0111.outlook.office365.com
 (2603:10a6:20b:465::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.16 via Frontend
 Transport; Thu, 18 Aug 2022 14:07:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT022.mail.protection.outlook.com (100.127.140.217) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.15 via Frontend Transport; Thu, 18 Aug 2022 14:07:35 +0000
Received: ("Tessian outbound fccf984e7173:v123");
 Thu, 18 Aug 2022 14:07:34 +0000
Received: from c41284f9727a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44983D44-1AB8-484A-AC7E-0C6CBECB0CA5.1; 
 Thu, 18 Aug 2022 14:07:28 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c41284f9727a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Aug 2022 14:07:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB5121.eurprd08.prod.outlook.com (2603:10a6:208:159::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 18 Aug
 2022 14:07:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 14:07:26 +0000
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
X-Inumbo-ID: 1d6a421a-1eff-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BQY45CCP/YKE2VzRHwLbRcF0EqEDcvnYOmrlIN5Mrw4zhFDB1dHoN36aI7WjwyPZ8kQkvqgeNTQej1Kft7/kmDXmyOxWLyeEwW12lO9p6/jDnY0ZnFGXNNyUJziv5Gk2EhHv8luJkOOknyddvhEzsXPt3rWYCCFt/Mi1qb0sB5+gp1TcU1dlYfRfIa57Z/brvIwedmauk2pdo7xGpRkRa+bKFAo/Qdy/DuEWGE6EVr13+rpyHI26kni2FhViJbaa+pApOdc7ylVd8tO8ApskxeN+lqNm3PHw5S5Yv0KESbQ9/bmYys5dJKcyriehwet/DBCJLiWwHw7qrCHUuIOtqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T9neOyFXKg5pjw3VJKt5TmkrPIzGHpWSRicmjewUKM=;
 b=e6w3BD0+I3nuYvj8SiOod9LWh4xJ90tHw9Vru/VhYgfAxeIO9XXYXuNil9pDG3CnvcN458IL4hwBqkO00rP/f7yMjH6esQX9c2ClmkJMNvSk0Mh9YOqMtsrhZYNd7XUipZiyN1qiBA5GPxckHNAKuoQlJ4CJvTBHfozQcwwwqrrUdkc/x6J8/PXiNADhUf1rXdl6IdIynfC/HvtMCr3rOTdsIxpjkn+8jhTiar2ScbvAgTsNklbuEJ8iA1EUBR9O/NASM5iy6MURQmWWjdsF6bYiU2IoF+aIXVVAGM0ax9ISfKAzpM3XJNfmf1AU0O8DDSSnovNpSJy9oXsG+mvIBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T9neOyFXKg5pjw3VJKt5TmkrPIzGHpWSRicmjewUKM=;
 b=xX3XFLRJzzZ1D6/c87hU3wmS+fOTGu8W4MN2zfEK4yFkUzTeNU8ZMUUQKGv6f7YqatNemRRSa2r3vtgWkh9B8UyifI43motH02C8EtdvH5dgr0DOlMKv2mnlVQ6mTg13P4Gz66rWm3JRJDo9eON73N6SIffNniToB6r9nEinu9g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 557ef3988d8d1dd9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thd3BiX9EU2pRK36NWVG22ml6cLO25qfyMW7lSCwv3UZsh+GXD4MjQXv+j6kDzaSq8zTRzH/oFS9kPtb5tk1QsXc6EjNEK7YrUl+119X7wn7Ir0gd/6fNijmvabQwsgKWVj22mI+v8GWlPxX4SisKBgzbKEU2dTvJANS9xvekeqVUq5sqGllaRvLbwEY3eedhr8fNrB5UeB4L33CWjDT5FNP8UtHBtlhpuC7tMk/+IfKLjrfDeQdkUXdoh6pZLlt4kvdBNaQL7LZm633wxJ30LIKieMH4ozcNAbA772FL3v6ZyCMz47BnfhLhmtr5StWqHAsaF1XxJCEEe+MvXCqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T9neOyFXKg5pjw3VJKt5TmkrPIzGHpWSRicmjewUKM=;
 b=k48zWMn9DX1yuDi0sZT1AbAymSQcH7li2pW1GF11+3q1xQLfPPkilWS+IeyQiLhIvroZ2g966lxtJFwh8ho6B4pGSP/v+Ic0+6l1muwJKsgCSxHsj/hJtpAAf8KIXkJMwSsImkyRqidHWUu0EAqU9mp1WPtVYNedGwfF4cQ76o+AkEyLE0rBWB0nnpuTuPHg5xdr0EMVwtSvjZfjucntvzAcL0iEuMl8erGftC6kvRFk44D71EFsQB4gxstPNcmj+OCiFH00HzyB6jPQLpYL4qOyEzXDp5saj89tW92t6QLzk6bZWoyql1Jas71gC1Q6RUk7VYZIA2hT6ptgQ/OjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0T9neOyFXKg5pjw3VJKt5TmkrPIzGHpWSRicmjewUKM=;
 b=xX3XFLRJzzZ1D6/c87hU3wmS+fOTGu8W4MN2zfEK4yFkUzTeNU8ZMUUQKGv6f7YqatNemRRSa2r3vtgWkh9B8UyifI43motH02C8EtdvH5dgr0DOlMKv2mnlVQ6mTg13P4Gz66rWm3JRJDo9eON73N6SIffNniToB6r9nEinu9g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on Arm
Thread-Topic: [PATCH for-4.17] xen/arm: Support properly __ro_after_init on
 Arm
Thread-Index: AQHYsaJm36MHcf45GkO6ALJzQ7Il0a2yxdaAgAAKiQCAAeQMAA==
Date: Thu, 18 Aug 2022 14:07:26 +0000
Message-ID: <F3E241FB-9013-4B66-ACA0-8AAB4D4E8920@arm.com>
References: <20220816185954.31945-1-julien@xen.org>
 <da0126fb-d357-bde3-f362-32c7d3b51ee4@suse.com>
 <10fb8b11-1cb2-9394-f9fc-2eb6dd84543f@xen.org>
In-Reply-To: <10fb8b11-1cb2-9394-f9fc-2eb6dd84543f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1fad4958-8c7b-4df3-6fdf-08da81230017
x-ms-traffictypediagnostic:
	AM0PR08MB5121:EE_|AM7EUR03FT022:EE_|DB9PR08MB8579:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bcaFwyMhHahWLRkD/8vVMlx+eYqARM04W2DzhPl9Mat4ry+Sv5qfPIOfNk2TTLXcaPRmIje6ezxPFN+e8DTZWTi5devS9Irlcw0EwzE08xOdvLb/dEgDzWKnQIGbsDPywL5N9C300RxKycB8qF6xjxP44skZgMpnZLCFVNbFnmseD0QFBqKZtbBatW1IPxLRYEIlxbgZtTav+G0TfvV9hJlLChbL4czAyTnDAEqVEM9YftXexYY8o2v69OH0hFXc1zmFP/82PKuesOZMGfI8kyfCF/IUUgF0g20sIfoqhnrkShNeXXMXO+67DrruNKEVY1tyiYJ/5pVNew96rvAFOaOxDLOWpMx9AwYag99knjeG1kjIwMIJuAOSCdGbakkxxeB6ss4aLkaF9DEBXF4qke7TNxSIyiDHrX/4WN5U54tWt4yBvcF3mgiuKjUjYKbYrLKgj+W2eb+kRaeVux8nI4HIXgBT8iylSK8LxbRGxErpeexIY8SBgf7i1t99bMdoKnmGHZ23UxlT3m0jeWSs+qWaBEOUx9FWkJtCHktgf0UK8KQML72bQYJTgPinY3RmMKKMugm+gz8zjPVlQxEOkRG5XrJ/Wgp9VmuCV/nIAGPIFeXtJ6gBPama0hZ6uUAnFBVmjH+f+9j//fPhYT5deX3Oa8HKs073Ae0BTo1dyCXGMtC30mav2waaVr5T7UE3ONTFdJoX87eHZ0FkF4NlYNu5YOhd8VIQwysZw++FemOBPhTaMsUSzD0aCbhP0PXBzVIlmSPKDTY3NUirg5BVvnEYxhD4BPLdWhOPrzszN/U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(6506007)(53546011)(186003)(83380400001)(5660300002)(8936002)(2616005)(6512007)(26005)(36756003)(41300700001)(71200400001)(33656002)(6486002)(478600001)(86362001)(38070700005)(8676002)(66446008)(6916009)(54906003)(66476007)(316002)(2906002)(38100700002)(122000001)(76116006)(4326008)(64756008)(91956017)(66946007)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CA3BCD236706CA46A162D09A3CC7B704@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5121
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	76c4f771-4041-4e86-ea06-08da8122faff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kH3Whtp63tBw7QLC0DhBFWuRP3NfllcBQadIBZeKqP41JTkuG0KsSXGbTlVjsnQO3LAcZkgghpE+B+UBAcMoeC7kN6IBzrZsaUKO9d7R1zRkrwo3QLbGJd9eG1E3LqN3gFcAsbrb3YFI4e6apoVeukkAJvYQaac+o3NmWJ3+tHTSHts+gTrVckWHlRBqiuwXZ5Yfub7GjioLgu9LsOUlzI9txR+kILQZxQ5n1LJ+Zfzfvqfs+3zQfvCwhxyETxOoNAGyf5Er3pwtTw0jYw0BC69KvrxiyATW3VhWTLV4GWq0yafrpEl/cDZkelx9283u3DGv17+QRm9NPgbPfjTWbeyUue2/ThHdjdaAHonWVcVJQlrC5cWpWRxBT9fiMNhYEU/mkZnSlBKuR8F+rmRKRrSqGx8OyGFjdiK8a0lXyLiTfR8C3peGA/tSwhaxIr9KgNYpysQoNPAh7KHi2JE66Pp6RE+2wkVeNBiL+e5hXCTOi8U+5msZywH9nUl37lOpjYqqJZvlQqssXRly+Cq/FUhxotJILnKA4jNQvXHJ1tA04CI2xm2gkUvEVJWiINKA/nMzaLjRb7yi214FK5+7Aoxstb9ARmFPG7cNwbGoUTLOXr4AXySvRJImOjOayel5ddimtkaurKDW3v4O9k7vwinth+MdqxkUoSO/6FIFkfsASsNSjI92z7hiOwJN6aCK5a2p1/7zK0nV5i/5YBIrEzVZloYuMyKeL7JnH2mVnd07O1B6j/sz8iqw+pAIFueIUOaT+bNRMv9khYP/QnqyUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(346002)(39860400002)(136003)(36840700001)(40470700004)(46966006)(6506007)(40460700003)(41300700001)(336012)(6486002)(478600001)(2906002)(53546011)(33656002)(36756003)(81166007)(70206006)(4326008)(8676002)(82740400003)(40480700001)(86362001)(316002)(82310400005)(5660300002)(186003)(54906003)(356005)(8936002)(36860700001)(6862004)(26005)(6512007)(70586007)(83380400001)(47076005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 14:07:35.1095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fad4958-8c7b-4df3-6fdf-08da81230017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8579

Hi,

> On 17 Aug 2022, at 10:14, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jan,
>=20
> On 17/08/2022 09:37, Jan Beulich wrote:
>> On 16.08.2022 20:59, Julien Grall wrote:
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -75,10 +75,24 @@ domid_t __read_mostly max_init_domid;
>>>    static __used void init_done(void)
>>>  {
>>> +    int rc;
>>> +
>>>      /* Must be done past setting system_state. */
>>>      unregister_init_virtual_region();
>>>        free_init_memory();
>>> +
>>> +    /*
>>> +     * We have finished to boot. Mark the section .data.ro_after_init
>>> +     * read-only.
>>> +     */
>>> +    rc =3D modify_xen_mappings((unsigned long)&__ro_after_init_start,
>>> +                             (unsigned long)&__ro_after_init_end,
>>> +                             PAGE_HYPERVISOR_RO);
>>> +    if ( rc )
>>> +        panic("Unable to mark the .data.ro_after_init section read-onl=
y (rc =3D %d)\n",
>>> +              rc);
>> Just wondering - is this really worth panic()ing?
>=20
> The function should never fails and it sounds wrong to me to continue in =
the unlikely case it will fail.

I agree, we should not ignore and error here.

>=20
>>> --- a/xen/arch/arm/xen.lds.S
>>> +++ b/xen/arch/arm/xen.lds.S
>>> @@ -83,6 +83,13 @@ SECTIONS
>>>    _erodata =3D .;                /* End of read-only data */
>>>      . =3D ALIGN(PAGE_SIZE);
>>> +  .data.ro_after_init : {
>>> +      __ro_after_init_start =3D .;
>>> +      *(.data.ro_after_init)
>>> +      . =3D ALIGN(PAGE_SIZE);
>>> +      __ro_after_init_end =3D .;
>>> +  } : text
>> Again just wondering: Wouldn't it be an option to avoid the initial
>> page size alignment (and the resulting padding) here, simply making
>> .data.ro_after_init part of .rodata and do the earlier write-protection
>> only up to (but excluding) the page containing __ro_after_init_start?
>=20
> So both this question and the previous one will impair the security of Xe=
n on Arm (even though the later is only at boot time).
>=20
> This is not something I will support just because we are going to save < =
PAGE_SIZE. If we are concern of the size wasted, then there are other way t=
o mitigate it (i.e. moving more variables to __ro_after_init).

Agree with Julien here.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


