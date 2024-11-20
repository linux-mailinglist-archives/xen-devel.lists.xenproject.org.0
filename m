Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458719D3228
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 03:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840896.1256428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDaQU-0003fl-Lk; Wed, 20 Nov 2024 02:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840896.1256428; Wed, 20 Nov 2024 02:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDaQU-0003du-Im; Wed, 20 Nov 2024 02:26:42 +0000
Received: by outflank-mailman (input) for mailman id 840896;
 Wed, 20 Nov 2024 02:26:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jnlo=SP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1tDaQS-0003di-7v
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 02:26:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2412::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd460775-a6e6-11ef-a0ca-8be0dac302b0;
 Wed, 20 Nov 2024 03:26:35 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 02:26:31 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 02:26:31 +0000
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
X-Inumbo-ID: dd460775-a6e6-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjFiIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRkNDYwNzc1LWE2ZTYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDY5NTk1Ljk0MjksInNlbmRlciI6ImppcWlhbi5jaGVuQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytpnHX0A3Y7ZaRY0Bq+c50kQ+njQ8Ix8hWgHRMsM1zPzL8aecKYJoHBD+xdL6kPLr4r+Fn5bRqBg4k2Xc2i/JTmU5JZh+jKIHUHsy405CnhcevAbeRUAaNZYqeH49q5AkzVY2OjbfQpvcFtBQQykZJ4J+9moCBogjVS9zd5vrQD+dFqv6mJTtQI+4spv0CbPyDCdvM4sfr1mkvjdrPuSJRY/wJvp7BVbSxd1RxeytMux7xIiSPjfSYSg0jqq6+5wVtcF9dD5h8I6TBANPEvyRiDEfFURXWVOA/3TchWeXGgUimz2e8jXQ3bVJE5YoyBsFUTmgDRDc52yEE0j6V5/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MSe6sa1RvT6UfK+OdO7ZXPRNAP9Igyyd6U3Ooo+X2Q=;
 b=tnk9nIHypUpRqT6uFVEoETMHZU9Bk4RzE6zd4JVRwpGeM9TAptE9lEc2kXjeww82U0q+02LzmUwIh7CwYOaPJiU85VBe8LKCwET5zqESevgBow5VldEVY08itZdUEK/zEoix8j8Q8zLlN1SXi3JM92YVnN+j4JMfTaBoe+f8ntwc3ftssvJK8QiD3DvAiVMN8IwY2HVLLSRjzxTWBNT6KIjFx7yr6GlUka6XfBO21AoQGAejhoUsMnHG3qkG/YoEsgLO8NvXqfinAqZVj2oZRJn5fus+rpolydkC8/v3xcTmNRUfqT6C8aewjz9fTYKi9Gx0ueHwig5Wb9SzrFYr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MSe6sa1RvT6UfK+OdO7ZXPRNAP9Igyyd6U3Ooo+X2Q=;
 b=PMlzEcNVHkTTtsp2WSfNcdTmWF6QbrU3W7OWwnmYJKsskd4Oj2zVLuXlglSAko6oy4qdT1bk/gZE6ksgDP8766jrhhSDWGGPkrSsj3E7yeDG7azfWPOyrEm4GKDLPYg19yBky4v+IsINNDTYzhC97wsP1hWOSZ9eVggnJ+AtMQI=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [PATCH] vpci: Add resizable bar support
Thread-Topic: [PATCH] vpci: Add resizable bar support
Thread-Index: AQHbNaIlMxf8mJcywkeNRFmHEai1qbK82tSAgAHkIwD//4OCAIABvicA
Date: Wed, 20 Nov 2024 02:26:31 +0000
Message-ID:
 <BL1PR12MB5849199069AA4C9F3837031CE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzsUL3dnjl5x0-si@macbook>
 <BL1PR12MB5849F6F7A4E86E0209AB152AE7202@BL1PR12MB5849.namprd12.prod.outlook.com>
 <5262adaf-2ff7-47ea-8c13-c544b31e4115@suse.com>
In-Reply-To: <5262adaf-2ff7-47ea-8c13-c544b31e4115@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8158.023)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CYXPR12MB9337:EE_
x-ms-office365-filtering-correlation-id: c2cf2f32-a774-472f-ef22-08dd090abed7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDBLSHRNL3drT0NmdDlyd2ltM3lVUmFWU0s4ZFIyNmp1UGNmMUZSZHd4R1Nt?=
 =?utf-8?B?Y2NRcW0wbmx1cEkxTXhTUlJGRGtuSmpZNGF6aTVyZHUzVHR2bFY5UzBScEZa?=
 =?utf-8?B?UVZ5T3B3ZGNibG5ZNjNDM3BOWlBaeWsyM3l3MXd4S2RTWlVLTlhWQW5TTEgv?=
 =?utf-8?B?YWhiMHp3bWZIUnd4Qnp6S1FoaE5PemVSck4xQXpmMGdBRzlyVXBONCt1dkds?=
 =?utf-8?B?SHQrRStCaVJsNDNlR05BYnU4ZkxkaThXdzFWMGYyWnk0S1N1aW85TXZvOVVS?=
 =?utf-8?B?bjZhUzJGWmZBcC9wcE5vN3BZUE10cTNxeEdYSXBzR2V5NDF4VzVwVUJqQ3hs?=
 =?utf-8?B?Nm9oWDFkdDd2N1ZKdXFReEVFcHRSL0FtR3daUW5qNmtIMGxZa0wvWDk2ZjNq?=
 =?utf-8?B?UnNlZjlZeDVwQzZwZHAyZU1iUURObWxnUURoQmFrcW9VbGw3Q3E3ZXVieXhz?=
 =?utf-8?B?dk9KQW5jSW1TNVdvZklBRGN2bytsdXJtTllTNTZpd1dlZ0dOVU95Z0VtWXc3?=
 =?utf-8?B?OEI4Ky9ub1ovTkhqQmEyZkpNeFMrakVLb2c1ODNwbVZRUEJSQzB5RnpaSlp6?=
 =?utf-8?B?L3llSUQwUk96c1hndVk4azBNV0pEWFRYdXMwTm96T3ZFbisvYndDQnkzZHFi?=
 =?utf-8?B?UEh4Mk5nOWgvTXhtZGZ1V0J2RjhsWk5sY29sbkpoVnBKa2IxZUwrMXJJY0ND?=
 =?utf-8?B?cjlwS0dwN0RYTXdLVmlBRmUzekplRElNczdoRS85SWNpUmdnQndOZGxFV2w5?=
 =?utf-8?B?NWRxQWM5TVdGL251NitxbloyaUJiQmx3L1FVTEhrM2lLRTVtbFhwTWV0VTVS?=
 =?utf-8?B?ZS9jall6MmtuZTBLODd0MUF4c1A4RnBUK1RsUFVDNGIzajlFWmlTTWxzenBD?=
 =?utf-8?B?M0dubi9vZzIzeExNZkdReEtINDRmWmVpdCtIZ2hORVdpSEsxNE8xWnA0T2x3?=
 =?utf-8?B?R1BZbDVHTGg5alZiRjY2WUN0QVNVS1RYekE5WEhFOFBnL1Q4dDFJYkVGaktI?=
 =?utf-8?B?UGxXOXVVaE5WSFZyVFgvek9LZG1XZU5RYmt5RWFDM2ZYUjVVSGNHeVNMaGZt?=
 =?utf-8?B?anVGZ2trdUpCeERTWG9XMnVPVzNJdFhMLzBMYmkzRnlpWjJ5KzFmRWJMZ3Qw?=
 =?utf-8?B?eHAwcy9SUndsVXJoTGFzYnBOSENpZ0U2d2I4Umw3aVlyS1F1V2U3TElEdkNB?=
 =?utf-8?B?YzJYU21zT0NBdUR5RXJHOVJXeXhJaFVSTmRsMk5uT0RpVW9ZbFMxSkhjbGlN?=
 =?utf-8?B?ZGFybUxCL1U2c2dPWmlQdkoyRkx4NTN2L2ZJaWZ5V2VLNkR2QW1rUitXN2dn?=
 =?utf-8?B?enJ6UXFSSndrczNBTVYzaWZJRG1MakNlT1MrODRmNkVyUWNGM3JoUkxrQ3VU?=
 =?utf-8?B?QXZZYS8wUlhHak5XM2REVHM3SnNjdEE1cjZWejByUTJWOHJMU2xlTFBKcUt0?=
 =?utf-8?B?UVI2djhoNVFEZ003RzlKZWtIUllVVEpGU0tGaHNYNjRiSXBsOGU3elE0b1BE?=
 =?utf-8?B?MlZrK2l5aHJqUE9jdHU3L2tFYlZDeDhLOHJ5TlIybDluSVVTVTlUbHFxTW1J?=
 =?utf-8?B?STNpNkwvdnBzMUl2ZlFJQTIxN0dXUGg3RzMzUTBOYU1McEFUZHY0Q1IrdFhh?=
 =?utf-8?B?amRVekd5REhaWjRwd1hqU283QWUrQzArWXc0YlFvOTRCV3ZWZktzUVgvWTZw?=
 =?utf-8?B?MXpPVW16bjYvQjc2RlVwTFFqZkU4UXcvYVRnL1lHS3BnV0FYSFdJdHVZc01t?=
 =?utf-8?B?SFp1VnhJMmFhNHdHNCt2VFBmbzFIMVFKQ2QvZ0oxRGkxVHBtVHRkYkdONFBJ?=
 =?utf-8?Q?Bjg++cnV/u8nKqOJ+jDYU9FcFVxv0PlEqrBFE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?djIybXgzTmJ1RHdFYnVEbmtQUVVDbHNaN3hKZ2wzMjBrRXEyVTM5eDRuUUpn?=
 =?utf-8?B?b2l2L1c0RVBtY2hEeEdWWUVPY0tZRTdPenBNWUozY0dWU05lRFRUaVNvRWRs?=
 =?utf-8?B?eUl6TTJRZUxUdVFocUFrQUY1d1BFeFNiWkdDMGFQY1BONzhsUUY0eFpWb1lv?=
 =?utf-8?B?OHNXRnBXdlhORmR1T1Zua21NZ2ZCdURHWFFsM3NodDl0QWM2TWd1MTlmd29x?=
 =?utf-8?B?TEUzYlhWZTFHR2FZZE9FWk80NDFmaDB1QWIzanZ0Ti9UbndPazdleDZGck1S?=
 =?utf-8?B?YUYwdU1jMW0wRGdXa2x6TE4yNXhMeXArVWZ5SDBXNDFuaUExMWY5OUh2ZE5T?=
 =?utf-8?B?eUsxNkI2L0NReFg0SVVqU29NQlovMFdlWXhyOXE0cmRkQWhPYjNxeGNJZmxN?=
 =?utf-8?B?M2Znd1pxTjQwaEV3dXg1cGxXNm1vbXNHZTQxLzNRM05rY0FyMm1lYVFPY0J2?=
 =?utf-8?B?Mmx4VkVTYllRamVVd2xjZVZiTGgxRld3SHpvMEN1cVBRdjBmSDJIT1FwdVA1?=
 =?utf-8?B?bUl3VnB2cWlvSElUMW1zclhhUzdpQWh6ZWFOSjZUZldMMHJ4WC8wZnRqWDBK?=
 =?utf-8?B?UFFwQzVxU2JTSFpVcmM2SHgxU1cyckFhSC9DTEFmRTArTkl0QkVCVm5ETllT?=
 =?utf-8?B?Y2lSZnoxWnB4ajl6dkhObFRqSjVHUjhtTkZzRkd3UkJCSy9PczBsc056Z3Qr?=
 =?utf-8?B?SEd3OHgzdk5CWVVoM1lkUXFtWkVZY1RsekkvczJxWW41WEpRWWZHZFg5ZVVJ?=
 =?utf-8?B?QmhXcGhLQkNYUjViM2RVNG81elZzeFFtNC94Ti9tSjBXcVVrUDhrUVBqVWZx?=
 =?utf-8?B?clNmeFNrakpOQ0pTUDdhNmx6amg4VmFJMWRvUGpwUVB3S3JUU1h3WlFCem1n?=
 =?utf-8?B?V3NBYmtzWk5ZWlIyUVZ1dWVQOENUdFg2ZXBYSnpwU2tGaEhqZkMva0hYZExW?=
 =?utf-8?B?c1ZlQ2dYSDFUVG96MkxlSGhQUGJFMlZwYzZLSHpmSjg5UXhFcWV6MUtLZHJn?=
 =?utf-8?B?dHMxNmxOdmFIVFQ2MHZMRnJKbyttcVRxaTdhOGJkazMvL0d3S2dGSGZOaldz?=
 =?utf-8?B?ZGRZYWdaMDNXcUNhMkNiR3FvM3ZGVEVjNDZKQ21kbHlZZnpLUVF3ZGRzRnZP?=
 =?utf-8?B?SzB2cFp0UXk2L05tWkZMOW9jcEFZQUt6bmt5UEpFeWZZL1VLMlZrc1gyN2JO?=
 =?utf-8?B?SW5aTmJ3eWFGR3VuVk42YmFmWnlOcGRWNktFMjB4d1BMdnBIQjYvdHhiTklH?=
 =?utf-8?B?aUc5NzBVb1I2QWgvRjR4NHVQWWtlYUZodzNWZXlZdFNYWUVPMjZ5R0l5eXdT?=
 =?utf-8?B?cTVSaWpLY1hxWWZWbW13MFJLYUNkWndVQmw3UWZUdUcxdGRXTHF1ZUROeDVY?=
 =?utf-8?B?UW9MUDY0aG0xd25lcDEydW5OekN0NUkya2dlM3hzUU1mdkMybDlsRXNwa0pn?=
 =?utf-8?B?ck56b3hTL3VTaFgrMnBFbDNxMVlwb2I4OS80WHI2UENaNHlwaDRtUjBQaXBT?=
 =?utf-8?B?Wm1EMnVPOUgzMVNtTGsvdjlXZmxvMUhsakRRR2J6b0RDbWk3NHllRlNLSHdS?=
 =?utf-8?B?S1Q1NzU5ck5QOTA4THRVVGNWa1RSK2lrNEVnOWVabUQxNU1RZDVJT2VmTmhy?=
 =?utf-8?B?K2VvSFBsVjRRMC8razU3ZVo0aVFZb3FPRHRVL1pweEIvaGNhTmYvT0pwdi9H?=
 =?utf-8?B?WUdpc01yK0Z6VzN1M0RxV2pHZUdpMlRURTd1MEdtS0JJcDRTZ1JMdmFSUlh2?=
 =?utf-8?B?dGNtRlFxczdqalg0QW1lZnZsazhXeFVWdW04WSszdjJEamlweWpxNXU2VzNs?=
 =?utf-8?B?VUZDQVlteTRvdTV0WGZsR3dwY2dwYnZDMXQzMnJERVN1clBaNWdRR2hKQnhF?=
 =?utf-8?B?TUlCZ1JWMlkxUHZFNDEzaGlQeUxZVXRpaCswdUZwd0RFYzRJaHRpWVlLRzVP?=
 =?utf-8?B?Sy9rUUoyTmR0UWpWK1NuMEtVeDBWd1p2Y2xldlZjL3hHcFFmdHQwcElxb2Y5?=
 =?utf-8?B?K0hoa0QxM1JEaDBaRXJybStsRE1XMFJrRC9Gd28xNjZqbDlsSUxSQnBZTFZ4?=
 =?utf-8?B?RjhKY3k5UTRTQkgycmdyVDVCTGJya3NHZHN1YVYxN29lTTdCeVFXS2JRR1Vo?=
 =?utf-8?Q?oJA8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC23FE7C4848EB499BA26A820F2EFED0@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cf2f32-a774-472f-ef22-08dd090abed7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 02:26:31.2336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LP+rmddj1kKfgdzj0QQAfsPpGDNDfre3vRc1n5nAZzRwxQYGlZFLODQesxZfhgW7lb04bC7f98TYR6cD1AhUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

T24gMjAyNC8xMS8xOSAxNTo0NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE5LjExLjIwMjQg
MDg6MzEsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjQvMTEvMTggMTg6MTcsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gV2VkLCBOb3YgMTMsIDIwMjQgYXQgMDQ6MDA6MjdQ
TSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+ICtzdGF0aWMgdm9pZCBjZl9jaGVjayBy
ZWJhcl9jdHJsX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgcmVnLA0KPj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCB2YWwsDQo+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpDQo+Pj4+
ICt7DQo+Pj4+ICsgICAgdWludDMyX3QgY3RybCwgaW5kZXg7DQo+Pj4NCj4+PiBpbmRleCBzaG91
bGQgYmV0dGVyIGJlIHVuc2lnbmVkIGludCwgYXMgaXQncyB0aGUgQkFSIGluZGV4IFswLCA1XSwg
YW5kDQo+Pj4gc28gZml0cyBwZXJmZWN0bHkgaW4gYW4gdW5zaWduZWQgaW50Lg0KPj4+DQo+Pj4+
ICsgICAgc3RydWN0IHZwY2lfYmFyICpiYXJzID0gcGRldi0+dnBjaS0+aGVhZGVyLmJhcnM7DQo+
Pj4NCj4+PiBZb3UgY291bGQgcGFzcyBiYXJzIGFzIHRoZSBkYXRhIHBhcmFtZXRlci4NCj4+Pg0K
Pj4+IEFkZGl0aW9uYWxseSB5b3UgbmVlZCB0byBjaGVjayB0aGF0IG1lbW9yeSBkZWNvZGluZyBp
cyBub3QgZW5hYmxlZCBmb3INCj4+PiB0aGUgZGV2aWNlLCBvdGhlcndpc2UgYXR0ZW1wdGluZyB0
byBjaGFuZ2UgdGhlIEJBUiBzaXplIHdpbGwgbGVhZCB0bw0KPj4+IHRoZSBhY3RpdmUgcDJtIG1h
cHBpbmdzIGdldHRpbmcgb3V0IG9mIHN5bmMgdy5yLnQuIHRoZSBuZXcgQkFSIHNpemUuDQo+Pj4N
Cj4+Pj4gKw0KPj4+PiArICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMzIocGRldi0+c2JkZiwgcmVn
KTsNCj4+Pj4gKyAgICBpZiAoIGN0cmwgPT0gdmFsICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuOw0K
Pj4+DQo+Pj4gSSB3b3VsZCBzdGlsbCBjYXJyeSBvdXQgdGhlIHdyaXRlIGluIHRoaXMgY2FzZSwg
YXMgdGhhdCdzIHdoYXQgdGhlDQo+Pj4gb3duZXIgb2YgdGhlIGRldmljZSByZXF1ZXN0ZWQuDQo+
Pj4NCj4+Pj4gKw0KPj4+PiArICAgIGN0cmwgJj0gflBDSV9SRUJBUl9DVFJMX0JBUl9TSVpFOw0K
Pj4+PiArICAgIGlmICggY3RybCAhPSAoIHZhbCAmIH5QQ0lfUkVCQVJfQ1RSTF9CQVJfU0laRSAp
ICkNCj4+PiAgICAgICAgICAgICAgICAgICAgICBeIGV4dHJhIHNwYWNlIGhlcmUgYW5kICAgICAg
ICAgXiBoZXJlDQo+Pj4+ICsgICAgICAgIHJldHVybjsNCj4+Pg0KPj4+IFRoZSBmZWF0dXJlIG9u
bHkgYmVpbmcgZXhwb3NlZCB0byBkb20wIEFUTSwgSSB3b3VsZCBzdWdnZXN0IHdlIGFsbG93DQo+
Pj4gaXQgdG8gd3JpdGUgYW55IGJpdHMgaXQgd2FudHMgaW4gdGhlIGNvbnRyb2wgcmVnaXN0ZXIs
IGFzIHRoYXQgd291bGQNCj4+PiBiZSB3aGF0IHRoZSBPUyB3b3VsZCBkbyB3aGVuIG5vdCBydW5u
aW5nIGFzIGEgZ3Vlc3QuDQo+PiBCdXQgb25seSBQQ0lfUkVCQVJfQ1RSTF9CQVJfU0laRSBiaXRz
IG9mIFJFQkFSX0NUUkwgcmVnaXN0ZXIgYXJlIFJXLCBvdGhlcnMgYXJlIFJPLg0KPj4gSXMgcmVt
b3ZpbmcgdGhlIGNoZWNrIGhlcmUgZmluZT8NCj4gDQo+IEEgbmF0aXZlIGtlcm5lbCB3b3VsZCB3
cml0ZSB0aGUgZnVsbCByZWdpc3RlciAod2l0aCByL28gYml0cyBzaW1wbHkgbm90DQo+IGdldHRp
bmcgdXBkYXRlZCkuIEhlbmNlIGZvciBEb20wIHdlIG91Z2h0IHRvIGRvIHRoZSBzYW1lLCBqdXN0
IGluIGNhc2UNCj4gZS5nLiBzb21lIGZ1dHVyZSBzcGVjIGRlY2xhcmVzIHNvbWUgb3RoZXIgYml0
KHMpIHdyaXRhYmxlLg0KR290IGl0LCB0aGFua3MgZm9yIGV4cGxhaW5pbmcuDQoNCj4gDQo+Pj4+
ICsNCj4+Pj4gKyAgICBpbmRleCA9IGN0cmwgJiBQQ0lfUkVCQVJfQ1RSTF9CQVJfSURYOw0KPj4+
DQo+Pj4gU29tZSBzYW5pdHkgY2hlY2tpbmcgb2YgdGhlIEJBUiBpbmRleCBtaWdodCBiZSBnb29k
LiAgQXQgbGVhc3QgYSBjaGVjaw0KPj4+IHRoYXQgdGhlIEJBUiBpcyBvZiB0eXBlIFZQQ0lfQkFS
X01FTTY0X0xPIG9yIFZQQ0lfQkFSX01FTTMyLg0KPj4gQnV0IHRoZSBpbmZvcm1hdGlvbiBvZiB0
aGUgQkFSIHRoYXQgc3VwcG9ydCByZXNpemluZyBpcyBmcm9tIGhhcmR3YXJlKHdoZW4gaW5pdF9y
ZWJhciksIHRoYXQgc2hvdWxkbid0IGhhdmUgYW55IHByb2JsZW1zIGFuZCBkb2Vzbid0IG5lZWQg
dG8gY2hlY2sgdGhlIEJBUidzIGluZm8uDQo+IA0KPiBSaWdodCwgYnV0IGFsc28gYmV0dGVyIHRv
IGF2b2lkIGNvbmZ1c2luZyBvdXJzZWx2ZXMgb3ZlciBib2d1cyBoYXJkd2FyZS4NCk9LLCB3aWxs
IGFkZCBzb21lIGNoZWNrIGZvciB0aGUgaW5kZXggcmFuZ2UgYW5kIHRoZSBiYXIncyB0eXBlLg0K
DQo+IA0KPj4+PiArICAgIGJhcnNbaW5kZXhdLnNpemUgPSAoMSA8PCAoKHZhbCAmIFBDSV9SRUJB
Ul9DVFJMX0JBUl9TSVpFKSA+Pg0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
UENJX1JFQkFSX0NUUkxfQkFSX1NISUZUKSkgKg0KPj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICBQQ0lfUkVCQVJfQ1RSTF9CQVJfVU5JVDsNCj4+Pg0KPj4+IFRoaXMgd291bGQgYmV0dGVyIGJl
IGEgbWFjcm8gaW4gcGNpX3JlZ3MuaCBJIHRoaW5rLCBhbmQgeW91IG5lZWQgdG8NCj4+PiB1c2Ug
MVVMLCBwbHVzIHVzaW5nIE1BU0tfRVhUUigpIHNpbXBsaWZpZXMgaXQ6DQo+Pj4NCj4+PiBQQ0lf
UkVCQVJfQ1RSTF9TSVpFKHYpICgxVUwgPDwgKE1BU0tfRVhUUih2LCBQQ0lfUkVCQVJfQ1RSTF9C
QVJfU0laRSkgKyAyMCkpDQo+PiBPSywgYW5vdGhlciBxdWVzdGlvbjogU2hvdWxkIEkgbmVlZCB0
byBjaGVjayB0aGUgc2l6ZSBpcyBhbGxvd2VkIGJ5IGhhcmR3YXJlKHRoZSBQQ0lfUkVCQVJfQ0FQ
X1NJWkVTIGJpdHMgaW4gUENJX1JFQkFSX0NBUCk/DQo+IA0KPiBQcm9iYWJseSBiZXR0ZXIgdG8g
ZG8gc28sIHllcy4gV2hldGhlciB0byByZWplY3QgYm9ndXMgYXR0ZW1wdHMgb3INCj4gbWVyZWx5
IHdhcm4gYWJvdXQgdGhlbSBJJ20gbGVzcyBjZXJ0YWluOiBJdCdzIChzZWUgYWJvdmUpIERvbTAs
IGFmdGVyDQo+IGFsbC4NCkkgd291bGQgbGlrZSB0byBpZiB0aGUgbmV3IHNpemUgaXMgYWxsb3dl
ZCBieSBoYXJkd2FyZSwgdGhlbiB1cGRhdGUgdGhlIHNpemUsIG90aGVyd2lzZSBkbyBub3RoaW5n
Lg0KDQo+IA0KPiBKYW4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

