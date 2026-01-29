Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Pg/LMM7e2n0CgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:51:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AD4AF297
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216261.1526188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlPcL-00082q-Lb; Thu, 29 Jan 2026 10:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216261.1526188; Thu, 29 Jan 2026 10:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlPcL-000815-HW; Thu, 29 Jan 2026 10:51:17 +0000
Received: by outflank-mailman (input) for mailman id 1216261;
 Thu, 29 Jan 2026 10:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlPcK-00080o-1Q
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 10:51:16 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d6e6a05-fd00-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 11:51:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH7PR03MB7221.namprd03.prod.outlook.com (2603:10b6:510:240::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:51:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 10:51:09 +0000
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
X-Inumbo-ID: 6d6e6a05-fd00-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+JHizkAw9AIuKp/GWerpciJxJGWRnzsCtznX6cjSxp+N+YUGhkMtpIBBIMyJ992IRgerSiyj9WmKQgTvBUjjzgtmLT+mMY75GCZT18Vf95ZhGaHrBgrX7vBUTWn3r9QwiRyp87R1MGWfOKEsjJpyGpeRhYRy+k0jrRL1I8P1DJF1CPgXnqhT0cET5Fgt7/DeO8zZK1hP7u1pMzjzxl0KzaGKELYcYv/3P6yWPKnYb0Q37W/IPTCitklA3qqdyTKNvJzWnM9yRXBR+Wz3nUEbSyxw4JEBh1RliOxxZ7E2/XuSbubGHIaUFqTHnGyrBuRNVL8ioEL7jgSaqpE3oo81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UO/E02JirUS5JmHhGw9XAwa7apOL8OVyB2EcQjRhBPc=;
 b=GTgqOc8WkrQjlkbaY0xcbsEOoTK1Lt07TrZ9LxYRaigeKch8/F4wMmHyvRKM7hCSRexqpcFIIhqFicQM3moS0M2a8+PK3Uz0C9X9CLSMI0pD2ETXSsHGmzz82EbxgqakzuF8lZ1UKXJqeKE/jrEGSmTRs02CHTCePB3zUuQ3h7Oq9EhYoi9E6OxtSr2kfLQpcUapwcnGKli2RjS2k5+GJwfIx5BdxNDcwJP9iPlJgDYnB2WPRcDzl9QxtX46O9YJ+TI4I2jWwduCIh3UF0YRTu9kql1YRzBXBiNTfl/CkwPCxVGg5Ugxfnhm3enHotFBgHoN41WEZtVtSpRyC7vWXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UO/E02JirUS5JmHhGw9XAwa7apOL8OVyB2EcQjRhBPc=;
 b=WlZtSwDkO82cLynS6IDOiTgXNQWgsGqtbeMys8n4GHIh44dz/OwZkDP3UUa34OHMiluRX6+feT5kWdwLO4WztSkYIuX4WHJIRNITXBl0Aehn8i+lkHcqL8tYWAmnFIE9f4e8IKP/0zgxDWq9QVMKb9gaYvxgd23VHr3g89Bwcj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 11:51:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 4/4] vPCI/DomU: really no ext-caps without extended
 config space
Message-ID: <aXs7mpUU0qA8tFBA@Mac.lan>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com>
 <aXsmOEcSJaztURad@Mac.lan>
 <e1cd0c63-c19b-452a-b967-cc51a0aed0bf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1cd0c63-c19b-452a-b967-cc51a0aed0bf@suse.com>
X-ClientProxiedBy: PA7P264CA0189.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:376::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH7PR03MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fbe325-d9b5-462e-1447-08de5f244fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXFBZVV5Q2pFODRxdURidXBuODZvVGtPYzZ1RERBU2ZwVlFZbjROd1ZLL1lU?=
 =?utf-8?B?NUcxaXkyWmxra1Z2d3M4SGJWQTR0ZFVDdmVvekFTajBDaVRsS2NJU2g5RHRt?=
 =?utf-8?B?TmQ4TXBWa0ZEMU8xZnUyL3JXU1U4QVRUT3paUDZTVHQrMkFyZ2RoR0N5dGhr?=
 =?utf-8?B?SUVzVUl4QlRxY3oyby9va2Vzby9xckd3VzV1aDNoVXJxQVdwN1pzdkg5VUQy?=
 =?utf-8?B?bFJPSHNXMlFqSjY0YjF3cEczTzhzRmh3UGtQMW5UVEVXM1RSN1hOUjRnWVhN?=
 =?utf-8?B?aXBhOGF0bTE4N3doYmoyTW9GS0JkTzRSM3FwTTVMcnJhTlVCb011QnFSbG9m?=
 =?utf-8?B?Z3h5UUxEWEUzU3V1RlBMMmRXUXc4TVQ2Yk1aWmtneFVrNnpvY01RbitNRzdm?=
 =?utf-8?B?NTRoRVRiVThENS9kWm5Fazhad0Exc21jRjJaazQ4MDBpWmFJem1xZHlKcHBx?=
 =?utf-8?B?eWhUWDdaSzhFRGlOeXJ0aXg4ZHFvdERYTjBXZ0haNWxlVVFkellEbnZkSjRD?=
 =?utf-8?B?RU1GbExNbm0rZHlHd3NJSmVPNUQ3V1BpS3lpMTMwYWN2cW83emxEUldwcWpC?=
 =?utf-8?B?RnZmKzRPTHJnZjR2ZnowZjl3eWlpUUVhWE9IT3Flcy9UYU05c0ZXOEo5ZTFn?=
 =?utf-8?B?YmFwVjhaUVZGa0pnVWMrVHRrR0VhRWZIZkhrUkxrWWh1aENJWmlGanErMGE1?=
 =?utf-8?B?TTN2OW9JejllbHIzRzN4aDhxR2UxZGpYVUEwUTlOdFpXclJ6VmdPWlIwUGN6?=
 =?utf-8?B?Qmh6Mm0yUmlwaHl2QUYzNlBnN0ZISWl3bFhzdGNQUUFnMEZsYWNSaGVKYXZS?=
 =?utf-8?B?YS9GR0taTVM0dlAxdzluRFk0UysvaTFtMGxIUlNUSSs2L2VNcDVsakwxSEl0?=
 =?utf-8?B?eEdnYVNlZnlmRFhxNjB6MzM1WnlSNXE3R2dOQ0RVRkVKcjA2TlJTaGROYTFD?=
 =?utf-8?B?eWxoa2JqZ1g0ZXc3YWM1VGp0UG5hTHk3Nk9xb09Ld2RkeWxuazJYYmlPRFBm?=
 =?utf-8?B?YUQyNWxueGtZaHNCckJUSTNESEdmUlU5U2VWclh3RHEzRjBjYW15Q2diSmVF?=
 =?utf-8?B?aER0cnd4N01aUVlmcHNoMGh4eUFnb2IwQ2tCakxtTEFlOFRUKzhFbGpobzNT?=
 =?utf-8?B?aE85Wmc2UU1nNlhkTit5L3VjZElPeldNT2VLeCtITEtlejJvcFlBV2lDSlNp?=
 =?utf-8?B?YkdseFZyVi9ZSmtiVnUwdDBhYVAvQVBIbS9Za2FBQzhzTFhKcTF6cXRweU1R?=
 =?utf-8?B?OEJodEpkeEtoRjdTa00vaTVaWTM4ZXk2RUw3a3BCdmt3L0gzOWNFMHpEMTJX?=
 =?utf-8?B?cXN2ckNDNmhMZDRROUVMVVJLazRvdlZRaUVVUTZWbXR2eTVjL0RwYzNZWTlh?=
 =?utf-8?B?Tk13VjhsREtobGk0bWkybTFsQzlLakNxRS9ITDJ1dGE1ckdkbVVwNVJVU0Zy?=
 =?utf-8?B?WVhVVVBleURnSFl2NjcxRHpoanQ4YmFRMTZjT3oxSElPY0FiYmpaTnEzczdF?=
 =?utf-8?B?MXk3TXE0aWZBVGNEbVhMRmtSTks5VHV2eWs5enV0NU9zTXFSMmhHQjlha0tu?=
 =?utf-8?B?OTZ3bHY2QmpDZTYzNXhkOHcxbENhblpIdjBnbTNsR0pJSERVejdMSlBMcHhV?=
 =?utf-8?B?anJrVElPK2tXcG1naGxqcE8rTGRNNWNmbkQra1hMbDVCZmJaMk1XSmtlL1pR?=
 =?utf-8?B?anpzUmQ2V2lid2xyMWNQd09MZEFiRWtjMldmQjc5Y2RUbkFYd3FMZGFTeXFs?=
 =?utf-8?B?ZFJlUCtvd0xveVZCcDUwakFsSHAwSEwwNFpoRUdMMStCNmxJR01Zanc2bTFT?=
 =?utf-8?B?M0g3OHBPMWVhcnJpNVNERmczaWhnS0hjWnNFQ2FiWFNLYmJ0aUV4WDAxa0pU?=
 =?utf-8?B?Wk1FK2N3Z2dDVFNEOENvcG9XNnZLNm5qMkhNZnZvZmphYTRxMGZJMVNpaDlB?=
 =?utf-8?B?aStEY25KZVE0dnloSml3dVZydmxkQU8vRGtjYmR5TE03SDdndWU3MjVBWm1R?=
 =?utf-8?B?SlVDcGV1OEJsNnV0anBiN1BseTRybDVnd0tPSnRMRVdjV3AwTDlWbXFOKy9x?=
 =?utf-8?B?MHE4MEpRb0F1K2VMQS9OdmYrbDd4dUE5dzNkWU83QWVTdkhOYmk4bjUxOThB?=
 =?utf-8?Q?DBE0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2V5RjhIeGc1aVlQUm9WVGNodlF3bUtyWmxjNTQ0OHpmcC9VMHZROWxDUkRB?=
 =?utf-8?B?R21ZNFhRR0JqMlEydERBcWhYcXMva1h2bWdlc2ZPZ1lHR2FGRFVFKysvWjJt?=
 =?utf-8?B?Y0xoQ2h5MEhDbk9JdWxZdnFENHJuZGdFZDlPbXl0ZjZwZ2lzeTlaSzhEUXNi?=
 =?utf-8?B?dFN6bjRjNCtOWHhveGJyeG9vOHZOMEFRckh5N1J0QmFET3U5WlpPN0ZVOUZT?=
 =?utf-8?B?clh5b2ZnT0RoQUFnM3h6VTlzeFo3MGY5RFpGd1RCWjZSWmRnckxndHliOHhS?=
 =?utf-8?B?SW9aS0p5NU91dFptYWtLS3lSaVo1VFdIU2REbDZNTnNIMGlXT3IzV3ZDY0Qx?=
 =?utf-8?B?MWhGRGxpSmdtb3FNVHorTVBZdUZkVC9XckRmVEdzallxdDBEVlI3emNuRnM1?=
 =?utf-8?B?WWpqSlBrQld5R2NJR1luNmlwZ3NtbUxjczdZVnBnL2NWZlEzSU9tZVhkNXFN?=
 =?utf-8?B?NUdsWnBqVWFQZVBjTkU2NmM2eWJUK0NxMVpZK0pwem1JeGRpNnk2b2JFQ0dS?=
 =?utf-8?B?WVkrN0NCcVR6QUZjN202c1J0K0sxUjFEVFJEelppaXpVeDVqazh0UVY1UzVk?=
 =?utf-8?B?QS9Sd3BQSjBYR1YxeGswemRWT3JKQ21ZU3pjb1hBaGRJWTNRblJwS0hRTVVE?=
 =?utf-8?B?TWFZcWRqVGQrN3YrOXpvRTRzRDRMRHNaTWY4ZzkvOXFJTFJNRzcxZFhMUjQ5?=
 =?utf-8?B?Ti9TaHl5RTR4TVFBaTRtN3MxaUQzZlNJak1sL1ZHeGV0UU43d3NGbHRreXlo?=
 =?utf-8?B?dGxpTW05MldkdUQzLzJ6UWZpelVEa2diTFloL1p0WjFaaXZwMjk1a0NxSXJ2?=
 =?utf-8?B?SzI3RXgzSVdiTFV6blJndEpCZWpzK3JpdW1tcHRKR2NmZ2pjWmVUSWxoZGwr?=
 =?utf-8?B?Q3ZQUkhkTEd2NHoyRFl2cnNCVVpjcmZ1YndTZWV2dzlxcHJHNlJ0aTNDcU1n?=
 =?utf-8?B?VDJuT3hzaFRORC8vdG9Xb2paQm5BOWo0QmdiOFZmT3ZXU0hGUlRGdnppVVYy?=
 =?utf-8?B?djdseGVONUVnYkdvWkxlekwrYnNPSHByQ2p3UWcvWG9FMVZ1YlpublpLeUU5?=
 =?utf-8?B?WGlEQ0U2ZGpSbTNnS2lUVWh4dHBlanNhL2dmWlVqS1Z5bHVIMGQ4Ty95RUR5?=
 =?utf-8?B?VGg5a3ZMcGNIcUExRWVIMWdtSVZ5VVJ0ZTZxNVlzTGJZTEVaSEFMQ3ZvOFpO?=
 =?utf-8?B?azE0Mys5WkF6ZGpBeWpLa3BETThDTFg2M0FlVk1vMUNpL2lKYVJEOHcyQUVr?=
 =?utf-8?B?VUZiQTJqOTJVbzZKblo2V3E1dlZMU201MzVUSitpMnhvUE5wSVIxbnZGRVJP?=
 =?utf-8?B?aExzcTMwOXFEaTRyaUdVeGFBVU5iVUlBUVd4Yzk5QzdzYys0aXU4WXhQTFg4?=
 =?utf-8?B?cTIvYURRdVN0UzFCS3B6dGMvVnV0NWhyRjdQdEptM0J1UWhXdDh2MExSSTB1?=
 =?utf-8?B?NEplekNlcFVJZ2QxWDk1ams0ZVgwbGxLN3poYlB5NVdjY2ZKOCtQNGgrREFK?=
 =?utf-8?B?ZG9tdUJxTzNXTTkzMnhIV2JZbmR2bWtHT05hL1gwUS9KTDJSN3V4Y0kwZFJT?=
 =?utf-8?B?OGcwKzFEUVlEWWgzRzBOZytWTWUzb3FMaUlKcVRZWnVDcXErYW8xOU90S1lG?=
 =?utf-8?B?ZDNvMFQrejUvNHFRbElIRmg5WnFicEM4ckljeXRYOFJmcDQzb2VtemRteVQ0?=
 =?utf-8?B?aEg1MjV6UjN5ZVFucUNwY1N0ajVpaCtTMUdsZUxlRWVzVjFoWEVsaFhFZUdO?=
 =?utf-8?B?MjZQKzNCYVd6ZTJIZUlrNFJ5RnJ4eDI4TEhIZDU0bWZkSGFUaFh2UXZualZ5?=
 =?utf-8?B?L3lKdnVqWlB0d1Y1YVVaUE0wbFJPVm5qOU9GQXV0QkcvQ3VSRURQcS9vbWxy?=
 =?utf-8?B?MVN5c3NzZXRNR3JEcXNwQk5BZUhROTcvc2RaWnNGVHYvUDNEeGpmNVpFKzhX?=
 =?utf-8?B?K3lGbERwc2gvZUxkdVRhaHpKZllRdDlIbjZEL01mZnU2VlhYNWgvMTRtUUU1?=
 =?utf-8?B?M0Y2aW1HOTM1T2orc3ByZlF4UmpZU0NUVGdTcGU4TE9wQW9PMlh3S0hmMEJV?=
 =?utf-8?B?aHJiOVZKTXE2cjVSVkY4cnRnN2dDdU5aeDZjUWZpbjJlMHp5M0ZyK1B4TXRa?=
 =?utf-8?B?TmgrcG5RSzhnUzgwamRJbWRQZkxLU1RIdUJWeTVoUXVseFNpcVd4ZXBtbVhS?=
 =?utf-8?B?SERmcWlyQ2wzU2VaeW8xUzdnTkFYMlpORnR6Y3l6Ykp0bENPSmg1NS84OWd1?=
 =?utf-8?B?KzNBbStVVXVrSU43OGhndFRsZ1oyYnNPcTU3ZElnZU03bVFZYWVLNnNWSnZI?=
 =?utf-8?B?U3ExblllMmlEdGRvNVp5b1NveHoxYmRsUTFSNCt3ZjNYa1Zmb0ZYQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fbe325-d9b5-462e-1447-08de5f244fe0
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:51:09.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipf8kSVPGfiQU9Cqj1ZxKdBoOLi+P8ci8JgSua54gDNzlQglLaoxIiLibKYEXVxo8bb/HYznagvd0KwAx1oNDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7221
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 11AD4AF297
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 11:08:22AM +0100, Jan Beulich wrote:
> On 29.01.2026 10:19, Roger Pau Monné wrote:
> > On Mon, Jan 19, 2026 at 03:48:01PM +0100, Jan Beulich wrote:
> >> --- a/xen/drivers/vpci/header.c
> >> +++ b/xen/drivers/vpci/header.c
> >> @@ -830,9 +830,14 @@ static int vpci_init_ext_capability_list
> >>      unsigned int pos = PCI_CFG_SPACE_SIZE;
> >>  
> >>      if ( !is_hardware_domain(pdev->domain) )
> >> +    {
> >> +        if ( !pdev->ext_cfg )
> >> +            return 0;
> > 
> > Don't you want to possibly put this as a top-level check, so if
> > there's no extended config space we avoid doing the PCI_CFG_SPACE_SIZE
> > read for dom0 also?
> 
> Hmm, yes, didn't think about that. That'll mean dropping the
> "if ( pos != PCI_CFG_SPACE_SIZE )" from the body of the
> "if ( header == 0xffffffffU )" then, i.e. the printk() there becoming
> unconditional. It may also mean dropping "DomU" from the subject.

I've also wondered whether we want to short-circuit vpci_{read,write}
accesses if the device doesn't have extended cfg, for domUs to be on
the safe side.

Thanks, Roger.

