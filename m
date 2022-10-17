Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39303601B86
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 23:51:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424622.672180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okY0v-0006V8-AP; Mon, 17 Oct 2022 21:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424622.672180; Mon, 17 Oct 2022 21:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okY0v-0006SF-72; Mon, 17 Oct 2022 21:51:13 +0000
Received: by outflank-mailman (input) for mailman id 424622;
 Mon, 17 Oct 2022 21:51:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okY0t-0006S4-Kj
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 21:51:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf27a50-4e65-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 23:51:09 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Oct 2022 17:51:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6595.namprd03.prod.outlook.com (2603:10b6:806:1ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Mon, 17 Oct
 2022 21:51:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 21:51:02 +0000
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
X-Inumbo-ID: cdf27a50-4e65-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666043469;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=x1uUXB+R4E6QSAhWQhgc0QXbuS4zW7vt6yZNjAdIajE=;
  b=U3qBSG2sRVb1Gimu5WxcDrez9Tc15ClmFNtG4G3/hb75OooH8oddziyc
   ZDm5F9kfv8IgrJK2KdxXA5Gz2N8H5q5K09xKtiodw04yFWoajnruSjQwo
   JZQo9wzIdqWMi/f+A1pxYgW8cFvQ1qIdE/InC5QdfG2MYMU/qKTi63P9T
   o=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 82950221
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A3kihwK3A6+R5Q2rEvvbDix16xTcKaHBdZcB5N?=
 =?us-ascii?q?8R9jSZ0Z1x39YIjduZ9IuK7yVSIAfTWEZbPRGaj6wykQKmNBg2MwTOCMcepk?=
 =?us-ascii?q?wWycd/QEFLIgeHNFh+tFFzVAPBZT3GfoNwE+iY4f6stY8VLzgljYwybnvAVi?=
 =?us-ascii?q?EzAwRR1FsScuf5qQznk4lzJOl7OJCDKut+YywykFzlSnwf+1e1WFfrn7pvey?=
 =?us-ascii?q?9GYFP1+ZxWF4paMhbxFEjHwmRQABQVtnBkHj2/jtzDK0WQXm+wJixsFiyhXE?=
 =?us-ascii?q?5E01CsTyEU6jwFgLm8RcUdUIL1+UKqwzzFCZ8xzKn6BoEw2TKH6q5VrfjEyw?=
 =?us-ascii?q?FmVTZq0szBN9WI3YW/qha1HkOTBcj9FA7z38LnEQ22e5So5dgla2NguvtCdf?=
 =?us-ascii?q?myrZwMLbEp8s/6EO4Ze1eHzPWuD0LJTA2jij1hv3a9fMjvo7k2lYDx4FvHYL?=
 =?us-ascii?q?gdtiGnCCJHHgDnGQHMybwOGFiJ+kORZPudivZcCv0BpxWIUnGq8UwqaubjX3?=
 =?us-ascii?q?ut2JISBTvZ13iB7rqDP8KcbtmivUweDXa/X5RHEGhV84Vj9CfqaNJ7KuPRaN?=
 =?us-ascii?q?1/1IpyhSoLq4RHmv0AaImPl1cuS4alUWnGZDDm4uB9IvKmf8VHEt4VKP1wi8?=
 =?us-ascii?q?z/B8deZrUeZ4s4Q8NkSHJL7GmEMQeFn7DB8opg0oZQFh1OHjBk+hhB7VLhri?=
 =?us-ascii?q?IgDdLQvcWLeh0dlBFl/tTP+G0ejZi8BSIW7lBiQ5iUQ2jbDkEbMp2eiG41J6?=
 =?us-ascii?q?9P0hNVhzRbPIpFK6hiGcuJRDazvjv3tfKWmbtAcQKOutKXHXGKkPN+U4gID6?=
 =?us-ascii?q?iQ23PrEM6bGB+uwP+JHePS+YFDRJjdSV5a7/lFezRFhTa2+pXVVzvTVp4Iwz?=
 =?us-ascii?q?XBaoUYkOqrSkJbQ19jjJo2LGOUc3nOy5/p/62gOd9YOrBXVaPjIJ2U/kIi5o?=
 =?us-ascii?q?wzjSUdvOacme9UmeO8WuniTWkgWCq+xOvfFynET2H/SMfr7Z5UQ2IQr6EE3i?=
 =?us-ascii?q?uIXvKvySbMv1FcOBQg2Ib/hdqxfnIbZ+Y10ZCyuIOEh+FlSz+jBybZu/RjKe?=
 =?us-ascii?q?aaZsOjJNBKYNLMtxln6lZ38DCNIGuX1ntewgBn1/IsHTTsx4iAbuTJmtRsKd?=
 =?us-ascii?q?UhnPFcNFAnnGX4acTUMm9/zUvdFLs382vi3idz6eD322TPP3/n2LknWy4V8f?=
 =?us-ascii?q?EgVC6HuZsCTVCl+y2TBi43ovmg9xOSskBgL5usF7NPFAEtHXWQNL9WkOH/d+?=
 =?us-ascii?q?jACpNNyH0u3npGtd0A/Gvh1lhaA4Fy5yj4WT9QD64oIg4scTW78zekdRqADU?=
 =?us-ascii?q?2QSiWBZnvxSDFN8WhAKneQF8ladv64ue6Xa2uDdOknLgXBOTZdjKq/kkSlNE?=
 =?us-ascii?q?iFbs4rs9kiHGZf9/B8EhxGpuuN1qYB818jmIoIDCDIpiuzO4EGxypJ6ZGnJj?=
 =?us-ascii?q?K9WbSElH0O1hh8XQjn8WJDMlGbmimH3kTb96yY7iBSgyDx8zP8mnsH9EKimP?=
 =?us-ascii?q?S4lJo0KhV3U3zuUKAEzubtozubbH6f3gu6WD72JLwue+/oEmvJ6Ei6EiDLVo?=
 =?us-ascii?q?tuo3f5fL4kPiFVMj6FR9f/ZOmK4FYo2tRDn0llzFTNMomg+jQbJZ8xbZVk4R?=
 =?us-ascii?q?E6+QAHkYwXzpJwhsMH+wihFL7xf4WQTBMPUuwKcic8A5P0vP7fpZaOl6RGia?=
 =?us-ascii?q?A/0Z5nSjkHBLYhxrYj8KAKKG2QozGibSnTSzLotwjOu+AmR/HSNHKH9Vd70U?=
 =?us-ascii?q?UFvOBJFByeny3E2QJESlU6KC2cGls/KgExIO46wAeRKOEq+I09si/zlh1+Y9?=
 =?us-ascii?q?hfR94B5eBhyvvklYVnYQ0M1Qzb9UE6bW//uL+YV29iYK0bOyAAyZ1ZQrcF5y?=
 =?us-ascii?q?VaPT5kOjr8akR5WzzwAWsb3jTlS2zq/2FpqtqrLVCJlboZBhvfX6GRWFyREl?=
 =?us-ascii?q?9xVxaRUPqTbnq88A1d2MUjtewCUHm1XfkiwyftSA7dRusSHcDalRBvev+/EV?=
 =?us-ascii?q?hqs8yWMMybjzJq6P9X6aXpH/L/5G+Zc0qX2qNM/ilyF9F/WVYeH0tujB7lFO?=
 =?us-ascii?q?SDrxfYuvc676/pkvjTJ4BIpMALlBqUBVGrwVes88iOiKJwNHbWnaNiUvWRBu?=
 =?us-ascii?q?OxQUCF8TO0SA9s02bI+i7z0ClctX/A0G+3XyKcRwpdPYbvgsnh8rpK9g4mBI?=
 =?us-ascii?q?WLlRZkZiZuBj6a1pG5JNWdurvmmt/6f97EEwORwwbplYtDVShWRjJzSEaiC9?=
 =?us-ascii?q?uYbr8jWRgFI67eV9JLHhxo/7LJFrOrJTORajP47tNEZtS/g/Tf0tiv5hTt3M?=
 =?us-ascii?q?QNVvBn062tLPTTteXXAZps2ikZJB0soTHE0mLfnNfmrpJBUszK1kua2jHR2Z?=
 =?us-ascii?q?R5xiu6JRfJomIq7cF6EBCJti+Uln6N0gWiThF4860Fi8F91wMJY3KDiI/Lup?=
 =?us-ascii?q?T+2/P0mjaXl9EQWYjKgIfQRbdc4H0GDjUHyn2rRvFtfO/uxGQ5K0gF2sM5CA?=
 =?us-ascii?q?jmS2rQiMX2hvfGgBAImTh79zxGaI9NE61C3iEEHmZ7Sf0rFJZKFTchnendN9?=
 =?us-ascii?q?S8k968ep4kwKQZ/E+j0nQr16zVYU5Bi6ioP4hQ9PQZlYusx3XCLyBjadp5gV?=
 =?us-ascii?q?f7qUYF/81X+D2/+eJrM+Vz4dwCebIxDYDmWV6bV+sX5bhqzhVB6o7uAD4XKu?=
 =?us-ascii?q?alauUKODojzoKsvF289Qhpvvj6ZL36ttgA1hwj+?=
X-IronPort-AV: E=Sophos;i="5.95,192,1661832000"; 
   d="scan'208";a="82950221"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMZGmTix9IHvnC2Lt8sMkaCub1sy3cCKA3Kg8sLWR0EBLKGgOPK10tynYKVf9GXLX3YdMgKtzvOAW/ljPwWXngkHXk7oOH33grUDPb7zWczMIrliPZjnH+UOXP5Njwk2pjFJZipyQ7xz7bG7cQ3Ngkou98LY/tsRWzy63RcnYzfgQ+U8NUz3HbpKpSFJ3etuMKMxI+PvM/vObo9Jjo9X9fR/2Hcm6yjYvpe5DjR38tfvExX05ba0XzMytBsl8yKoteTgDlDPOunPVbZrfbJOfXVhGYb08d7kU5GYGVA40F5aKa203Y1M8ENVg7Sju7TfdKMWR/l72CGuhr9MXiZtyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1uUXB+R4E6QSAhWQhgc0QXbuS4zW7vt6yZNjAdIajE=;
 b=PFu8rWabdN8Oqli5rBf8nisclhV2XGff4ZYv9ZVbS4lOzrdbxwcuuo5jrpz6fEaB+t7QeXZibBsv8l+AVbafK2NrwJSXdLSDL6CkxTy0+j086C19DAK7PaB/6z5HZC1WnnLrk2nxVKgB3KxI7qaFu3zE6hOmPAHAQD5LU/ZjC/7GyDi1TechEtufV7hEi+WyLmgCwI2etrsEtKeyGVty7scEN7PDNbYgDJuwLgzPlkwSouxPT5CgNo+E7WPU3+utp5jLln5EMN8TPbV8PJL6iZ7HZPV24UkGKuSiRceu1rYzYRLpFYHLR7Qj0yAvQJ9r/GdVQTTsNvZYaiXrV17GuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1uUXB+R4E6QSAhWQhgc0QXbuS4zW7vt6yZNjAdIajE=;
 b=hRKU/5LlODQUXQYr4kJfZ3/df14LW/C6yxX8a1G7plD0kuOlYfBwg6f1opAN2VQAJzTR2OrPDfbC+JtTTGTEqQygYdRo8C3XrvJ4DSn/aDYZLFqnjnmqRF0JQtfal/ahIcEz6aDB+sOMket3nY61bkhL9qrODwVXWnyWGIuMWuE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 1/2] arm/p2m: Rework p2m_init()
Thread-Topic: [PATCH 1/2] arm/p2m: Rework p2m_init()
Thread-Index: AQHY4lx4FOMRDEiHEUC2Eqcrjw6xi64TCE8AgAAYEQA=
Date: Mon, 17 Oct 2022 21:51:02 +0000
Message-ID: <87f07673-4a3f-5971-1cc7-3bde637f34e8@citrix.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-2-andrew.cooper3@citrix.com>
 <3cd9f882-090a-b4ba-df87-663a9a375737@xen.org>
In-Reply-To: <3cd9f882-090a-b4ba-df87-663a9a375737@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA1PR03MB6595:EE_
x-ms-office365-filtering-correlation-id: e6b43c10-2b23-4eda-72ba-08dab089af3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 U+0P2tkp6jzYQ3nTY6JxyQIO2yeG/MpZ6SNXg52EgTWhkgd4Mpu5QJHl4oONWgS0BCSfiV46IDWhb6qYJn8cuJX9oysVmG6v6c0o+t+1MYqmAjSf/3oxWfiSWrikPRjcabLYhu0W74rxmN7vofpFMcr/wTXhKBHKHh+gmBeuh1Hg66DR7e6WuuuajwTKTlH3YpaQl8d/3dCVhYU6NT3ekJR/lLhIskzFE9XxTd+I9HZZXU4j0rBC/9PptLW2eF2c1X3vRKNT6XQZ3BY/YGdADv5PLSUGCMixYcKG0iNTBBTvssichU6auLX0TpEdTD46ehhOf436y1/J1NWSlB0Yn+ArmKKISi5i8pYwRNGFbOzHZB2lxc7R4K4qunjOmM6EPxrNnmAYo0P6df+nUzvysYUWHIxUubMuC+usbDTIPJRs5nXRmP13iSxvlpzddHl1hkQFvZeRMEnnS1EWGPYcH4MzPUUTY8xuKhhSAZjdQj2eLOe1Q2lfbCAeTA5crUd1FIEB0Gm5OQhVI4KfKR+EL2uuzbjg0y9xH+od2LifBGnUDIkKhoWu7YDJCXMty2wiKdaZHOH6PwjjwvlwAvqNItsNTfNGsWZj6XbaorUOBpFSNGUgtBTkGDMyEoD5REPOCpSbNKbzW4YgmHF9N3WQHoqJJQR3aghKjtHy19AxirHfQ5cdY/b9umNC6NwnMxa3QoTS8r7i0kUvxAnVcpMFA959l2LBqAyFQSp18T6cIPVI8iu792o6s50ubbWEP1hPAKXsaR1jAFGK0DjwfxpFPbRLxIQDt13J/cBXWy9S3ICPv2wCaPshiCVwZEECm1OSWQsnIFMizNb3GmxZ4yDcWg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199015)(186003)(31686004)(2616005)(2906002)(6506007)(26005)(54906003)(5660300002)(316002)(53546011)(6512007)(86362001)(38100700002)(41300700001)(82960400001)(110136005)(64756008)(8676002)(91956017)(66446008)(66476007)(4744005)(76116006)(66556008)(66946007)(122000001)(4326008)(8936002)(31696002)(38070700005)(478600001)(36756003)(6486002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dTRySEFQRVd2UUs1b29sNHh4OGlpRm1CdEcwaHFjVVpFZWRScERWN1FuYmNY?=
 =?utf-8?B?RGxPV3RkOXhyWngvQUVpM0htcHpTMUoyUFk5ditueDUyNmUzUE9iem1WbDhY?=
 =?utf-8?B?R2dqakxNR0dUTUpOWml1NEpET3Q3RzJIYWRFdFAwMWxMUzR3MkFoaXh5LzNK?=
 =?utf-8?B?QjBOOTgvSlZGeTQydGlnN3BGR3FBMXp0cW5SaDhITktIVFc3WDhyUWlkWmFU?=
 =?utf-8?B?SGR6S3JPWTZ1NXN2bk5xSkpCVE1TalBOK1dWYWxWOHZIUUxpYU5LSGtNSWdm?=
 =?utf-8?B?QkNuako2Y2Z3bEkwWkplQVR4S3doWUZyQkxQdHRnN21yMG9Kdis0c1pFcGpL?=
 =?utf-8?B?Z1hDNS9PQmdkanI3TDI2YVBLSDlLdTV3RHJjUEVjcU5sNVV6Y0tBdzN3QW9M?=
 =?utf-8?B?OTcrZG9iYXZXdDcwOURHdjgrR1h0VXNTVThpVEEreFhSa01lWUg2aGhqdUhw?=
 =?utf-8?B?ek1QQ2ZIeURXdy8zcHpoQngrZCtORVQ2L1RxSHpIdm9rcTZQR2FQVDlWeEFM?=
 =?utf-8?B?OWJvdUEzVW44ZENVZHFHWHdYclBqVE55dHBFeXZWcExuaDI0NFdrV3BCYVRP?=
 =?utf-8?B?RHZnZnVJWCtmbllUNGtFb2FpUWRWLy9jUEpYTTg0Y1NraU1IajdudkxaWUMx?=
 =?utf-8?B?cEgySDFiZGxSNkhIMThLOWYxZFg3anNmTjl3TXRobk1Yb05mMm1qcjRYekkw?=
 =?utf-8?B?UFRLV3J4SjZyWWxRcWdRc2JNalJZelo5encySE4zaFQ1TDBoT1lrZEx4RDM1?=
 =?utf-8?B?ZDhvRUdKSy9ZRnBkaHFVRjZGNEVBQUNJbVhjczg0aTNKTnExVHdvUi9IUURy?=
 =?utf-8?B?OWM4WnN4L29HTEJWUU9ZYjRJUEFlTkxqdGNSdWhPVlZaRUJiOENoM0NOdytk?=
 =?utf-8?B?dWYzK3B5Qk9tWEc5WFhRVXc1ckRIOG14UzNCUHo4aHA2WFppZXJKUEdaSEY3?=
 =?utf-8?B?anZqZTV1Z0V5UzhkOGV2T2lHK1Byem5TSWNLWnkzTzVTTHg0aDhtZGFVYy9v?=
 =?utf-8?B?Nk1OWGVoN2tUL3I4WHZNVE5lbTl3b1JZdDdhVldpMXV6VGkweUtLa1B4S2pO?=
 =?utf-8?B?bnFRTzQ4Mng2dEhMeHBudWsrZ01Qb3F2TUMzSWVUQmloeVFnK1RWNGF2ek1o?=
 =?utf-8?B?eUtiMW1YeTBiRnNoREJnWlNOQVZJa3dQdThOVU1GU0pCSEs2WnIxU0FRN0pZ?=
 =?utf-8?B?VDM3aE01MU9xcUJlM1J5TjFKUzVFS0VFUWFVTkVmdWx5L3VJc2VXa2VLQ0dU?=
 =?utf-8?B?cVdBL2xEemt5MnFTMUVvd0x5djU1V2pPUFZJTTVKUHRKalVxOVZMVFNBa2xp?=
 =?utf-8?B?QzFXOWZXQUZRTTlOME10L0VTYW1Zdmk1eTkwVGVEWUNkZ1hmSnhOYkJOeTJy?=
 =?utf-8?B?RXA2S2NXMUpZTVpBZWFqNG1RNHJHY1RsSDJheFp6ZjVXR0hINzJVSFpkTmI5?=
 =?utf-8?B?ZVhka2NpcnkxNzJVSVZ1QXkwc2dMamR2OFgwTVRaV09KZU5FMlVEa2F1dWVi?=
 =?utf-8?B?alVTU3BjdXllZXFjT1hOWFRSa3VqK2IyZk5ZVEFONFdoQ1hEQnIxZWZnYmNn?=
 =?utf-8?B?TERLOGhUYnpNR2lBVXNiZzAyR2NtOENDd3hRNUNCL3psSmFxSmltYXk1WEE4?=
 =?utf-8?B?WnZNUGRxblBvaS9NeDFaVVAzeUk5bDVPaFJpeEVjbmpDZDYrRzhXNVJ1YzlH?=
 =?utf-8?B?bXhjb1dRRjEwWW13Y3Z1eEVCZjhPRGpQazZzeUN1NGplNzJYVEdLSmZDSldJ?=
 =?utf-8?B?WjB6V0RQRUJ2QTZ0bDVSYkxkZUFPeEZNb0RJcE5aZkpzT0hNMEhmYzBHaVRO?=
 =?utf-8?B?d1RNVXNSZEE4VzFsdEptMVNQajZ3VTRwQVFXbktHY1FSZWEzWGRoWjJFTmYw?=
 =?utf-8?B?UEdpWmdaOEkyUUtSWDFPK2lLSWpBWVcreGZCcjZTd3RDeGdMTW1vWU9OM3Zv?=
 =?utf-8?B?TVBiNWRMZWZBdXpmMzE0U1UxNndxY3k1RFlEVHFQbmx4TW14di9wZnpEbjhk?=
 =?utf-8?B?MUkvL0NWYitkaGczYW1uL25haFhWOEpDMzRNUlZXeGZZdndRK2xSK1JRN2Ru?=
 =?utf-8?B?Tm9KLzBobWx0VTF0MjF3RmdVZnJPK0F5V25BQmRsOFE1N1ROWHcvSFY2aG1m?=
 =?utf-8?Q?LO0emmwgpMJ2zj1lOfE5LpiTL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48E71F54266F29409ADCF0316588DB64@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b43c10-2b23-4eda-72ba-08dab089af3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 21:51:02.3056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnHOTbBqF/J+QhFimeVRfYw+TjEIeNt9Ij3AmMcfrgrFCBKzWTBC6wirLF4BFCOupkHwAWHVVZHWd6cOeTb90U1t0WWUWsH4NnMUOTQMwYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6595

T24gMTcvMTAvMjAyMiAyMToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBBbmRyZXcsDQo+
DQo+IE9uIDE3LzEwLzIwMjIgMjA6MTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBwMm1faW5p
dCgpIGlzIG1vc3RseSB0cml2aWFsIGluaXRpYWxpc2F0aW9uLCBidXQgaGFzIHR3byBmYWlsYWJs
ZQ0KPj4gb3BlcmF0aW9ucw0KPj4gd2hpY2ggYXJlIG9uIGVpdGhlciBzaWRlIG9mIHRoZSBiYWNr
cG9pbnRlciB0cmlnZ2VyIGZvciB0ZWFyZG93biB0byB0YWtlDQo+PiBhY3Rpb25zLg0KPj4NCj4+
IHAybV9mcmVlX3ZtaWQoKSBpcyBpZGVtcG90ZW50IHdpdGggYSBmYWlsZWQgcDJtX2FsbG9jX3Zt
aWQoKSwgc28NCj4+IHJlYXJyYW5nZQ0KPj4gcDJtX2luaXQoKSB0byBwZXJmb3JtIGFsbCB0cml2
aWFsIHNldHVwLCB0aGVuIHNldCB0aGUgYmFja3BvaW50ZXIsIHRoZW4NCj4+IHBlcmZvcm0gYWxs
IGZhaWxhYmxlIHNldHVwLg0KPj4NCj4+IFRoaXMgd2lsbCBzaW1wbGlmeSBhIGZ1dHVyZSBidWdm
aXggd2hpY2ggbmVlZHMgdG8gYWRkIGEgdGhpcmQgZmFpbGFiaWxlDQo+DQo+IFR5cG86wqAgcy9m
YWlsYWJpbGUvZmFsbGlibGU/DQoNClllcywgZml4ZWQuDQoNCj4NCj4+IG9wZXJhdGlvbi4NCj4+
DQo+PiBObyBwcmFjdGljYWwgY2hhbmdlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+DQo+IFJldmlld2VkLWJ5OiBKdWxp
ZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpUaGFua3MuDQoNCn5BbmRyZXcNCg==

