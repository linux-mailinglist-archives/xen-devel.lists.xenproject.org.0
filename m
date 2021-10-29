Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BB43FE4A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 16:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218555.379047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgSga-00016i-KH; Fri, 29 Oct 2021 14:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218555.379047; Fri, 29 Oct 2021 14:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgSga-00014v-H5; Fri, 29 Oct 2021 14:16:48 +0000
Received: by outflank-mailman (input) for mailman id 218555;
 Fri, 29 Oct 2021 14:16:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=slsI=PR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mgSgY-00014p-V9
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 14:16:47 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb9ce681-4b91-4b20-b0aa-18b1735c922c;
 Fri, 29 Oct 2021 14:16:45 +0000 (UTC)
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
X-Inumbo-ID: eb9ce681-4b91-4b20-b0aa-18b1735c922c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635517005;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Q1mJO5IBCQciyQap9uCYFPNreob06LOsmP7+2Hld/Dk=;
  b=UzqdkuGIWkdP1ZjwBo92yTe5xZjYdfvbJYtvEKsRsrtvu9NXIUDw2IiE
   /WBr0anVkjQRxwSXGL5ghUryHW8rhDuKZSyUzi5+4VgpJhJquCmFkOESh
   vuxozcBrDmF6uepSlegavqNrB9dFn8rMZFNaGHMzoCf7Gfpv/0A3hVEin
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: USx3RN4RJu+fv00FxAuom6H3BZxBcnZtbQcXdJnQQqwEmu/a00k4aBIv4aYU0Tr9SB5SR5eaPW
 TJPkb8K66bxfEVATqXjGemzjAf0F/w5EMeTFr7GNnF6eEXBnapl7f7ktt0O0wcRvcR3EOuBIpD
 XY3zBndmBvuyjtXuWvYnP8kpZqQsK5BBSkqTBPIUwmYvXWWV5qWpSU7efKXDRHdKwK4b3FOq6+
 RMHa4i3gVQSY6eMjHUO+xmQTtFZtMppVX2Uc43htgNvsbwy2aun3Mmb4RF+ct7wphAO+SRha1k
 rHsQKRODap4gjAqjlu2lVcX0
X-SBRS: 5.1
X-MesageID: 57042571
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LhPjTqDhQI2OTRVW/3Xlw5YqxClBgxIJ4kV8jS/XYbTApGgr1DYHy
 2sZW2iDa/6LamChftF0ao238ExXv8DQztJmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5500M7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/0miXrdooy
 cVxrY3zEy4Jbpadkc4ATEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqSuYUFg25YasZmAafaZ
 8w6bQVWTS/ZOSBUPlFHGJcZtbL97pX4W2IB8w/EzUYt2EDfxRJ8+KLgO93UfpqNX8o9tkSXv
 GXd5EziHwoXcteYzFKt822urv/CmzvhX4AfH6H+8eRl6HWtwWgUBAwTREGMi/CzgU6jWPpSM
 0URvCEpqMAa71e3R9PwWxm5pn+svRMGXddUVeog52ml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHac+7G8vT60fy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLGxps34H3f32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzlyKQFCvtwJpWJa0JNaByQjgvP9qMZnMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUwR8d5plxB71bmJNoKuGgvey+FJ+5dIWexC
 HI/rz+983O60JGCVqRwf56qQ/ojyaztBLwJvdiFM4IQPPCdmOKBlRyChHJ8PUixzyDAcollY
 P93lPpA615AVMyLKxLtHo8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/l6Ir
 4oBapbakk0FOAEbXsUx2dRORbztBSNiba0aVuQNLrLTSuaYMDh5YxMu/V/RU9M8xPkE/gs51
 nq8RlVZ2DLCaY7vcm23hoRYQOq3B/5X9CtjVQR1ZArA8yVzMO6HsfZEH7NqLOZPyQCW5aMtJ
 xXzU57bWaonp/Wu02l1UKQRW6Q5JUr62lvUb3r5CNX9FrY5LzH0FhbfVlKH3AEFDzattNt4p
 Lul1wjBRoEESRgkB8HTAM9DBXvo1ZTEsO4tDUbOPPdJf0DgrNpjJyDr16dlKMAQMxTTgDCd0
 l/OUxsfoODMpa4z8cXI2v/Y/9v4TbMmExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6oK39b9XxwhpBlvRaFGvBu8yK3WKx5AX5KZM2qVYqU29X
 UfWootWPrCAOcXEFl8NJVV6MrTfhK9MwjSLtKY7OkT34iNz7YGra0QKMknekjFZIZt0LJghn
 bUrtvkJ5lHtkREtKNuH0HxZrjzeMnwaXqw7nZgGG4u32BEzw1RPbJGAWC/75JaDN4dFPkUwe
 2LGgaPDg/JXx1bYcmp1Hn/IhLIPiZMLsRFM7VkDO1XWxYaV2q5phEVcoWYtUwBY7hRbyOYia
 GFkOnp8KbiK4zo11tNIWHqhGl0ZCRCUkqArJ4DlSIENo5GUa1Hw
IronPort-HdrOrdr: A9a23:9l4RjKONJgElbMBcT1v155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcPY9ds2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCD4qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPsf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aySwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7QvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WXAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 dT5fnnlbVrmG6hHjLkVjEF+q3oYp1zJGbIfqE6gL3U79AM90oJi3fxx6Qk7wE9HdwGOt55Dt
 //Q9ZVfYd1P7grhJJGdZQ8qPSMexnwqDL3QSqvyAfcZeo600ykke+C3Fxy3pDtRKA1
X-IronPort-AV: E=Sophos;i="5.87,193,1631592000"; 
   d="scan'208";a="57042571"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdTwtUC/ZxdiKt81lzv/CTifD+Q3fYDZkI7IgrWAKYkTW1E9sJUY3EKx2Vaao7TBtsXjQ/YSIpthZXyHx4ds9zBsPgdGoMq9wSRYQmKr6qufvdWtVtyLyvVf4GuVVMAevc5BuUHqPJVOK7ntxoiMFaFdHRdrvsq0TAW/j3JlZdC4JeGvg502KLX2xkTkv71m9I7P+QulvPqhEXFouJIhbz8ImyMBFT7Id0RzpwxmNxA465PyC4+/Tax4zQc/0qR9oQ0THBeR0WFVH6T5Dq7ib/UgNtpELR9ExJBD/qV8UpHmNx80uQXLAC+G7vjzGQg0/22qFmeAv34O2WXrZZJiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oTJ6W23QdVUOafx/bi+G+TCm9+9zHxj5wEeDKO78bk=;
 b=X/IXvSW30Byva2LT/IXzIDNFHzyRj1v2U2kiTYldSRLXXfpzdWru7Y4SpAClL5KG3fmX9tHv4020mITovc+9pP0bAbQpzUAbxLupQVE2/7f/LH8EKh0MuIwun9WZxnFG3B/49gR4wYVn0YUTs9JjnesVtEl2Oh6DGDzj24vHt8V2LVmPPiqCT39tU1ArkZgoghsOLgKLu6KXIyMlrAZg0KfTpAGyzm7/URHmM7BSZ1wjVrKZPfpP50fHZDSRvTCSo6IekcBijd2bu4b6YLUduT8nb7s9mnSXCDChm5CnjLqBdihQRXZBINFd5X/DE8PWj5KPYWPzK/8ewAB37SLPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oTJ6W23QdVUOafx/bi+G+TCm9+9zHxj5wEeDKO78bk=;
 b=AK+O8uXL7Kdq4+zJVeDCRBeZ/XB07Cn05a/DjCt/aV0CwSLfXI5K8shA4+tpwk/itfKFVw6izSBJGiF7ArOCpp2F4ru/Dcz+0pyxGMXf2hsiSfvQ1U8Awb0JzWPLYrWUzQPiu8P6xrJpwu/hZFptd8djOXfnJ0f90HDKnkwwXEs=
Date: Fri, 29 Oct 2021 16:16:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Ian
 Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 v4] gnttab: allow setting max version per-domain
Message-ID: <YXwCQl+LpwsKXzlr@Air-de-Roger>
References: <20211029075956.1260-1-roger.pau@citrix.com>
 <2e198e53-e3fb-4ea6-0c44-f326b5e5f5fc@xen.org>
 <YXvBz4OdpcmVRAGM@Air-de-Roger>
 <09995bd2-0924-74bf-508f-5692b3250532@xen.org>
 <YXvVN0cecMMPdgmh@Air-de-Roger>
 <4531cc8e-e7d4-2803-b4e4-06d438b98089@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4531cc8e-e7d4-2803-b4e4-06d438b98089@xen.org>
X-ClientProxiedBy: PR3P193CA0037.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6610f8b9-9749-4f80-235b-08d99ae6b9cd
X-MS-TrafficTypeDiagnostic: DM5PR03MB3211:
X-Microsoft-Antispam-PRVS: <DM5PR03MB3211A301A0FFBFEFA50E36B48F879@DM5PR03MB3211.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PswUOcXxHoDPUQeDBhal1u06j5U0UkA84eN7D6zlacIWkNKgmMQB0i8IUWvkjhgaDnel7kV//gSSdWg8+akrsLh0HtUMgT2gsbphHUmUWFlMGgd8UNRIksCu250s3JnZnWJX5aYYoZjChNrc1crwAwStaDp37AHMVz0x9dGwNRVXj4tUlkpUaj1AcUmCQt9FO+X5nzQwVqXzg89YzhygDER83F3Jlm4wYoDFqCqn3e6wPz03bgR9XPPWRQ7lWqcqi7ak6hbtzHT21H3Hc2w0ufieIVDi6ikncyj/9v2tOOaxJtb6WXLl8KHPxaNUCNPSHVR2K0+TBqQWrXNPZNl8HOzZzaAt5tNxZUkphTIVu2NrjGNbHAu+pzk4VNA2HznD+tddUejDyJ0S7fUY1extG27RdacIy/9A2GtZ+01YfWDKYTXJfsAuyXR6d+ewqLqGAKaIPNRbiKpMqSTXP8npzSoWVBe9aOW+fPdweZyOD14vHA5/v+5p3vQ/pyxsjrZEoa0yVBheLkZ0tLEqAEcX4HbEKuQ84lNM5psYSi9MWMl3sMH3ld+xkXEwOzDELdmK/EbWXjlC6VZ2EfoLHr0ghf7cQ3lug+FcuorXrRa+aLnt42E2LGJdwfdI0SD3+d95UT2lPANEhY5DfkaFdb7+Vbo2w0uKEEm3okUVGBznzwFsuNau7oBDEciZDpLV39ScnySxm1j1q4mGmaYfqXN5eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(2906002)(66476007)(66556008)(5660300002)(6486002)(33716001)(6496006)(9686003)(54906003)(83380400001)(8936002)(4326008)(66946007)(508600001)(26005)(82960400001)(186003)(53546011)(8676002)(38100700002)(316002)(956004)(6916009)(85182001)(6666004)(86362001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEwwWGk0Mk85RTduM3JWVlg1dnJzcUZ3NlZjRU1LU3VqUkY3VldsZWNOUTlr?=
 =?utf-8?B?dmc3V2pYWHJTUzVkSHlySFlaaWo5SEFVTncrbGNNTHFNVjg1c2Q2QW1RY0py?=
 =?utf-8?B?OTZCb2xFdU9oYzF3ekRtWmxHa0lUWUVwWmhRdW9Jd0hMNmFjWGw5c1o3Sncx?=
 =?utf-8?B?bnBhbjJ3M0hDY0I5aDl2eUJkUnBtTFNhUmNkb05MSkI5WCtmemRJaFUvZ0wv?=
 =?utf-8?B?Ti8vMDNJKys4dXlTU05YR1VSenRCRG5naXhxYW5COG5qQzFDN3FFaUtQclBk?=
 =?utf-8?B?UGlEdEZtVi83SzRBMks3NjkzQ2d2N3VZWEh1RXU0emRIZVNzeWRJbEZuZS96?=
 =?utf-8?B?VWtYa0NIVnh6T1QvYktieVpYd2pGM0RWNmYyMjJ5UkZPa29ndk1ab1RaSmFS?=
 =?utf-8?B?YmRPbm4veE9IbjhOWnorUGsyemRxRlphQmp0VjJUck5GR3NXZHlLM0xiQVJo?=
 =?utf-8?B?VXVqbkxGSDk1TGNlV0FOZmZhVXhEb0dXSnpENjViNlh2YmxqUzZCUGE3c2JC?=
 =?utf-8?B?RkhaVmdOZ1dxQ2xFSUt4UUJsVFpzTERZdGdRUkgrOWtUZDFnVnJFcVZGNTMv?=
 =?utf-8?B?T1Z2VlVyeStZaHhtellUT2NOYzVVY0kySzUzUGl3Y0lEK2tvd2JqQzJlT0Nk?=
 =?utf-8?B?OXRDckxzMm84elprNmx4RW1GSXkwdWtwQUdIdnl3ZUgrQVBtaXhpOTF4SUtU?=
 =?utf-8?B?QktBMEd1TUxVTlFNck1kdHg0Z2s2SnN5RFU0cUw1REVLOTVnbWlQWDJldlVP?=
 =?utf-8?B?aUdrM3BUTUZwbDl4ZTJJbkJjS25WK0V2UGV0NU9nVXpTNWE3eWhTKzc2Sm9G?=
 =?utf-8?B?T0l3K3ZZSTJVcm14UlNjekFsQkxnWWIzUWlFL1d0ZXhHVXJRVG9SdFB5a3gz?=
 =?utf-8?B?TTYwZHNHUlhvb1AyWmc3RHd2UG1aTXlCejk3TXB4RWhOWWFXUWpFVXRCSlMy?=
 =?utf-8?B?VG9qVzBXa2JrSW03NXJkaHJmbHBiM2N0MTIvWTcrbkVwNDVjRUVNcnNoZm5q?=
 =?utf-8?B?UU9Rd2pTSzZUS29Bc3NDeHdDZkYrb0RRTlNpazhRdFI0MHRYMVFpbTlweUdZ?=
 =?utf-8?B?L2NoanIxVzlsaHJ3ajdnSXpnemhYM0piSE9Vc0JxbGw5T0g3UisxazFLVTdy?=
 =?utf-8?B?UnRhK016enF5bXp2czNYQStscjRkcTNHZDkwOVlzVFFOeGJEdGNCUUFWb2pq?=
 =?utf-8?B?UThvaFI1NTEwNjNGc1JxMVBIMktObFBZbU1HVG5CQ0FuZHFqbU4raDhyRjNa?=
 =?utf-8?B?WU52VkcxTjUrSTdLQ1VyaWFLQk1zSWdVNGtnT2hiTmlIdmx0REJpeWI2YWlu?=
 =?utf-8?B?YXdHaTMvUzZEKzE4UkcwYUY3clJqbVN3bjhrTWxtL1oyWlBLTVZ5MGk0RVpp?=
 =?utf-8?B?RDBRTHA1NHFHaU83MW9KWmJTT0kwRENEQkdLcjNPZzBzclpCSXp3VHJuUnlu?=
 =?utf-8?B?eG55cEgxemZsQ0tmK1NiRDU1L2E3UEJqbzJGRkR1aVFuckJJTm9wU2NNMVpx?=
 =?utf-8?B?RjZKVU1kUC9KYUdpdVZJbklCRjBPaVVVN1RhNjcrVnpqaThPY1BXY0k1d0pi?=
 =?utf-8?B?R1RJcjdlR09Yemp1a1lwYTJoRzdXZkpDTGN1SXJ4cXp2UUxNcU9wR1NyNHlv?=
 =?utf-8?B?dldDMTk1dm5EQmhRWkgrR3I0WmZ3anZEK21tTFlXeVZoV0kvSEVZc1Nrb3dP?=
 =?utf-8?B?YWZUZTBxalVyRFIzdmpjWUU5NUZlaFNBTVBqdG5TMDZSTVFYQk91Y2g2ek9T?=
 =?utf-8?B?TXBYODZqRGZwaEVZV2ZRUXlJb1NQV1hRenhyd1VYSUhaeSsvUUdkRjZiM1pq?=
 =?utf-8?B?WTlDTVg1L1RHTGV6dFNoMHlDdXdmREVkV1BZRU51QlRkK3gwZVQ0Nmo5NGlQ?=
 =?utf-8?B?SFc1R29vK2xwOWdrYlJ3aXo2NXZ0YjROYTA3NjMyanNJTDRMaEtJWDlJc3po?=
 =?utf-8?B?RFpTeUNpbXVPM1k1a1YxYkNrY2FtcnFkcG1BUjRKTkxXaGZZT0FmUWV0V3VQ?=
 =?utf-8?B?dGg2M2pCOHdqenYydmIzUGlranMxb3luM25abDI3WWYxaVByN3E3TmFOV25C?=
 =?utf-8?B?MmpyT1lrTmcxNXVrNXFwYnR4ZnREbi90OG9DUUN2cTBOdDFDQzhUMlJacUxa?=
 =?utf-8?B?dTNGaytGekVmMVdORTJ3aXF1MmlZQ2Jpdlk0ZVF6R29LWFlnOVhoVXpHaEpr?=
 =?utf-8?Q?oDu37iXZl9ixn/XIM7W9Q/g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6610f8b9-9749-4f80-235b-08d99ae6b9cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 14:16:40.1702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d2G/5XOxAku8L325bfxJCVNs5M/T0KL1WLsUDHKnaPp53nAIMllGlGK25xSdW2zBH79aoiq8/Bffq7dZaBgf4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3211
X-OriginatorOrg: citrix.com

On Fri, Oct 29, 2021 at 02:25:22PM +0100, Julien Grall wrote:
> On 29/10/2021 12:04, Roger Pau Monné wrote:
> > Hello,
> 
> Hi Roger,
> 
> > On Fri, Oct 29, 2021 at 11:01:29AM +0100, Julien Grall wrote:
> > > 
> > > 
> > > On 29/10/2021 10:41, Roger Pau Monné wrote:
> > > > On Fri, Oct 29, 2021 at 09:58:55AM +0100, Julien Grall wrote:
> > > > > On 29/10/2021 08:59, Roger Pau Monne wrote:
> > > > > > diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> > > > > > index e510395d08..f94f0f272c 100644
> > > > > > --- a/xen/common/grant_table.c
> > > > > > +++ b/xen/common/grant_table.c
> > > > > > @@ -53,6 +53,7 @@ struct grant_table {
> > > > > >         percpu_rwlock_t       lock;
> > > > > >         /* Lock protecting the maptrack limit */
> > > > > >         spinlock_t            maptrack_lock;
> > > > > > +    unsigned int          max_version;
> > > > > >         /*
> > > > > >          * Defaults to v1.  May be changed with GNTTABOP_set_version.  All other
> > > > > >          * values are invalid.
> > > > > > @@ -1917,11 +1918,33 @@ active_alloc_failed:
> > > > > >     }
> > > > > >     int grant_table_init(struct domain *d, int max_grant_frames,
> > > > > > -                     int max_maptrack_frames)
> > > > > > +                     int max_maptrack_frames, unsigned int options)
> > > > > >     {
> > > > > >         struct grant_table *gt;
> > > > > > +    unsigned int max_grant_version = options & XEN_DOMCTL_GRANT_version_mask;
> > > > > >         int ret = -ENOMEM;
> > > > > > +    if ( max_grant_version == XEN_DOMCTL_GRANT_version_default )
> > > > > > +        max_grant_version = opt_gnttab_max_version;
> > > > > > +    if ( !max_grant_version )
> > > > > > +    {
> > > > > > +        dprintk(XENLOG_INFO, "%pd: invalid grant table version 0 requested\n",
> > > > > > +                d);
> > > > > > +        return -EINVAL;
> > > > > > +    }
> > > > > > +    if ( max_grant_version > opt_gnttab_max_version )
> > > > > > +    {
> > > > > > +        dprintk(XENLOG_INFO,
> > > > > > +                "%pd: requested grant version (%u) greater than supported (%u)\n",
> > > > > > +                d, max_grant_version, opt_gnttab_max_version);
> > > > > > +        return -EINVAL;
> > > > > > +    }
> > > > > > +    if ( unlikely(max_page >= PFN_DOWN(TB(16))) && is_pv_domain(d) &&
> > > > > 
> > > > >   From my understanding, the limit for the grant table v1 is based on the page
> > > > > granularity used and the size of the fields.
> > > > > 
> > > > > So the limit you add is valid for 4KB but not 16KB/64KB. Therefore, I think
> > > > > it would be better to use:
> > > > > 
> > > > > 'max_page >= (1U << 32)'
> > > > 
> > > > I'm slightly confused. Isn't Xen always using a 4KB page granularity,
> > > 
> > > Yes. We only support 4KB today. But most of Xen is agnostic to the page
> > > granularity. I have actually started to look to allow 64KB/16KB page
> > > granularity for Xen on Arm in my spare time.
> > > 
> > > > and that also applies to the grant table entries?
> > > The page granularity for the hypercall interface is whatever the page
> > > granularity Xen is using. So...
> > 
> > I've somehow assumed that the current hypercall ABI was strictly tied
> > to 4KB pages, as that's for example already hardcoded in Linux
> > as XEN_PAGE_SIZE.
> 
> It is a mess. Before, XEN_PAGE_SIZE was introduced, we were assuming that
> Linux and Xen were using the same page granularity.
> 
> When I introduced the support to run guest with 16KB and 64KB, then we
> decided to introduce the define. Looking back at the decision, this was a
> mistake and we should have introduced an hypercall to fetch the ABI
> granularity instead.
> 
> > 
> > > > 
> > > > I don't think it's possible to use correctly use a 16KB or 64KB page
> > > > as an entry for the grant table, as Xen assumes those to always be 4KB
> > > > based.
> > > 
> > > ... if you build Xen with 16KB, then the grant table entries will be using
> > > 16KB.
> > > 
> > > So I would like to avoid making the assumption that we are always using 4KB.
> > > That said, the worse that can happen is a spurious message. So this is more
> > > to get an accurate check.
> > 
> > I don't have strong objections to using max_page >> 32, it might even
> > be clearer than checking against TB(16).

FWIW, I've changed the check to use >> 32 and limited it to
CONFIG_64BIT, since on 32bit arches max_page will be a 32bit value.

Thanks, Roger.

