Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1229CD54A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 03:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836890.1252796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBlsb-0001g0-9I; Fri, 15 Nov 2024 02:16:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836890.1252796; Fri, 15 Nov 2024 02:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBlsb-0001dL-6A; Fri, 15 Nov 2024 02:16:13 +0000
Received: by outflank-mailman (input) for mailman id 836890;
 Fri, 15 Nov 2024 02:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUJE=SK=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tBlsZ-0001dF-8T
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 02:16:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2413::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90791e45-a2f7-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 03:16:04 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 02:16:00 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 02:16:00 +0000
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
X-Inumbo-ID: 90791e45-a2f7-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjE4IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjkwNzkxZTQ1LWEyZjctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjM2OTY0Ljk0NDUyOCwic2VuZGVyIjoiamlxaWFuLmNoZW5AYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQoGIx8qh2o57l2aUmBe5x02F21HJbVB03N7XDKt7xFGZ1qJ5b1o1P7ClwunD3dd8XXgxYrJaPXJOxRy3URLZFh2FrL3rMZamybEyp3zBmcKm3XuGYK+RP438of3d0Hr9MDQqOY6G2t6O+o3a1DlNnAJEmlkTp6IEeze7I2lH9k7nkCW3uodQQiLsuRMWq/emHOSU/JHN93KNUi2h6rSGawtO4BW5CYIS62NROFXsm92GeUoKu+hY3/npkQzcsXsdxdPq5+uoVt5jv+MCt3gCPlouZUHBFzfkuKtb9IdgfH9i+xzAQxCLZ5mUEQ1FBCncpsjR+lrnFTlIOp+w1hykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hec8cxjuCYIQjwwNKno5leJENhkGReUupEaLrdHwbRY=;
 b=wucUVWxjW8vpvgLQiC538O8TRvt2/c0K88kKTlvRqrfCIBRYRkcRT8PMSaBabmjNpomjmWtbiseEHNKPyJecImJovVOZhCFWYY9Oaus5YkW8yKmekTJpBz7u0SrqZk4gAqlRtwad1uK8G9Sp84H6uYsMH9rlEnSzV8wLStOa7fT993fGOcCz0uk0SFLgTw++7VbqmhmXuRj0YmEAuH6R0d0/jg8DS8PyyYbeshqhzEnGSzGXN1W+tpTjtg0gNuWonBzsY8lwTXh50R4NgqDClsKNllJ7uSmOP8Y3hjD66DgKXhrp5sAnU0vOIyb3DYvzf0OPDDwJjrrZizu9oyy4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hec8cxjuCYIQjwwNKno5leJENhkGReUupEaLrdHwbRY=;
 b=CfUT941Bl/jlG2IQJtFCYcTe5SlhaQwhq5Jf8frUEge8mTUZtoq7QoZp8kaRlKNABsCxERXKA438BvX11Zj/PbyS8bK8j2VEuPSo2o+aJHvgR2DN5bZK0UFeurUIBKoxsUquNwfmDfxOknqf0dkWW5S4fCUVZdtiKF1uuDeofvs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index:
 AQHbNaIlMxf8mJcywkeNRFmHEai1qbK08gcAgACKfwD//4ZQAIABzRcAgAAfLACAATPmgA==
Date: Fri, 15 Nov 2024 02:16:00 +0000
Message-ID:
 <BL1PR12MB58492BC722EE4FA4E4A747B4E7242@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzRxqO3_GEgs7W1I@macbook>
 <BL1PR12MB5849AB0F258C07AD72EFDB29E75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzR_wlY0wXjqec8T@macbook>
 <BL1PR12MB5849F0606930076AC8CC66ADE75B2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZzYcskZ-GZ8HsXfU@macbook>
In-Reply-To: <ZzYcskZ-GZ8HsXfU@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8158.013)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9028:EE_
x-ms-office365-filtering-correlation-id: 00b71239-d612-4f59-26d7-08dd051b72b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTJ4bVVneTZvVGErWXE5SFg4N2NhdG5KbUExU2xuS0hxWXZNbXc0TFVaZ3hs?=
 =?utf-8?B?ajY3L2FlMUVGeW1MTHVuQVdDVnorRXhzSlZNZXBpaUtXRjhocGx1TTgyTFFh?=
 =?utf-8?B?d1RnTjVxcHNUbjkrbW9ZTUJ0K0JEZlRsSzBJbWs5d2hYa3FVVWV5UkNEcWRJ?=
 =?utf-8?B?QkFxZ1dYRDdsWjZ3NzAxS2tXQ25GenI0RXpXNmp1NHFlSzlSUXRkd3BTa2ZE?=
 =?utf-8?B?YXQ3YW5ISVF0TkxZenpsRjlJTFcyNlRHcW5rYVcwckEyZ3A5VkRSaVBSRlUr?=
 =?utf-8?B?QkhReVZqTUUvOG41MHI3c1BISDNqNzJZNUNqcVJBWkRZbFZTcnRKQlYzNkFH?=
 =?utf-8?B?VHI2VkJpV2VBc0xMd2lkYWlVbXZIZE1JanhHcHFOeXRBUWw0SnJSNzE3VVBp?=
 =?utf-8?B?amJZQW4raWVwM0x1VFFidnppdk5DTldtcWdOWnBPeVE0OHVuNWJzam9uNkRy?=
 =?utf-8?B?YWZkNmVNazI4UCtpdGozWHlzYXFBOHBBOGJpM2ZFZUVuRTl1OVNZbUJTRlB1?=
 =?utf-8?B?S3VXN2pYazJBQkFDcnJXc0k0Tkp4MjVPUEtGWGVCTmwwZHA4WVlZRjFjNXEz?=
 =?utf-8?B?TGl1M3lRYU1xajJmRjk5bWc5cDViY1hrVUNlNUU3Nm9HN1dFNy8vYTNoZ2ls?=
 =?utf-8?B?YmpUVmFDb1c4TGxDcjVEdjQ5akEvamErRzVYM2dWNXo3Y2J5RDBYUDVDY2JL?=
 =?utf-8?B?dnZSaDdrOUdIa0l4UFpLL1huRVUrSjkrTCtRV3Q3YVN6QWl4VHFLZWVNaXdG?=
 =?utf-8?B?dU12M2J3UnlLSEdYNUtFSEdyOTgwWnhUdDdoRnlEcnovSDhjNmNWSnR3OFow?=
 =?utf-8?B?SG9JR0pxTGlCZnczMkxHbHM4WFN2Tk5oVWVpMFZnUkdKSkhJR1Y2ejdhMGZJ?=
 =?utf-8?B?V0ZGL0hYYmVXYkpYZ1hPQWlycnJiVWZoblNrNG8ydmFMR3ZRM0F4QmgrU3Bs?=
 =?utf-8?B?Y1pDMzBjWlpYbkJRM21jUEpXeksxMHh5MDRKZkk5R1JjQXU5QnQ1U0pIczRv?=
 =?utf-8?B?dEM2ZnNUZXBuK3d2blc1WnVud3EvQUd1bGx1WEFjVUNITVV6bmYzTlNQcTRQ?=
 =?utf-8?B?TjBvNlViR01DT1QvYk50c0FTTHl6WFpoTjBIK0lhV2dkWDlnZ3FWZXFNWFJh?=
 =?utf-8?B?ckVNUUhpVWFKc0kwMlhSSDZhWTg3enNoN3VldHZSZ2Qzc0t6UUZsb1VHbGVH?=
 =?utf-8?B?SGxFOHZFa0NqQms0djFwbElQK0lCNGlGa2hwaVZocjJaYlE0bTY0Q0t5V2Rp?=
 =?utf-8?B?M3ZPMFJDRGpKbXV1RjM2eHR3SGhQdFF3Y2NGOHBVMWlUMjZ2WVJSKzd0Q1N5?=
 =?utf-8?B?N3V5WXBoeGxudmp0QlN5YVV2R2FnMjdOcGZOcHBqZ0pFY3ZhOXc4U0RjVnBq?=
 =?utf-8?B?QU12aUxEVmVxUlZwQ2U3cmpUNXRRQjZMSnk0d1IwaXRqY2RkS3FGVU4xL0dE?=
 =?utf-8?B?UWp0ZUpVeGpFeVFETVZqTmMwK09VVzdjUndzd2lPQkhnMW1VRmFOOVdydXp6?=
 =?utf-8?B?QjY5dXN6TmpxTHkyREIxK0JFN1YyaTVBQXFaZ1JuNTEyNHpKTld6MDNnV3Np?=
 =?utf-8?B?d3hReVNNWUtmK1cyYUExM3JFbmM1V29Rc2MxRXZCaW4rTkswdGEzRVV4eHpD?=
 =?utf-8?B?czZOWm1TQUF6RUhaYnlYazI0OHJnQnhFMFdPQ2VsTVAvV2g2aVNWRzBLaXk2?=
 =?utf-8?B?Qk9sRDNrMlpWYnV3OTgvUGZNYVBKYlBVQTN3TWY0R0tDY2dHTXpEN1orR1JE?=
 =?utf-8?B?djF2MkZvaGZQZkJMTEdGQzU4RkF3TXEraWh4REhueWxXdnE4ejVqM0dVVFUz?=
 =?utf-8?Q?y+US7bRcWogtqEtFIz+tzlBfejDjtp6E4AUTA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZWtFcm4zQ2pnL1lCTlBIOGNqQ3NQK1U0b0FBTXNlVHNkYTM2UXFad2VNNmw2?=
 =?utf-8?B?d05hQUh4cHdERmV1NUVpZkZaM2d2L0VoMzE0Z0ZvNzJkMk9YQXR1azg0aFJk?=
 =?utf-8?B?Ymg5YWxPbXA0QnRuVmliN2luejloRzFhdWZNaGlUVEdRVEZWeURtbjNxdnRO?=
 =?utf-8?B?TVczaWZzVDdQV3BJRFNrNjg0UlhmT3BtNndXaHdGMnp6SndvRmZHaER1MGow?=
 =?utf-8?B?VFA2VTdtbWU5TjBYcGhVSmhCSHpPTjdkTkdHeUV0ZWJjcGYvMTdHTTltMVpF?=
 =?utf-8?B?WHV5WkVWWUhucGlxMVIvNFFmRzBuaXNmSDlPTm1ldmFQQlJucFprblFDZDBZ?=
 =?utf-8?B?NHZZcS9xcmRGei85Mld4Y0kzRHlJaThTQ1pQOFBZQTBRWDl0QmU1WFlBOU9h?=
 =?utf-8?B?NVRWMFkvTkM4MHNaZVZXQit3VXpQVlIxS0E5d1k2MS9mSVllTm95NGQ0ZWRs?=
 =?utf-8?B?K1ZieXVxbXhCMWtIMFFVL2Z1QTJvekxnc0ZwYjlGcGdFdjFSaEJhWlhvcEp6?=
 =?utf-8?B?ajhQRTA2ZG1oNzFJaC9rRE5ta3VKTUZiQmtIMmtMd05RclU0TzFXNjlFWDJp?=
 =?utf-8?B?cFVSVFBUMkNYN21SOFptS3Zua2s0ZS9UOWpVeFF6aVlRS3ZhZkFoY0o4d0xl?=
 =?utf-8?B?M3MwOXJsZDRpZjUzKzY2ek9JVS82QXdIZUdLcE9DYjFPWW15L3hONjNzVXYx?=
 =?utf-8?B?YUVJMEQrTXlKZzRrS3YySGVSbGV6V2w1VmJmelBLcEpoMlFyejVFeXRIMEhU?=
 =?utf-8?B?eVkxWm1uVm1YWnZHaDcrbEZPQy95MEJYUmY3bFBiYzVOc0FEblZoRGlkUEZT?=
 =?utf-8?B?U0laSnYyZWVoZUwzV0hqcm42Z3BGUmJWNkx6V1RoTnRqMlBsZEY1aklva0xN?=
 =?utf-8?B?eXhnZkNoY0VRZmd0RlRYNElrSVRodDBQOElDSklvOGRRZjc4cnpZSSswdXY4?=
 =?utf-8?B?T0N0SURpVEVIQWwvWGxTU09NMGhZb3VkZm9BOXhMeEQwZE9WRlg1TzBvRHVt?=
 =?utf-8?B?dFpuNGVFSmQwSGEvZzlYbUVKTjNXeGYwMkVubS9JQ2gvOExrclNFbE9qUXJT?=
 =?utf-8?B?Z0ZxaFdFS2N3am9QeWhRc3E0L1VaRDh0eTBYZXBqVlBYTXRhK0F5S2hlaURF?=
 =?utf-8?B?anZPRmU4V1NtN0pGS0k4MUQyQlZvTEtIc3NhazIvaFVvZS9UdUlTSGVud0l6?=
 =?utf-8?B?YWU4UGI5c213aG9OcGdhWFl6Tm9tRzdoUHhEZzIxZ3NTV1VzRnZlTEtFVDU4?=
 =?utf-8?B?U3ZXdkRUQ2pEbEQ3R1RORHBQTWx5WEx3TG1odnZFVE5XVUtOa2Jjbk9TQXhX?=
 =?utf-8?B?dnJ1Qll1TVRtM01hTmwrWUtqMkZDSStxZ3crUHJKNm45NkxRc29UekdJdTFH?=
 =?utf-8?B?MU9IaThmekt0djk4U2JkTmR5Zlp0RS9aaHdrUVlIWVRPcUtQYjRGVytvRkZ6?=
 =?utf-8?B?VlRyVGI1UlJwTVpFKzhPeEw0NXVvaDBrMUgwZC9Ma3cyVGY2R3pBUjJqeXox?=
 =?utf-8?B?THVZZmZkVmpLalJKRlZsU2NjaE41UVYxY2wzYndCZW5salB3SituNmoyN1Bh?=
 =?utf-8?B?blpNVEJ3dm85YkpBTTRraGt1Y1A5eU9BQ1piMUk2eEVpS2w5VTYwclVhRnRy?=
 =?utf-8?B?dUF2WDIzekVaaG5MeXFzOVF0K256SHFBbVVYL2ZYR1lRNmxCUXhSWjZCWjYv?=
 =?utf-8?B?QWI2Z3RLUXI2aDhiMHJCSEk3bkErTm00ZzQ0NERPbkhPSTN3MW5EMEd3dnpV?=
 =?utf-8?B?M3BvVkVaM1U5T0FWbTdCczVwVDRMS0VrNUxRUVVNMCt1Um9qZDl5WERwRUtC?=
 =?utf-8?B?K1Q0TE80VlU4L2hxdDd3dm5nQmxOS0JZQXRkTDlSY1E0dk81MzE4em01NnY5?=
 =?utf-8?B?NzQ0UEdZbHpOc3V3dFhRMkNpSEZsd0tyZ1hSMzRVdW1LRk1qMUlxaUFMakUx?=
 =?utf-8?B?Y0tBN1pLY3NPdkM5bHVpNVdod1ZpSlA1VGl1RnVNQS9DZVl6Mm9TM05nYWR1?=
 =?utf-8?B?MnR3cVlrRXVpLzJ6S2svYTAvaWZjaWM4cXJwaWovYWI0blVRY2NlWkdwdEpJ?=
 =?utf-8?B?SHp4djNkK1RDTnhzOE9FV2JKUlZpTXZySlcxWURqRnlUV0VISnE3OUFRV0pu?=
 =?utf-8?Q?Yg/s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D3239AD321F6A4381DB55735C97E8AD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b71239-d612-4f59-26d7-08dd051b72b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 02:16:00.3250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZLJ6q0R5J1ZgIDgXtI8sbTDqVw2Pz2wuNQfZnO0t8LTNMIKq7I/vyJoVjxBf28gN63Z6DPn4jWCPJxXDE0dzKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028

T24gMjAyNC8xMS8xNCAyMzo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gVGh1LCBO
b3YgMTQsIDIwMjQgYXQgMDY6MTE6NDZBTSArMDAwMCwgQ2hlbiwgSmlxaWFuIHdyb3RlOg0KPj4g
T24gMjAyNC8xMS8xMyAxODozMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBXZWQs
IE5vdiAxMywgMjAyNCBhdCAxMDowMDozM0FNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+
Pj4+IE9uIDIwMjQvMTEvMTMgMTc6MzAsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+PiBP
biBXZWQsIE5vdiAxMywgMjAyNCBhdCAwNDowMDoyN1BNICswODAwLCBKaXFpYW4gQ2hlbiB3cm90
ZToNCj4+Pj4+PiBTb21lIGRldmljZXMsIGxpa2UgZGlzY3JldGUgR1BVIG9mIGFtZCwgc3VwcG9y
dCByZXNpemFibGUgYmFyIGNhcGFiaWxpdHksDQo+Pj4+Pj4gYnV0IHZwY2kgb2YgWGVuIGRvZXNu
J3Qgc3VwcG9ydCB0aGlzIGZlYXR1cmUsIHNvIHRoZXkgZmFpbCB0byByZXNpemUgYmFycw0KPj4+
Pj4+IGFuZCB0aGVuIGNhdXNlIHByb2JpbmcgZmFpbHVyZS4NCj4+Pj4+Pg0KPj4+Pj4+IEFjY29y
ZGluZyB0byBQQ0llIHNwZWMsIGVhY2ggYmFyIHRoYXQgc3VwcG9ydCByZXNpemluZyBoYXMgdHdv
IHJlZ2lzdGVycywNCj4+Pj4+PiBQQ0lfUkVCQVJfQ0FQIGFuZCBQQ0lfUkVCQVJfQ1RSTCwgc28g
YWRkIHRoZXNlIHR3byByZWdpc3RlcnMgYW5kIHRoZWlyDQo+Pj4+Pj4gY29ycmVzcG9uZGluZyBo
YW5kbGVyIGludG8gdnBjaS4NCj4+Pj4+Pg0KPj4+Pj4+IFBDSV9SRUJBUl9DQVAgaXMgUk8sIG9u
bHkgcHJvdmlkZSByZWFkaW5nLg0KPj4+Pj4+DQo+Pj4+Pj4gUENJX1JFQkFSX0NUUkwgb25seSBo
YXMgYmFyIHNpemUgaXMgUlcsIHNvIGFkZCB3cml0ZSBmdW5jdGlvbiB0byBzdXBwb3J0DQo+Pj4+
Pj4gc2V0dGluZyB0aGUgbmV3IHNpemUuDQo+Pj4+Pg0KPj4+Pj4gSSB0aGluayB0aGUgbG9naWMg
dG8gaGFuZGxlIHJlc2l6YWJsZSBCQVIgY291bGQgYmUgbXVjaCBzaW1wbGVyLiAgU29tZQ0KPj4+
Pj4gdGltZSBhZ28gSSd2ZSBtYWRlIGEgcGF0Y2ggdG8gYWRkIHN1cHBvcnQgZm9yIGl0LCBidXQg
ZHVlIHRvIGxhY2sgb2YNCj4+Pj4+IGhhcmR3YXJlIG9uIG15IHNpZGUgdG8gdGVzdCBpdCBJJ3Zl
IG5ldmVyIHN1Ym1pdHRlZCBpdC4NCj4+Pj4+DQo+Pj4+PiBNeSBhcHByb2FjaCB3b3VsZCBiZSB0
byBkZXRlY3QgdGhlIHByZXNlbmNlIG9mIHRoZQ0KPj4+Pj4gUENJX0VYVF9DQVBfSURfUkVCQVIg
Y2FwYWJpbGl0eSBpbiBpbml0X2hlYWRlcigpLCBhbmQgaWYgdGhlDQo+Pj4+PiBjYXBhYmlsaXR5
IGlzIHByZXNlbnQgZm9yY2UgdGhlIHNpemluZyBvZiBCQVJzIGVhY2ggdGltZSB0aGV5IGFyZQ0K
Pj4+Pj4gbWFwcGVkIGluIG1vZGlmeV9iYXJzKCkuICBJIGRvbid0IHRoaW5rIHdlIG5lZWQgdG8g
dHJhcCBhY2Nlc3NlcyB0bw0KPj4+Pj4gdGhlIGNhcGFiaWxpdHkgaXRzZWxmLCBhcyByZXNpemlu
ZyBjYW4gb25seSBoYXBwZW4gd2hlbiBtZW1vcnkNCj4+Pj4+IGRlY29kaW5nIGlzIG5vdCBlbmFi
bGVkIGZvciB0aGUgZGV2aWNlLiAgSXQncyBlbm91Z2ggdG8gZmV0Y2ggdGhlIHNpemUNCj4+Pj4+
IG9mIHRoZSBCQVJzIGFoZWFkIG9mIGVhY2ggZW5hYmxpbmcgb2YgbWVtb3J5IGRlY29kaW5nLg0K
Pj4+Pj4NCj4+Pj4+IE5vdGUgdGhhdCBtZW1vcnkgZGVjb2RpbmcgaW1wbGllcyBtYXBwaW5nIHRo
ZSBCQVJzIGludG8gdGhlIHAybSwgd2hpY2gNCj4+Pj4+IGlzIGFscmVhZHkgYW4gZXhwZW5zaXZl
IG9wZXJhdGlvbiwgdGhlIGV4dHJhIHNpemluZyBpcyB1bmxpa2VseSB0bw0KPj4+Pj4gbWFrZSBt
dWNoIG9mIGEgZGlmZmVyZW5jZSBwZXJmb3JtYW5jZSB3aXNlLg0KPj4+Pj4NCj4+Pj4+IEkndmUg
Zm91bmQgdGhlIGZvbGxvd2luZyBvbiBteSBnaXQgdHJlZSBhbmQgcmViYXNlZCBvbiB0b3Agb2Yg
c3RhZ2luZzoNCj4+Pj4gT0suDQo+Pj4+IERvIHlvdSBuZWVkIG1lIHRvIHZhbGlkYXRlIHlvdXIg
cGF0Y2ggaW4gbXkgZW52aXJvbm1lbnQ/DQo+Pj4NCj4+PiBZZXMgcGxlYXNlLCBJIGhhdmUgbm8g
d2F5IHRvIHRlc3QgaXQuICBMZXQncyBzZWUgd2hhdCBvdGhlcnMgdGhpbmsNCj4+PiBhYm91dCB0
aGUgZGlmZmVyZW50IGFwcHJvYWNoZXMuDQo+PiBUaGVyZSBhcmUgc29tZSBlcnJvcnMgd2l0aCB5
b3VyIG1ldGhvZC4NCj4+IEkgYXR0YWNoZWQgdGhlIGRtZXNnIGFuZCB4bCBkbWVzZyBsb2dzLg0K
Pj4gRnJvbSB0aGUgZG1lc2cgbG9ncywgaXQgc2VlbXMgdGhhdCAwMDAwOjAzOjAwLjAgaGFzIGFk
ZHJlc3NlIG92ZXJsYXAgd2l0aCAwMDAwOjAzOjAwLjENCj4gDQo+IERvIHlvdSBoYXZlIHRoZSBv
dXRwdXQgb2YgbHNwY2kgd2l0aCB0aGUgQkFSIHNpemVzL3Bvc2l0aW9ucyBiZWZvcmUNCj4gYW5k
IGFmdGVyIHRoZSByZXNpemluZz8NCkkgd2lsbCB1c2UgeW91ciBuZXcgcGF0Y2ggdG8gZ2V0IHRo
ZXNlIGluZm9ybWF0aW9uLg0KDQo+IA0KPj4NCj4+IEkgdGhpbmsgdGhlcmUgaXMgYSBwbGFjZSB0
aGF0IG5lZWRzIHRvIGJlIG1vZGlmaWVkIHJlZ2FyZGluZyB5b3VyIG1ldGhvZCwNCj4+IGFsdGhv
dWdoIHRoaXMgbW9kaWZpY2F0aW9uIGRvZXMgbm90IGhlbHAgd2l0aCB0aGUgYWJvdmUtbWVudGlv
bmVkIGVycm9ycywNCj4+IGl0IGlzIHRoYXQgd2hldGhlciB0byBzdXBwb3J0IHJlc2l6aW5nIGlz
IHNwZWNpZmljIHRvIHdoaWNoIGJhciwgcmF0aGVyIHRoYW4ganVzdCBkZXRlcm1pbmluZyB3aGV0
aGVyIHRoZXJlIGlzIGEgUmViYXIgY2FwYWJpbGl0eS4NCj4gDQo+IERvIHdlIHJlYWxseSBuZWVk
IHN1Y2ggZmluZS1ncmFpbmVkIGluZm9ybWF0aW9uPyAgSXQgc2hvdWxkIGJlDQo+IGhhcm1sZXNz
IChldmVuIGlmIG5vdCBzdHJpY3RseSBuZWNlc3NhcnkpIHRvIHNpemUgYWxsIEJBUnMgb24gdGhl
DQo+IGRldmljZSBiZWZvcmUgZW5hYmxpbmcgbWVtb3J5IGRlY29kaW5nLCBldmVuIGlmIHNvbWUg
b2YgdGhlbSBkbyBub3QNCj4gc3VwcG9ydCByZXNpemluZy4NCk9LLCBJIGp1c3QgdGhpbmsgaXQg
Y2FuIGhlbHAgdG8gcmVkdWNlIHNvbWUgdW5uZWNlc3NhcnkgY2FsbHMoYWN0aW9ucykuDQoNCj4g
DQo+IEkgbWlnaHQgaGF2ZSB0byBwcm92aWRlIGEgcGF0Y2ggd2l0aCBhZGRpdGlvbmFsIG1lc3Nh
Z2VzIHRvIHNlZSB3aGF0J3MNCj4gZ29pbmcgb24uDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

