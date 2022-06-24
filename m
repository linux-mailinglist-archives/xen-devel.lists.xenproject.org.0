Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01D559736
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 12:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355415.583062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4g7w-0007rF-D6; Fri, 24 Jun 2022 10:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355415.583062; Fri, 24 Jun 2022 10:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4g7w-0007nx-98; Fri, 24 Jun 2022 10:01:24 +0000
Received: by outflank-mailman (input) for mailman id 355415;
 Fri, 24 Jun 2022 10:01:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5tQ=W7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4g7v-0007nr-Gw
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 10:01:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99958b53-f3a4-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 12:01:22 +0200 (CEST)
Received: from AM0PR01CA0175.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::44) by PR3PR08MB5868.eurprd08.prod.outlook.com
 (2603:10a6:102:81::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 10:01:20 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::8f) by AM0PR01CA0175.outlook.office365.com
 (2603:10a6:208:aa::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15 via Frontend
 Transport; Fri, 24 Jun 2022 10:01:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 10:01:19 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 24 Jun 2022 10:01:19 +0000
Received: from 889c47cd83f6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D67E294-48D6-4586-BC8B-E2984E999EEE.1; 
 Fri, 24 Jun 2022 10:01:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 889c47cd83f6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 10:01:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5197.eurprd08.prod.outlook.com (2603:10a6:803:106::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Fri, 24 Jun
 2022 10:01:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 10:01:09 +0000
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
X-Inumbo-ID: 99958b53-f3a4-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NGhiUIpdBbTz2C1paNT2SovFjAZ4slfYi6v0/gi9deTr4CQ/aNG6PekVVd3evcXbr6PjGjirGah1YXkxT6HAKbL6O+U9zOE0Q1HOiMIWAgCorcBzqcJz05phQgfDRTu1ik6M076vldMmBGqwD6Es2ThdZ9cR7qmYtgqXBE173D+kyJxTuKCVw9JB1ZKMrnFCQ/9Udah7G5iZXrBvnq63y2QEE1rHk18DM10llRGieH0DFBA7VvKRAapYcBfOBC4wOsN+Uf5lJdZkdCSwHq1xvHKQI/sIDRCjoINxsHitmrBIEAYjeeJ3qqpyoFPbIkO+G9tOn9BNnWplbEL+UEVHuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIW7iql8xfFig9NPdgzRhm92AswZfQJI9eKjzYf3lHg=;
 b=KDvCRi2eC+63gpAxrDOBOOIqx0WcgPzraa1Oi/bckTxk/Y8PwFaLevXv5KCSdT+m4c57bdeklhkXU5Goi4eyr5aJXQpw9fGmY5pUDuQpkEwotp/bt+nvqYy+As9cD1IcWfavfLwsw8i9mYgCa/hxTd0AsEnCtXvWJbK15a/QmYGo+D0VAlJF+onxamoqUHqCAbq6NBANtvlgADY9kElu2WMHeGQHKTJKS40xaMmsl2yoPklH+zutDpPw4/3C7VQBSGQ4CZ+QIwGppT5Y+uEYCkLQEfuRwbFn86CqWAvxJsvOieHCVt1yspa04OelzonHKXyNszO03ZbEl2nMRbbZ6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIW7iql8xfFig9NPdgzRhm92AswZfQJI9eKjzYf3lHg=;
 b=AHITBOdXswQ9NqEnHgAR4S9H9AgnBoXR2ijp2JUpTMlUqWlJ9TiDCnpGRj1KGiaUEibJshwn3F8lDsuG0mnsMlIsBzCptWAtNjHkc575JH5pZKWJIPgLeykQd7Ck3PNtYGNKoyg2YPaZkandp42uhNCixvm0CIX2OA+NAc6k8SQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1cd8ef8b82d7117a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQDiOG1x5Rbxz1P3CyF5jp7ic9jYZXxtn4vigSFDjp5etAUrkHfFzBBqcR0q/DAN9AG9oruKocHXe7awwOuBC/LjtIlyMnhKdE94MTKEFDFKbZQD73k/kyNPOqkDf6uI0qwvCS0C+7uQQ2WUeMiGYCjQGTNzXAAjJtO0ny8q0vZW0vdix9PKd3kBjqOCJ6gCGtg4bR4XE0pDqCm194hm2LP/bWvH9HaEMKnJ4Fd3gjFfDTChFifU4/kIGHrQ+E+YmXrPid0eGdaFxodZ0fNG9XCWCRBilSR3YQh0VjfEhFGhdQLkbWTWDPIQCR4o8jDtjB7VAokXF/N2FW8JatBlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIW7iql8xfFig9NPdgzRhm92AswZfQJI9eKjzYf3lHg=;
 b=fYEAvN33+03AGt1f2hGcGGPTtM9HyFr1gOclepcGE+FYwiZdJAcb1jbn2udKxDQ6m/tOPH7T3ocZfQMn6n8DqCJCfoVpcfhjqYK1OHA04N1WTDBckUKiQh2s88T7eyDVZzXD+fabbso8FL3PGQlf+5xKVnNApJVPe3GpOcvmX7jIg0oIuOxa+mTjr41ZRsjLqHbFcAEQM4gVcTg93OUKY6HJ3/9U8m6KvppHsFEndbf2LhmVC20uRAhmX90pfOyyR0vaoM/s2fXeoOI4BEyJ205tFlXSNw9QTEdi0i1zBZtyXFLCR/mZ5DNTo6k0Op0NfG8bZEj0PgYn2d0/YKXPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIW7iql8xfFig9NPdgzRhm92AswZfQJI9eKjzYf3lHg=;
 b=AHITBOdXswQ9NqEnHgAR4S9H9AgnBoXR2ijp2JUpTMlUqWlJ9TiDCnpGRj1KGiaUEibJshwn3F8lDsuG0mnsMlIsBzCptWAtNjHkc575JH5pZKWJIPgLeykQd7Ck3PNtYGNKoyg2YPaZkandp42uhNCixvm0CIX2OA+NAc6k8SQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
Thread-Topic: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while
 preparing the CPU
Thread-Index: AQHYf9MHjBymRs/pn0u9upJvLeFm3q1eWpcAgAAIaoA=
Date: Fri, 24 Jun 2022 10:01:09 +0000
Message-ID: <E71E0034-ED75-4783-9A8B-01D6BBF293A9@arm.com>
References: <20220614094157.95631-1-julien@xen.org>
 <29AAB4EF-6326-41F2-BB51-EED5FFDB26EA@arm.com>
In-Reply-To: <29AAB4EF-6326-41F2-BB51-EED5FFDB26EA@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0f51de09-9abd-45a1-c72e-08da55c87c5a
x-ms-traffictypediagnostic:
	VE1PR08MB5197:EE_|AM5EUR03FT041:EE_|PR3PR08MB5868:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /1BepcavudTnL9/kGgSUrvwUA+TspJUlSkR9P9rykzA8IjJW5kKmoBd+Ys3qUpJ2Fu1awlUg8KOm/aLBJAEU5FYp8zCP8/my/UQjb4RNpaV5Aqx9Zno10yBH5plNwPb36xaL9n5QH/22pCo8pcSaYMlOjXmQ2pdH8oTLsSnjiQu+G/9AOTrgMLzGI5RPfRAS9EJgNsq+fGv+DhAgsjagfM5XdOuWY29XVt1JOIpHfE32HSfO3idtHtXltRsUIwfYNl1lBY/TFQncp2ye9MmyNr4gXLB9AJBVIu+Tz/gn1h8yIrUSgiLBg4GCMUEcUN496zJ2dVH0lOQQsaXpUdWZY9/Z80ruHSlFt2NwcoykJ44EGFENEjllKCVu3Q21G93eJXFtXE/Rm4IT6gAtKn91/GsGPOux+vxw/5JmKOOjCWRtsA81F3IwcsK2HvBLsl3O7hPpTjAZ+fl5m1Ms7gFATAPIDjzBHnmv4T3ndy5Jo0ql34SefVjclWxHC4Fh19+NOB2C5DdJopVh1qCGUKyIMwX2r22LBAJM44wJcfKZH66G6FYwKjdSSMkpeK6r7NFl5416ZL7DNoGZyWYAIjuM2G0DZ7FVkz6pUJevdX+NqQ6gavv/gYq1LsnmF7CJmS8DItl3mNDVSUUApQPVLOw+rf69ZPjLWMH8fYWRVoG3D1fC5aBKuh1ioV2kpzFDocFEwU+RYkst7J9ym3U5PCFlwZMbWpSQmH+aSEGET/lcCnes17JAurQK1unI4HntugpgQcE7xuA6yxSz5ueDiN73I8/Vw62pwJhFYphtHp6wup52lsGqi+AumsNODmvDLvsmRLVhdzSujkQvGygepI4eFg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(4326008)(66476007)(64756008)(76116006)(83380400001)(41300700001)(66446008)(8676002)(91956017)(66946007)(54906003)(66556008)(38100700002)(36756003)(6916009)(316002)(38070700005)(122000001)(71200400001)(5660300002)(26005)(53546011)(6506007)(8936002)(478600001)(33656002)(6486002)(186003)(86362001)(6512007)(2616005)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EE30AF5CDC501D429C6E2824C4C6B660@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5197
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	846bbb39-f8cd-4886-5b38-08da55c8767d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	awCG2hZ5mvBtN/EjW8sgO9oLH/52sWFBw8GRFyxpHi7u7tIXS5cXSzaNIWSoHPjHSHgxudpz/Xb9eaMpeHRei51YjYUhxFyvlaLb4UtomQLNxVgtTVZU7Zf1cSDOJvNOwaxBUucYk43oSa/2XDwKv5JS3dSFEh1l9YDwe6+aMY0tVVT7xsLldHJSKE/+9o4XVmrsrkPELdokJLRc2Q1eEBeZ5XVsORE4Y7RXcw7JTCeUMpbFYt+wbax3eSYlb3IPwyZgUgwTFsiBR4goQiZLrJ9DPfI6kIvm9nleTKuPRxc9oQwUgiAAuVBRhSj5Bd0dduzV0fEWN+DxPQnUnfPjY1mpnrxFpp7wFT8XceeOy1UchTHQPVENL/LauKdlH/Su84R8VykYkeDn/T7j5LUsC+POAksbn+ChPD1xxaOWYJa+gjOWiuZ1ai4m6uiPRv41rah56Jmp5A2KbjrFzaPZ7ia3x5BUVzzjqi+eiyqHdo/ep8JEtreFsHCR7czzgf4QPaX45GN4r1WbVa10Sgu9pswxzftveounskqbGn16CqWN5ECBC0z5aDPHiwaOwahzKC74/bB8b6yTeSu1kF0yfQrQVOBeHAD7nun2MBSHEejM3hN3T9JA39oBUs4zOXi5Yess+1r89MQoujhFcnvgyKyONsl1jQa17C8WuLksDWzTLzR+nZpGYT/aOjnZQ7RmO9cddY/r0MuV3U3XZiwftmAaZ3Ibxc94fGknJMMW+1NYemROd4N4XFB22ktKHRFkErePO6bcM+r++F/HagL4lLRH20qHNxbfhKmq3z00yJVUsDhOrbXFYzt0QoDKu0eR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(36840700001)(40470700004)(46966006)(356005)(186003)(2616005)(54906003)(2906002)(41300700001)(316002)(82740400003)(5660300002)(40460700003)(81166007)(478600001)(8936002)(36756003)(107886003)(6486002)(6862004)(6512007)(70206006)(336012)(33656002)(36860700001)(6506007)(83380400001)(40480700001)(70586007)(53546011)(86362001)(4326008)(8676002)(82310400005)(26005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 10:01:19.3865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f51de09-9abd-45a1-c72e-08da55c87c5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868

Hi,

> On 24 Jun 2022, at 10:31, Bertrand Marquis <Bertrand.Marquis@arm.com> wro=
te:
>=20
> Hi Julien,
>=20
> [OFFLIST]
>=20
>> On 14 Jun 2022, at 10:41, Julien Grall <julien@xen.org> wrote:
>>=20
>> From: Julien Grall <jgrall@amazon.com>
>>=20
>> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
>> xmalloc()" extended the checks in _xmalloc() to catch any use of the
>> helpers from context with interrupts disabled.
>>=20
>> Unfortunately, the rule is not followed when initializing the per-CPU
>> IRQs:
>>=20
>> (XEN) Xen call trace:
>> (XEN) [<002389f4>] _xmalloc+0xfc/0x314 (PC)
>> (XEN) [<00000000>] 00000000 (LR)
>> (XEN) [<0021a7c4>] init_one_irq_desc+0x48/0xd0
>> (XEN) [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
>> (XEN) [<00280834>] init_secondary_IRQ+0x10/0x2c
>> (XEN) [<00288fa4>] start_secondary+0x194/0x274
>> (XEN) [<40010170>] 40010170
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 2:
>> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus=
() <=3D 1)' failed at common/xmalloc_tlsf.c:601
>> (XEN) ****************************************
>>=20
>> This is happening because zalloc_cpumask_var() may allocate memory
>> if NR_CPUS is > 2 * sizeof(unsigned long).
>>=20
>> Avoid the problem by allocate the per-CPU IRQs while preparing the
>> CPU.
>>=20
>> This also has the benefit to remove a BUG_ON() in the secondary CPU
>> code.
>>=20
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> I still have issues after applying this patch on qemu-arm32:
>=20
> (XEN) CPU0: Guest atomics will try 1 times before pausing the domain^M^M
> (XEN) Bringing up CPU1^M^M
> (XEN) CPU1: Guest atomics will try 1 times before pausing the domain^M^M
> (XEN) Assertion 'test_bit(_IRQ_DISABLED, &desc->status)' failed at arch/a=
rm/gic.c:124^M^M
> (XEN) ----[ Xen-4.17-unstable arm32 debug=3Dy Not tainted ]----^M^M
> (XEN) CPU: 1^M^M
> (XEN) PC: 0026f134 gic_route_irq_to_xen+0xa4/0xb0^M^M
> (XEN) CPSR: 400001da MODE:Hypervisor^M^M
> (XEN) R0: 00000120 R1: 000000a0 R2: 40002538 R3: 00000000^M^M
> (XEN) R4: 40004f00 R5: 000000a0 R6: 40002538 R7: 8000015a^M^M
> (XEN) R8: 00000000 R9: 40004f14 R10:3fe10000 R11:43fefeec R12:40002ff8^M^=
M
> (XEN) HYP: SP: 43fefed4 LR: 0026f0b8^M^M
> (XEN) ^M^M
> (XEN) VTCR_EL2: 00000000^M^M
> (XEN) VTTBR_EL2: 0000000000000000^M^M
> (XEN) ^M^M
> (XEN) SCTLR_EL2: 30cd187f^M^M
> (XEN) HCR_EL2: 00000038^M^M
> (XEN) TTBR0_EL2: 00000000bfffa000^M^M
> (XEN) ^M^M
> (XEN) ESR_EL2: 00000000^M^M
> (XEN) HPFAR_EL2: 00000000^M^M
> (XEN) HDFAR: 00000000^M^M
> (XEN) HIFAR: 00000000^M^M
> (XEN) ^M^M
> (XEN) Xen stack trace from sp=3D43fefed4:^M^M
> (XEN) 00000000 40004f00 00000000 40002538 8000015a 43feff0c 00272a4c 4000=
2538^M^M
> (XEN) 002a47c4 00000019 00000000 0026ee28 40010000 43feff2c 00272b30 0030=
9298^M^M
> (XEN) 00000001 0033b248 00000001 00000000 40010000 43feff3c 0026f7ac 0000=
0000^M^M
> (XEN) 00201828 43feff54 0027ac3c bfffa000 00000000 00000000 00000001 0000=
0000^M^M
> (XEN) 400100c0 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0000=
0000^M^M
> (XEN) 00000000 00000000 00000000^M^M
> (XEN) Xen call trace:^M^M
> (XEN) [<0026f134>] gic_route_irq_to_xen+0xa4/0xb0 (PC)^M^M
> (XEN) [<0026f0b8>] gic_route_irq_to_xen+0x28/0xb0 (LR)^M^M
> (XEN) [<00272a4c>] setup_irq+0x104/0x178^M^M
> (XEN) [<00272b30>] request_irq+0x70/0xb4^M^M
> (XEN) [<0026f7ac>] init_maintenance_interrupt+0x40/0x5c^M^M
> (XEN) [<0027ac3c>] start_secondary+0x1e8/0x270^M^M
> (XEN) [<400100c0>] 400100c0^M^M
>=20
> Just wanted to signal before you push this out.
>=20
> I will investigate deeper and come back to you.

Pwclient did not apply the whole patch, only the smpboot part on my try run=
.
Re-running it applied it correctly and now my tests are passing so:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


>=20
> Cheers
> Bertrand


