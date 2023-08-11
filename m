Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD33E779A0D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 23:59:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582658.912517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUa8S-0005no-NZ; Fri, 11 Aug 2023 21:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582658.912517; Fri, 11 Aug 2023 21:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUa8S-0005kZ-JU; Fri, 11 Aug 2023 21:57:32 +0000
Received: by outflank-mailman (input) for mailman id 582658;
 Fri, 11 Aug 2023 21:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wg3T=D4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qUa8R-0005kM-I6
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 21:57:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f2b9a59-3892-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 23:57:27 +0200 (CEST)
Received: from AS9PR05CA0143.eurprd05.prod.outlook.com (2603:10a6:20b:497::27)
 by GV1PR08MB8129.eurprd08.prod.outlook.com (2603:10a6:150:93::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 21:57:21 +0000
Received: from AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:497:cafe::3a) by AS9PR05CA0143.outlook.office365.com
 (2603:10a6:20b:497::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 21:57:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT016.mail.protection.outlook.com (100.127.140.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.10 via Frontend Transport; Fri, 11 Aug 2023 21:57:19 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Fri, 11 Aug 2023 21:57:19 +0000
Received: from de4377cdc3a7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 482FFFBE-B529-4533-A286-9095368E74EE.1; 
 Fri, 11 Aug 2023 21:57:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de4377cdc3a7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Aug 2023 21:57:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9799.eurprd08.prod.outlook.com (2603:10a6:10:444::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 21:57:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6678.022; Fri, 11 Aug 2023
 21:57:10 +0000
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
X-Inumbo-ID: 0f2b9a59-3892-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEGS0wRdx8UI0U7Kbc3vxJthrwcG88bohMK6eHHTDQo=;
 b=HhN2zorEYadotpKQS1swl2kL6EWafYc6dLqXsz31wUWasN9/suY+7BcxMP4FGUk0gQrRFymhm3VUpPabexHKM33KI+kcif39eq6AgJ2ErM3Wt658tUT7NB5wiT0B6N7LaeTyzUS3o0zs00vefr1g5PCkihyB3m3igx5Awuc2M/k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a5bc18ca2b006142
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/CW5TIzt0KP7bR6Y4VOeBd1IYJcF99FN1TQfcYbgYWhI1/oPwaTh+CR0VIBQTX20aH6U90LyCC6Ej/FnnldHaEdzeOEQxEEpwXkdlSdcONRIQNKfNQhYhN6xJOpowRxAxgY4UnBi1oez3ekyKqjWhh8BVoora0Xh+ETaopnrO/9mrkpvhYfhxJixccnc/LWFEW553j7qI4rSETG/LjovJruzu01Lno5XmCsK+Jxq3jz1pdUsGDBThMVqhx2XPpbxmDGomsu4XNLIhDuyRDwVF4POicmK0w3Tv89wxZ8GRcAGMzU+S4OzuE9GdI9WhqC9LS5U4oLHLYqDq00UFT9cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEGS0wRdx8UI0U7Kbc3vxJthrwcG88bohMK6eHHTDQo=;
 b=nDOyTkzyhi/gGiN7+aURlPlHH6BQ5iUjEvCjUH24HkItP9GJGI4O4svUgASukdscx3DoUEQ6tZteYsstrganwj9yiL2dBkGlJtSHFs2S1G3GuNGacNWzoi2MBw5U3VvX5pHjXONRZOCdbQ8q86c40R7a1hzLbDM+JBpZx8m52okF6wKld/WJKGRYOywlhZT1gr+gt0oBMtn+J5wJfkmKx4uL37sUBVEdSvNL9l6pcfOVPxM9sBnGSb9FPU3cPunpbzbGng8eQxyd0Cdxpoh5xkWYe/kjVOGH9nMy9LJwaJAy07cmvyuygQwpw/sVEGknPhugkoqzUh7ngzsyWMTFxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEGS0wRdx8UI0U7Kbc3vxJthrwcG88bohMK6eHHTDQo=;
 b=HhN2zorEYadotpKQS1swl2kL6EWafYc6dLqXsz31wUWasN9/suY+7BcxMP4FGUk0gQrRFymhm3VUpPabexHKM33KI+kcif39eq6AgJ2ErM3Wt658tUT7NB5wiT0B6N7LaeTyzUS3o0zs00vefr1g5PCkihyB3m3igx5Awuc2M/k=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/5] xen/arm: Move static memory build code in separate
 modules
Thread-Topic: [PATCH 4/5] xen/arm: Move static memory build code in separate
 modules
Thread-Index: AQHZyc55L9ICjabsSUqgCKAf+BkgTa/la64AgAA+NwA=
Date: Fri, 11 Aug 2023 21:57:10 +0000
Message-ID: <41482347-A5C2-4CFC-A473-8425716A25CD@arm.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <20230808080010.3858575-5-luca.fancellu@arm.com>
 <27ef6978-ce23-45ba-b136-4ad9c8913751@xen.org>
In-Reply-To: <27ef6978-ce23-45ba-b136-4ad9c8913751@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9799:EE_|AM7EUR03FT016:EE_|GV1PR08MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: c08d67d0-dc09-4f76-6a16-08db9ab5ef3a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CBERLl00HoyBJ+xUzl10GxEdlh1lksIpWs/OTl16fYHC8IrQKhna6YqIzVixniQaSNVsCvfKOgcc/bAFIg+ixBdKSKjn8zXjfH43D14yRNTw802mfhDTu2sesoxSZ7glrItS/22whYpJ9zG89LiDszBJfmJN9mDwuZo9x977iKSiROqjuE/gnJ0cKFP1h9qijtn3eUan8irLLv7pn+DFAmmZBj8CnzeZuPvGCS/MnIqpdmz8DyXmDPSJD+tLRmtCpfEDWIehkYmxYROEe0gRWnw2AcTNIRCS7Uyoae6RMtGyisMEfkROBoa2LuvN7hwjiNMZfNBCPmx+qIm94luUZJXR4fQf66jrd2MKCHETrj08lWxSxoxm8PMcX865yW5+92zgeuia9h73nKtx/UaIu7N/hYtB4uTPx/Qb3hCRDvav2vBnHkX9wIr2hzbfyhkxBoP+Sft/NDxVsaPfXSUWbADTs08FRpPfHE4M4KDyeq0tS2FhVZnzqspH4yNJwp0yoDQNGJC47BqsEC/wcAuo16mojQ/V4ZFW9jRLspxO+vkQWZRHHomaAqk3oAegOqyUk1WcqTWGousd2q4GydALLUZ91vdNUqTp2OOHt3JFHiqyJz+XqvL/sA0jQycMz2Q57EM54Kb3deQPSiWhFfvN1g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(186006)(1800799006)(451199021)(86362001)(33656002)(38070700005)(2906002)(36756003)(6916009)(26005)(53546011)(2616005)(6506007)(4326008)(54906003)(122000001)(38100700002)(478600001)(8936002)(91956017)(5660300002)(66446008)(66556008)(64756008)(66476007)(76116006)(66946007)(41300700001)(71200400001)(6486002)(316002)(8676002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6EB611BB432AA143A6653A6D0F0C24A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9799
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7695303-6911-4382-87f7-08db9ab5e9f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iiCZ7PBn69U0QCT1rByrv+lSwnJh0W0IJYI5OEQqkZcfGonrBrnmohq2nw3JQC8kceoGbjSFbqiuPmkGIWOoVbwhd98ncOXRZ4khIJfh5k89W/Nuq4mY0CjOecDdOXTsBONs621zhYIHCdEj4klip2hrN0c7IoahgqaCDm+THmHmrOflHnbVr0LBtMdbOOt5F2xADZoXUrkhCnlUSyvimhLiZDOJdAtWNAzoHbWuoYV2x7hBXKsNQwSaBSRl0XCKjHoskRWZT3/tjhrnolQSNmNHq7giigeRvsb7spybUUD2H9voA/0wLG2uxA+IIzER0UXHpZ0VXRtZodsZr6Gl638koTgwRHXDjXibhEa0H7r3WztNfxNtMApMSCgOfHvzHdn/o+A6AJO31l2n6WwSGbhJa9QMYmjW1oMDEdADnfft4thMQj5hPtaZzfRGrsSqXSAsfWbtIf8ODfIL+JG8IeoJ4G22HEegO1COQhX566y192DxOOuieXSaWTkM0/tzxFLR+kXly3dLXxD4anHF0MyY3eSBdocaX20LJZXfSkC4Dwt43mArwuxHBrS1HLTss1IKeXN4VM6+tdtOlRqGg+E4NxSeDFrIZVlxdjJKraFfFEwVFmYgUijXsi/0mTHArwamRqomIxgiuo9TLBVB5Iu8fYj18La//LVnW7m+SM62oRgxdmHccK7PRQR+ARKBQ+AnSictJpC66WjdbMLhwos/UC8E6PgCU+QDxkTXTBkt3XdnAe8rhlDuquuWTcut
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(82310400008)(186006)(451199021)(1800799006)(46966006)(40470700004)(36840700001)(6506007)(53546011)(82740400003)(26005)(40460700003)(2906002)(36756003)(336012)(356005)(81166007)(40480700001)(54906003)(2616005)(36860700001)(6486002)(5660300002)(316002)(6512007)(478600001)(8936002)(41300700001)(33656002)(8676002)(86362001)(4326008)(70206006)(70586007)(6862004)(47076005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 21:57:19.5929
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c08d67d0-dc09-4f76-6a16-08db9ab5ef3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8129

Hi Julien,

> On 11 Aug 2023, at 19:14, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On IRC, you suggest to skip the review for the patches moving out some co=
de. However, I still have one remark.
>=20
> On 08/08/2023 09:00, Luca Fancellu wrote:
>> Move static memory and static shared memory code in separate modules
>> so that they are included only when the corresponding feature is
>> enabled, doing that we modularise the features and we remove some
>> ifdefs from the code to improve readability.
>> Move process_shm_node function from bootfdt module and make it
>> externally visible.
>> The visibility of the functions allocate_static_memory and
>> assign_static_memory_11 is changed during the move from the
>> dom0less-build module to the static-memory module, now they are
>> externally visible.
>> A static inline helper called process_shm_chosen is introduced, it
>> will call the process_shm function for the '/chosen' node, and will
>> be used by the funciton construct_dom0 instead of using directly
>> process_shm, allowing some #ifdef to be removed.
>> No functional changes are intended.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>  xen/arch/arm/Makefile                     |   2 +
>>  xen/arch/arm/bootfdt.c                    | 161 +-----
>>  xen/arch/arm/dom0less-build.c             | 646 +---------------------
>=20
> This file was created in the previous patch but now you are moving out th=
e code again. Please try to move the code only once within the series to ea=
se the review.

Sure, in the next push I will do the moving to different modules in one pat=
ch.


>=20
> Cheers,
>=20
> --=20
> Julien Grall


