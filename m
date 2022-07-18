Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA957819A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 14:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369741.601216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDPX4-0002Gg-9D; Mon, 18 Jul 2022 12:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369741.601216; Mon, 18 Jul 2022 12:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDPX4-0002Er-6U; Mon, 18 Jul 2022 12:07:26 +0000
Received: by outflank-mailman (input) for mailman id 369741;
 Mon, 18 Jul 2022 12:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fb5k=XX=citrix.com=prvs=1919bed39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oDPX2-0002El-KZ
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 12:07:24 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d7cfe8a-0692-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 14:07:23 +0200 (CEST)
Received: from mail-bn1nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jul 2022 08:07:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5162.namprd03.prod.outlook.com (2603:10b6:5:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 12:07:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 12:07:17 +0000
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
X-Inumbo-ID: 2d7cfe8a-0692-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658146043;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=71G+fStirrYUkJ4mzyRcDJxUWxpHi1a7C+0G8jbybpg=;
  b=BfuyGPAIyV5zv0V04UICRUt5d5KsKcaoUKFAdRCfMtG+/m4fiG4P5ux/
   IueAyoQLCBLrCDL+T1jQs4oTdZzG32zgzx+ysLygMd/dCWpT3YgUsre4Z
   FNvT30tKLDdRZrMacPn15KIrCboIqJc7Ri/mMuVjyZP3BN3sYHx6ehamr
   I=;
X-IronPort-RemoteIP: 104.47.51.41
X-IronPort-MID: 76025477
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3A2MSlZ6gCTtyCuAC91B6zpIaNX17brhtdnwn6u?=
 =?us-ascii?q?qucsGbUi9Gq9fh2uw5+26WXqo9YJnHy/Jhw1uoMPFhmrcXU2MMGZ0S4wqaCU?=
 =?us-ascii?q?6ZbeYpXDXyySKj/mddbAKH6d1lOz2nMjEBqjBo3k4vwclWaj57F57BiDyQmz?=
 =?us-ascii?q?VpxU/lCn3VQ0buTWZElw7iyawxo5YFTZnw3CIpsBp8KOIVA038YH5uEYqLK6?=
 =?us-ascii?q?UxHJdfLjukIWiOTjwzLRQe/iTvNMJ0RP0zkKs4G3FzZwiq8MvA9PNl9k2Mc/?=
 =?us-ascii?q?NLta+paKIS5pKe2nNq9Dchqd6xohxXnh2rgzWEzQbjLjUEf86kRYAbHb/5bX?=
 =?us-ascii?q?vzWG1GwxFFfSEsaIADBe1/YU0NpyRVd9E2rTYHaGKWPAg2p+SchuGOwXNR+v?=
 =?us-ascii?q?fzyuNdV/rShhkTvUbfiOAk+NesarXhjov7a7PdZWwYYQwif7QzCZHZjbGK6C?=
 =?us-ascii?q?4D7dD2gL5me5i6ZAZ2NcDRhaO4j+bheI+EP7RsSoYNaz0q1qFC54IatEGc0i?=
 =?us-ascii?q?iD2UAutAWAcfoppLCiZuB1lg5Jh1cY9eN2nzc38WlLQOyVO05cf7hn5A8FHf?=
 =?us-ascii?q?87pAb0qkTdcKVVXm5LczZ/30klnj+NI7cmqHMtjWMlWmfK6AQwS31hQjVmTj?=
 =?us-ascii?q?Jc8afupcYUHQmqAdR1gWaO7e9ZUWEjw47elNHe222WnKV/TWLtl/UGMzHBU0?=
 =?us-ascii?q?/f0XEx1BZPy2q5epV7lvEsvVItZRZR9xK0HYPsb+ayVirAZenTnnl62hUvea?=
 =?us-ascii?q?gEXl+CSOQscBvjcDRK83VRGfuhgZd5/qp+Edgj1Nma8MCXDY8j30uPviLYnz?=
 =?us-ascii?q?VqTPl0+ApINl0g3jaCSQ7SwEbwvB0EktcN0ziNQ3mWWuXCpwWHQ9aLZUgrvV?=
 =?us-ascii?q?NvaQjwqZa06SmkvTpDBN0u8EhcqczNO/U6kpezKOrSDxNzILi8PmzH9uKjrq?=
 =?us-ascii?q?BbsfxM/PoTdzj996g0Xam/sVKROmQPteelXyrFT0MB9kt2zFJzldyxCDosiC?=
 =?us-ascii?q?1HtdgP7wW867EKEWK6vkzSJWgRkQo7cbj88Lb4Ht88AkmNSCJC9vCEny1Uy9?=
 =?us-ascii?q?BQOrW/AFv1Ma8trhfQ1H5wLIsEIEt+T2Zi8uBZ/t9dDApDOv6cuIljDUe4aT?=
 =?us-ascii?q?AHubQV8pJhE/vQZsC2LPfN/VhDpOmHWrqwURqLZYkKfLzEqT6nq6sI5OoiBg?=
 =?us-ascii?q?UAYBVeY0A8krgtC5EOBZR/FdaTtTtuyahHGAywR9vuSGNfmTXoHw08Ad38vd?=
 =?us-ascii?q?5EmNABAcFSmEGAKYFgOSoV9Th8Jm+0dhqm2Z4GKhAuMNxOy3HLUyR1b1bnks?=
 =?us-ascii?q?qIzacqOLmx83vvE1exz/39WrouiaP9631wvQoFAtwAFf3hVtI8qx7qMzQbAy?=
 =?us-ascii?q?z9wi7S5hx6UG/2hhF1E1GDdUTdPLoE8J9lBSG7D6Uh6Nh++t7K49WTwQiAOa?=
 =?us-ascii?q?0TcfIUGJrToKCDoS1jTJ+KoPL9ze5ob0OWp0FZOHokfKM37fxIdqQbttBcX3?=
 =?us-ascii?q?x9r8toAXg5LuDUA3asCIc8d2uCT417lVMhFaXi0JnPvhYqkJrD5KzthBWd8b?=
 =?us-ascii?q?7mLAFwQAQS7AO4Py0LRH6H+qgbNXv+fH+TNZq4NfJddoP9TMA+2YDr7HSuQJ?=
 =?us-ascii?q?GQGXmacrXWBDX+p6bYIVBvNWPBiiiY96vqYYp9vVXM7kSBPkROiJeN3DNF1q?=
 =?us-ascii?q?jVHYlTzE2L9W0aocsaJOKkyWT1Q+mzuYRZBTysz3+xDuuLnZK4jDUDc1pYA0?=
 =?us-ascii?q?9Ufkqg2kqtmYCa6P+cdaYvCjO8OwtM6ZAFG/trXCDqdDqkL8bGIZXCMTYKBk?=
 =?us-ascii?q?e5eqsQEr3PVxVU5e0Iwzx8l1alxXupm3FadhL9UWNDPatIL1AmA1+2zMDQE/?=
 =?us-ascii?q?O+Y/Epx5IP0098AeHwGKAavg3up2omZ/CrFfGr1iCM1nOwOMHaIly/0bKyez?=
 =?us-ascii?q?S8iP72hRy+/AnMb7QfqcqR/hoqup9Znu8vUAKQo/3FcOO+G6ojFZAwDGqsro?=
 =?us-ascii?q?a1o6hpirf5dsDsGmt0sBuGpPR8AhxxM0y9ll3HGUN3LqKfPFvmzRjRL7f0g2?=
 =?us-ascii?q?jbMsVGfoe4E77xIRM7n5+38CEWqcwx5RnnVRTFJXrAyucAwvYT+KaxRaz5dC?=
 =?us-ascii?q?RtDVCv+dshojfFuEUPiNEJ4Qc8f2NcQTsfplYRTvXGRpLWIyfL01BTmaiT2j?=
 =?us-ascii?q?q/wBuMcUUrwL6VcIvmOrnbSRMbaGS+UxXIxmd3jqqpqOR/th5wRwk/VF4aN3?=
 =?us-ascii?q?GFYO9HgdwRjiSpEhPgJZU4/49WQXsqGWSCJpYcJdqhDgOVx3UdwA+jOCOK/V?=
 =?us-ascii?q?CsKh4TQswt2pO3/gUiarvRlNANFHuKF1Z2jxUj9YJ1zi2y+zJH0rJrBCQ8sX?=
 =?us-ascii?q?Om6kI2lVYo1b8UgS0RAbezfxmISIRAk/feF5jXrxs1wED95mpEzM7XcU59Tp?=
 =?us-ascii?q?izF+APe02blUItVUvKIDhh0n/S4He3820ZFM4Xjc2dwWfPGSqNh7kMWoHd5Y?=
 =?us-ascii?q?itegz+VzeW0XUnVAMojTfiuY2qNu6H6u7bNjZGkV+y1fuP7YKMxkMKvgLDj2?=
 =?us-ascii?q?0TVonuva7ezwpyet5IbiyGWJsZGn2d/VXjaj4HO8DD35fxpwCmbjPXEkxC2Z?=
 =?us-ascii?q?pAFyPH5Fn4rnM5bViZAVq+3vUxaSAQywogsfYSEujLzM5YcTYe3w6uoiywqD?=
 =?us-ascii?q?twAwC+e8wkHJZ2NwbDZdwFWKvlJnyi4yZ7z+FEIGYPG7Uz6pVKGSHlvtG/Be?=
 =?us-ascii?q?mdgVU38AIeyiMjJgX4cYaZq9Q=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.92,281,1650945600"; 
   d="scan'208";a="76025477"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RSXQyinIdFmiJBEb3vluSjQQuY+8ZhhDX3ySD+V2tpCYtxVCTL6BDNoVcXRxImniaeum6rZj4XGIsSt7RP9WbQpka9awXiH6ILHgy9LH0J7cduEHeZn9kAzStwHI0mmK7uZkljKUxeZvZvyrt9NQw8hPO31l8Th/y6L0yWzC1bTRM8ANnSCFluZ3iZduC/oFKUrcijnEAXHGE/V3zfR+rDN65RWT4YKI7+JrzO8ZvLFl13mVVmjZgr2I75nHuN53dqEGjpJhS26dEU6XsWVgcmekp5vZ1fn5GiibtZtBIz1gh64dr4lyXtlowbxQ7GhmYOlD0Gb/QmDkIabA06vIHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71G+fStirrYUkJ4mzyRcDJxUWxpHi1a7C+0G8jbybpg=;
 b=n6JrQ8TJU7cVXTptCLsaTPBZP0fvCCIgefhj32r3Bq5gm1AJN71iHNcS1OKSh69uxEJ5iKM9C8SJA7eKLbAoQmssxM29Q5RcLGv3RoiPzIukT4hRD6LBwZ3ZLUvj7Nzql5rdAJQCf37pq7rYIKT9s0dxfgH1I9sYjzIWKVK3ncGnifnELnr2Jd2EWrJDl3vsHWaTifse271i2vvt6RUBpOzQhAUxymkL7tU1aOxD/f4KL+0O7/ar3jwoJmdGNOKPjDBMJenBotBmIxJ9tCTGVIiNlaN/J5RCh9ZKEzYUUtnf+ZrF3WrC4acueFP68m5ZGmtqlPJQWhqUwvR1RNfxAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71G+fStirrYUkJ4mzyRcDJxUWxpHi1a7C+0G8jbybpg=;
 b=wt5UV2rjRTsOOa50oZM+JwfwbcuRhrG3PMweUVW4N+rbqzXQKXmoEBotG7euJPdPPxKDe3O6GcuqDuRxEQ3ZOf89Jfhd9tt7ojnrgJ7mRkQRrYOgOiszP4nrEXYUsleJAM6DVUaIl8Z9aUsjbxYSNmh8a9+2c6UZ3X29QlpdeRw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Thread-Topic: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit
 build environments
Thread-Index: AQHYmE6f3nf19rITF02bMhbJMzY4w62D3CgAgAAFn4CAAATogIAAJoyA
Date: Mon, 18 Jul 2022 12:07:17 +0000
Message-ID: <18a3e8ec-4a64-7401-cbaa-98b00355914a@citrix.com>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
 <20220715132651.1093-3-andrew.cooper3@citrix.com>
 <dc25adc2-7e99-0394-a446-56a1e5e804e4@suse.com>
 <aa786e6a-7db5-f719-c8d4-26adba96475a@citrix.com>
 <465e44a0-2005-99bc-3fca-241b8c510df5@suse.com>
In-Reply-To: <465e44a0-2005-99bc-3fca-241b8c510df5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4ce02fb-0d00-472a-5914-08da68b60f58
x-ms-traffictypediagnostic: DM6PR03MB5162:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 1dkNGd8mTpB7FLd5iwrUShlX7O4y3PJBulfk+MLxGLImzhCubXUbb2FvPoiWGDXO3sTxV67NGI1vPKWfekJ2M6go+VL9a7i1MrMbAG3XVYFX5zNY0c6SzJHusqkK1WousVt9Ddos40EJpVlNrl+RFNlRrSh7AfXXSc4ilqfuIC47wGy5FTDWtxK4xHo8DY+fbj2Qx9KMKVNLFH+1Mcyj3548SAm9NUcVY4g7nbtQGsHFjCY826vPud9QcXUDPWOE9KcHi5GltTm0VU+1CRANSKB3/2HvtgQpNq7foeGzIbjGSIC8VGJQRnurS9BM2A/TXbOs8i8vIuPiOP6zdcXWWDmkn+YBbH1BsGS1r81Nyr0Ql+OL7mnrnCWJi/k+AOqA/Ou2eWjlg0E2bgU5kIhKIaAOEG4eoEyghvzqgEUrkZty4JJwxLGCWwB9BJ73JbNyPAYhpC7UzPUvn+1lvRNGQ3Sar1eVDSGzTEYy17X2nwK3yAXo5SQwK7ldANJ5Q3hm398L6D9EkhS59Ty6vPSKpBsjxs4/Z35Xz8KCcCjucGChoWaLXb6FzQGK8uqh0oNaQZ7r73lg3AJbbiUMVmuytTZxtaKzQzKy6tS8LIf+Pb7iqo7LuGS10+Nfk95TbQqJgPVPREEP80bXaTRs310wCfh1Vpez9ywMNspulbyeAKNXueWT36vDIj+JMZJytDALRQZ53o8nsWqoVyFYBKhEX51u9UTZcfkGBBFYDVXRM+U4r8+VdPCfEK6w0nryi4QSuU2BhAFtMSz9yXDGlWj4Zln+hnS6p23gVuRfGZW2ps58/UbtM+8MPSexvHR4BaAu6Z0tCQEs2Y/xRld0tlr3l6ZkIN+dKXHxnzW3F/Q44BFFjkyXvIi3SguJSNUcq2Xj699R/exS9Hea88amb4spEdqDUdLpENRHnv052kyE9F0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(396003)(376002)(136003)(6486002)(41300700001)(71200400001)(478600001)(2616005)(186003)(6512007)(53546011)(122000001)(26005)(82960400001)(6506007)(38100700002)(38070700005)(66946007)(66476007)(83380400001)(2906002)(8936002)(5660300002)(31686004)(66556008)(316002)(91956017)(36756003)(86362001)(6916009)(54906003)(76116006)(8676002)(4326008)(64756008)(66446008)(31696002)(4290200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q3BQaC9vVkE2M1NHSDFtUURpZ2lWSTd5TU5qZ3VVZzRhbEkyOE9WdzZTcDJR?=
 =?utf-8?B?bVk5d0lnNjJhSVhpOUUyanVObE0walZPNldpemsxc2tPS1YxNG9Fa3YwWVJN?=
 =?utf-8?B?ZzFMekZURnV4eGtndlN5QlFRZ1FWbHhacWp4V2RDOVpmd0V0Q1lqMDhXaFE2?=
 =?utf-8?B?Wk9IWlZ6Yk9Cak1aMUtLZEM4a1h4OCtkbHF5Qmx1dFJId1U4Z2dFVFYyU2tp?=
 =?utf-8?B?Y1BoNzkvVnlnMUVPTE1hTVlHdXd6Q1k3dXpSc2l2R2cyWjVEeGZjcWFBUk5P?=
 =?utf-8?B?eFdWbWR3SG5hM0lTS21zdU5CTzdKTmRFYlVaeVdxWjlzV3FoUDlMVUVCQlVm?=
 =?utf-8?B?MXBrRnl5RWlpZDQ5ak1LTFZRdzZaWDlOektMYnV3VnppZjdzdzNkNTNJdHdL?=
 =?utf-8?B?M0toQTNzUnYvVTJjcXBZN3JMT2l2MlM3Nnova2I4VElsZUdTL2hNaGVZM25F?=
 =?utf-8?B?azh2YnM3eHRJMmV5UWxlQzB5akNxZFFRYmpWTTFYTUpRZWYxdXNVQ2pSRlVL?=
 =?utf-8?B?MXZwNGUzaWxRbVZxOTAwbU8zc1QyNWZhcEJ3VFFJR0VLcXg4OFIvWXZ5MDJZ?=
 =?utf-8?B?djFCT05DbWFLZEFkMDN3WTVDa3VGaGF2cFpPYVdRbVpDc2s1b2tiSTRsVHpV?=
 =?utf-8?B?eUdZK2VaY3d0RzRiY2ZPSUxscVJTZTdSOElhQk1pcklxRUxPWHh1MGYvcmtm?=
 =?utf-8?B?SzJNYUxMM01XQnZ4dk9lUCtPMFh3U2d2dmN5dmp2M2h5TUhONUp1VVF2c2VI?=
 =?utf-8?B?TWtnT0E4NFpTN21DZUx5VzdKSnVNc24xUDJrZnJqalF1dVlmckF1a2t2TnB6?=
 =?utf-8?B?dWdDNzJMcW1iWTFlb0VEbUIzNDdQb2dnWGg0aGRIWDg1NEF4eXBBcHMwQTFT?=
 =?utf-8?B?QmZSd2dUbFJaWjNpU1NiWUtybS9UZ3JUMVMyTiswRCtqMnRVQkF3d1hHYmt2?=
 =?utf-8?B?Q1RIQW5ERnpxTXRucm90RXhMNmlGVXhzZC9VVi9RMlA1dzFoVEFBME1BOUNz?=
 =?utf-8?B?TGMyYVM2dFJZcWhQNU00MkpCRVpTU2VsWXpQdmV0ZUpDeVJET0lJUlZodFB0?=
 =?utf-8?B?WHEzaDlWUWZpbmpYd3lJUkVDNm5RYktMRWpRNVB1aVJZaXdMd1QxY2QwdEtL?=
 =?utf-8?B?VE1QbFFGN0NjbFR4S2gzVVo3K2FkYzhQZEdxMWRSMy9oUGMyYmlyalE2RHVu?=
 =?utf-8?B?dEhiUVRaeG5weHltbXNkS2MyYk1hQjFhRllMUWpkekRlTmVzQWdPaXFyU2dp?=
 =?utf-8?B?WllMcnRkcnRqUFlKZ05Wam5lTzVablk2WXNpb2VlRFk3clVQNGJOOFhMUDJF?=
 =?utf-8?B?V0dlVmY2N2x0bmVZRnljVFJMeEx6WVZrZHd1b3Nzem9KQjlZQmd4aHBpK1hF?=
 =?utf-8?B?QTZlTVQvZXVTQ3pONHBaaG5SQXpRRFYrVGcvNWkrVlorUUdpYk5IRkxISW13?=
 =?utf-8?B?QUNZNnRpWGlidWJNRGJWUXZNdEFNU3RXekFMYzZBQVp6NSs0SC81ZTg0Q0ha?=
 =?utf-8?B?Q2N6ZENrRkVlWVlSL2NCQlVjT2F1MFlkb203ZlAybWxLSldnRDFpODdxKzBv?=
 =?utf-8?B?T0xCWEdxbDJTVlVZa2pBcXpoRnQ5YXJ4SjRQZWF5a296RFBIdjZtOU1PbllK?=
 =?utf-8?B?WkRuREpNWTkrNDIyMzVSNlJjVVRCVFV0czFIc0VqRSsxd2RibFc5b2dTM1Bp?=
 =?utf-8?B?S1hNeURJTGtZY3BvWDNjcGNLak12UVN5aFN0OVFWZDYzTWFQYjl3R2xsQlhj?=
 =?utf-8?B?cnVpR2xPamt2UEJuaFlGWVB3WFJYLzdoUTQ0OG9MZXM2cUFvdHFPLzJEY0JG?=
 =?utf-8?B?OStDWlFtTFMrbnNKak5qT2F1MUUxV09ScHkwbEJncUZzRDhvNkdvY1BLR1Yy?=
 =?utf-8?B?NDl1aVlyUEZsRENLazIwRG95UnQ1dHhUUG9IS3Vsc0RCVURwclk3RVJab0sy?=
 =?utf-8?B?YjF3SkVPZlhIRk1kU3RIbW5MU1JkNjBZN2gydndtNEVlZGNWWVhwOUZxb1lX?=
 =?utf-8?B?L0cvTW82Nkxua0lSemdEeXgvMkQzMThGdUZJYWNySVpvbnBNT2VxY0NZQnl3?=
 =?utf-8?B?YU9hdW5IRjhYTmdESFVDYVBDZVJPckVKTTRHQ1dEMDFRYjdGODMybmJ6S3Fv?=
 =?utf-8?Q?nauJe9cfg/OFQAhA4XKqbFtmp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87C7BBC4FCA9C7478CDBAED0720FC05F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ce02fb-0d00-472a-5914-08da68b60f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 12:07:17.6662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPsuJw9eStosZRbfd0L/9d7tqsI+0V1onmXs2cFDKyEHIAo8p+a0aqw5lyBRgd2NCF9tipBfhEC1Uf7KbMAM/jwdz2T8sAPzrLnoeX7Yd2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5162

T24gMTgvMDcvMjAyMiAxMDo0OSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE4LjA3LjIwMjIg
MTE6MzEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBPbiAxOC8wNy8yMDIyIDEwOjExLCBKYW4g
QmV1bGljaCB3cm90ZToNCj4+PiBPbiAxNS4wNy4yMDIyIDE1OjI2LCBBbmRyZXcgQ29vcGVyIHdy
b3RlOg0KPj4+PiAtLS0gYS94ZW4vdG9vbHMvY2hlY2stZW5kYnIuc2gNCj4+Pj4gKysrIGIveGVu
L3Rvb2xzL2NoZWNrLWVuZGJyLnNoDQo+Pj4+IEBAIC02MSwxOSArNjEsMzYgQEAgJHtPQkpEVU1Q
fSAtaiAudGV4dCAkMSAtZCAtdyB8IGdyZXAgJwllbmRicjY0ICokJyB8IGN1dCAtZiAxIC1kICc6
JyA+ICRWQUxJRCAmDQo+Pj4+ICAjICAgIHRoZSBsb3dlciBiaXRzLCByb3VuZGluZyBpbnRlZ2Vy
cyB0byB0aGUgbmVhcmVzdCA0ay4NCj4+Pj4gICMNCj4+Pj4gICMgICAgSW5zdGVhZCwgdXNlIHRo
ZSBmYWN0IHRoYXQgWGVuJ3MgLnRleHQgaXMgd2l0aGluIGEgMUcgYWxpZ25lZCByZWdpb24sIGFu
ZA0KPj4+PiAtIyAgICBzcGxpdCB0aGUgVk1BIGluIGhhbGYgc28gQVdLJ3MgbnVtZXJpYyBhZGRp
dGlvbiBpcyBvbmx5IHdvcmtpbmcgb24gMzIgYml0DQo+Pj4+IC0jICAgIG51bWJlcnMsIHdoaWNo
IGRvbid0IGxvc2UgcHJlY2lzaW9uLg0KPj4+PiArIyAgICBzcGxpdCB0aGUgVk1BIHNvIEFXSydz
IG51bWVyaWMgYWRkaXRpb24gaXMgb25seSB3b3JraW5nIG9uIDwzMiBiaXQNCj4+Pj4gKyMgICAg
bnVtYmVycywgd2hpY2ggZG9uJ3QgbG9zZSBwcmVjaXNpb24uICAoU2VlIHBvaW50IDUpDQo+Pj4+
ICAjDQo+Pj4+ICAjIDQpIE1BV0sgZG9lc24ndCBzdXBwb3J0IHBsYWluIGhleCBjb25zdGFudHMg
KGFuIG9wdGlvbmFsIHBhcnQgb2YgdGhlIFBPU0lYDQo+Pj4+ICAjICAgIHNwZWMpLCBhbmQgR0FX
SyBhbmQgTUFXSyBjYW4ndCBhZ3JlZSBvbiBob3cgdG8gd29yayB3aXRoIGhleCBjb25zdGFudHMg
aW4NCj4+Pj4gICMgICAgYSBzdHJpbmcuICBVc2UgdGhlIHNoZWxsIHRvIGNvbnZlcnQgJHZtYV9s
byB0byBkZWNpbWFsIGJlZm9yZSBwYXNzaW5nIHRvDQo+Pj4+ICAjICAgIEFXSy4NCj4+Pj4gICMN
Cj4+Pj4gKyMgNSkgUG9pbnQgNCBpc24ndCBmdWxseSBwb3J0YWJsZS4gIFBPU0lYIG9ubHkgcmVx
dWlyZXMgdGhhdCAkKCgweE4pKSBiZQ0KPj4+PiArIyAgICBldmFsdWF0ZWQgYXMgbG9uZywgd2hp
Y2ggaW4gMzJiaXQgc2hlbGxzIHR1cm5zIG5lZ2F0aXZlIGlmIGJpdCAzMSBvZiB0aGUNCj4+Pj4g
KyMgICAgVk1BIGlzIHNldC4gIEFXSyB0aGVuIGludGVycHJldHMgdGhpcyBuZWdhdGl2ZSBudW1i
ZXIgYXMgYSBkb3VibGUgYmVmb3JlDQo+Pj4+ICsjICAgIGFkZGluZyB0aGUgb2Zmc2V0cyBmcm9t
IHRoZSBiaW5hcnkgZ3JlcC4NCj4+Pj4gKyMNCj4+Pj4gKyMgICAgSW5zdGVhZCBvZiBkb2luZyBh
biA4Lzggc3BsaXQgd2l0aCB2bWFfaGkvbG8sIGRvIGEgOS83IHNwbGl0Lg0KPj4+PiArIw0KPj4+
PiArIyAgICBUaGUgY29uc2VxdWVuY2Ugb2YgdGhpcyBpcyB0aGF0IGZvciBhbGwgb2Zmc2V0cywg
JHZtYV9sbyArIG9mZnNldCBuZWVkcw0KPj4+PiArIyAgICB0byBiZSBsZXNzIHRoYXQgMjU2TSAo
aS5lLiA3IG5pYmJsZXMpIHNvIGFzIHRvIGJlIHN1Y2Nlc3NmdWxseSByZWNvbWJpbmVkDQo+Pj4+
ICsjICAgIHdpdGggdGhlIDkgbmliYmxlcyBvZiAkdm1hX2hpLiAgVGhpcyBpcyBmaW5lOyAudGV4
dCBpcyBhdCB0aGUgc3RhcnQgb2YgYQ0KPj4+PiArIyAgICAxRyBhbGlnbmVkIHJlZ2lvbiwgYW5k
IFhlbiBpcyBmYXIgZmFyIHNtYWxsZXIgdGhhbiAyNTZNLCBidXQgbGVhdmUgc2FmZXR5DQo+Pj4+
ICsjICAgIGNoZWNrIG5ldmVydGhlbGVzcy4NCj4+Pj4gKyMNCj4+Pj4gIGV2YWwgJCgke09CSkRV
TVB9IC1qIC50ZXh0ICQxIC1oIHwNCj4+Pj4gLSAgICAkQVdLICckMiA9PSAiLnRleHQiIHtwcmlu
dGYgInZtYV9oaT0lc1xudm1hX2xvPSVzXG4iLCBzdWJzdHIoJDQsIDEsIDgpLCBzdWJzdHIoJDQs
IDksIDE2KX0nKQ0KPj4+PiArICAgICRBV0sgJyQyID09ICIudGV4dCIge3ByaW50ZiAidm1hX2hp
PSVzXG52bWFfbG89JXNcbiIsIHN1YnN0cigkNCwgMSwgOSksIHN1YnN0cigkNCwgMTAsIDE2KX0n
KQ0KPj4+PiAgDQo+Pj4+ICAke09CSkNPUFl9IC1qIC50ZXh0ICQxIC1PIGJpbmFyeSAkVEVYVF9C
SU4NCj4+Pj4gIA0KPj4+PiArYmluX3N6PSQoc3RhdCAtYyAnJXMnICRURVhUX0JJTikNCj4+Pj4g
K1sgIiRiaW5fc3oiIC1nZSAkKCgoMSA8PCAyOCkgLSAkdm1hX2xvKSkgXSAmJg0KPj4+PiArICAg
IHsgZWNobyAiJE1TR19QRlggRXJyb3I6IC50ZXh0IG9mZnNldHMgY2FuIGV4Y2VlZCAyNTZNIiA+
JjI7IGV4aXQgMTsgfQ0KPj4+IC4uLiBzL2Nhbi9jYW5ub3QvID8NCj4+IFdoeT/CoCAiQ2FuIiBp
cyBjb3JyZWN0IGhlcmUuwqAgSWYgdGhlIG9mZnNldHMgY2FuJ3QgZXhjZWVkIDI1Nk0sIHRoZW4N
Cj4+IGV2ZXJ5dGhpbmcgaXMgZ29vZC4NCj4gSG1tLCB0aGUgd29yZGluZyB0aGVuIGluZGVlZCBp
cyBhbWJpZ3VvdXMuDQoNCkkgc2VlIHlvdXIgcG9pbnQuwqAgSW4gdGhpcyBjYXNlIGl0J3MgbWVh
bnQgYXMgImFyZSBhYmxlIHRvIiwgYnV0IHRoaXMgaXMNCnN0aWxsIGNsZWFyZXIgdGhhbiB1c2lu
ZyAiY2FuJ3QiIGJlY2F1c2UgYXQgbGVhc3QgdGhlIHRleHQgbWF0Y2hlcyB0aGUNCmNoZWNrIHdo
aWNoIHRyaWdnZXJlZCBpdC4NCg0KPiAgSSByZWFkICJjYW4iIGFzICJhcmUgYWxsb3dlZA0KPiB0
byIsIHdoZW4gd2UgbWVhbiAiYXJlbid0IGFsbG93ZWQgdG8iLiBNYXliZSAiLnRleHQgaXMgMjU2
TSBvciBtb3JlIGluDQo+IHNpemUiPyBJZiB5b3UgbWVudGlvbiAib2Zmc2V0cyIsIHRoZW4gSSB0
aGluayB0aGUgY2hlY2sgc2hvdWxkIGJlIGJhc2VkDQo+IG9uIGFjdHVhbGx5IG9ic2VydmluZyBh
biBvZmZzZXQgd2hpY2ggaXMgdG9vIGxhcmdlICh3aGljaCAudGV4dCBzaXplDQo+IGFsb25lIGRv
ZXNuJ3QgZ3VhcmFudGVlIHdpbGwgaGFwcGVuKS4NCg0KSXQncyBub3QganVzdCAudGV4dCBvbiBp
dHMgb3duIGJlY2F1c2UgdGhlIFZNQSBvZiBvZmZzZXQgYnkgMk0sIGhlbmNlDQp0aGUgc3VidHJh
Y3Rpb24gb2YgJHZtYV9sbyBpbiB0aGUgbWFpbiBjYWxjdWxhdGlvbi4NCg0KVGhlcmUncyBubyBw
b2ludCBzZWFyY2hpbmcgZm9yIG9mZnNldHMuwqAgVGhlcmUgd2lsbCBiZSBvbmUgbmVhciB0aGUg
ZW5kLA0Kc28gYWxsIHNlYXJjaGluZyBmb3IgYW4gb2Zmc2V0IHdvdWxkIGRvIGlzIGNvbXBsaWNh
dGUgdGhlIGNyaXRpY2FsIGxvb3AuDQoNCkhvdyBhYm91dCAiLnRleHQgb2Zmc2V0cyBtdXN0IG5v
dCBleGNlZWQgMjU2TSIgPw0KDQpUaGF0IHNob3VsZCBiZSB1bmFtYmlndW91cy4NCg0KfkFuZHJl
dw0K

