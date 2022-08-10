Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C372258F21A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 20:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383786.618981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLq4f-0000ti-3R; Wed, 10 Aug 2022 18:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383786.618981; Wed, 10 Aug 2022 18:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLq4e-0000rU-Vr; Wed, 10 Aug 2022 18:04:56 +0000
Received: by outflank-mailman (input) for mailman id 383786;
 Wed, 10 Aug 2022 18:04:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLq4c-0000rO-FS
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 18:04:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec97fb31-18d6-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 20:04:52 +0200 (CEST)
Received: from mail-dm6nam04lp2045.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 14:04:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB5997.namprd03.prod.outlook.com (2603:10b6:5:388::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 10 Aug
 2022 18:04:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 18:04:46 +0000
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
X-Inumbo-ID: ec97fb31-18d6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660154691;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xuPvxo01oVHQmAvqMocxKGHGXCnCvTgc2LurSfHXnuk=;
  b=WCEofq1O2l+ujFeCGs+rPcceIExGvDLEQN+Sj7bBEL+WaCgG2z1e2Ktx
   KDaTP/m7CDs4tHJpSZyXXGG7ECKyUH40AyETwiV9eoThmkMalSpu0F6Xa
   AcVzZRrobWSNjM2w64I6ZJLDF3+LpAVvxxsto9IWVGCYTdbemLzc/GeLb
   E=;
X-IronPort-RemoteIP: 104.47.73.45
X-IronPort-MID: 78246430
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eIE8pKK5AdRiXsi6FE+Rz5QlxSXFcZb7ZxGr2PjKsXjdYENS0jJTz
 GZJDzzXOauNMDT8c49yb4SzoB5Uv5HdzNZnSAdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Es01BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE4aRJHGc6etIi+sEpXzp+6
 tsSIyEvYUXW7w626OrTpuhEoO0GdJWuEKZB/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H33T+jLlW0q3rMzUYzy0HVwBZ8z/7GN93Nd8bRbc5UglyZt
 iTN+GGR7hQya4zFlWTZqSrEaunnvj2iQqY5LqyC6eNJoUGhy1MSJUUrSg7uyRW+ogvkMz5FE
 GQW8Cczqak59GSwU8LwGRa/pRasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQ10
 neZktWvAiZg2IB5UlqY/7aQ6D+3Zy4cKDdeYTdeFVdYpd7+vIs0kxTDCM55F7K4hcH0Hje2x
 C2WqC85hPMYistjO7iHwG0rSgmE/vDhJjPZLC2ONo55xmuVvLKYWrE=
IronPort-HdrOrdr: A9a23:Qzk4R6AzceL4Z5flHeiEsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U0ssHFJo6HiBEEZKUmsuKKdkrNhR4tKOzOW9FdATbsSp7cKpgeNJ8SQzJ876U
 4NSclD4ZjLfCBHZKXBkUaF+rQbsb+6GcmT7I+woUuFDzsaEp2IhD0JaDpzZ3cGIDWucqBJca
 Z0iPAmmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzI39QWUijusybjiVzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuQFNzn2jQ6sRYJ5H5mPpio8ru2D4Esj1P
 PMvxAjFcJu7G65RBD6nTLdny3blBo+4X7rzlGVxVH5p9bieT48A81dwapEbxrw8SMbzZJB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtWmk29pmdnufIPjkZYTZAVZNZq3M4iFQJuYdI99RDBmcca+d
 pVfYfhDTFtAAqnhkXizy1SKRqXLywO91m9MxM/U4euokVrdThCvjclLYok7zc9HdsGOud5D6
 6vCNUWqJheCsARdq5zH+EHXI++DXHMWwvFNCaILU3gD7xvAQOFl3fb2sRD2AiRQu1/8LIi3J
 DaFF9Iv287fEzjTcWIwZ1Q6xjIBGGwRy7kxM1S74Vw/uSUfsuhDQSTDFQ118ewqfQWBcPWH/
 61JZJNGvfmaW/jA5xA0QHyU4RbbXMeTMoWsNAmXE/mmLOCFqT68ujANPrDLrvkFjgpHmv5H3
 sYRTD2YN5N60i6M0WI9CQ5m0mdD3AX0agAYJQypdJjubTlHrc8wTQ9mBC++tyBLyFEv+g/YF
 Z+SYmX4J+GmQ==
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="78246430"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LS4LyOaXL6fLvq7b2J5bku4xzbHuP5Wp8mONtcuQdeOi2NnMjy1aH2lD80Av/h1uayVa8LmYSHQ+TgoTgWmCe+7otWZXCjSLyZOhqR692ApgT52ulMlTpIZ87GhLAkyXqYwVe/pCS2YNJEpum/Kl2pAleKaeO3MbprTKFikQFUAAp1VEctyPbkPu5NW2lBA0EsvQX6c5NIA7ARthOEb5aK5DWvo0LlZbGdngo3A+uUQpp4gdmxfNPyuhlylJDoXXkgOuHlEmjPIdmAxi+jCXoY86HSm4K7etyspI15hcegmhr0wb1wDLbXETMNo8xdDj7htWhtAUFdj4c2fNR5BrqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuPvxo01oVHQmAvqMocxKGHGXCnCvTgc2LurSfHXnuk=;
 b=aI87TLMR5AjdwDgFsjsSUe7XOIfm2mxZ8AUj0Vi2MKZGVKPIhyfObrw7vTnIsOs8cj+jynLOY6H0Y0Qi6AZid/pnoUZsNWqg01ijLLVHk32GPbTInVpFQdaK05sMs2pgwp8mCcZTVreOUncsEoHgEiAno5h70NutABKdEzdIncVGh4xC0w4Jnbjsqpkd1TWB3aJuzX8anlqqmcgGoYfSdJuBFo7KAnHbENRaH+PcS2rnZs0iPDjze3geusMZOQnJeojkeM+UQ7BKHtU8RZ5Fu0SoE4ZIdbUm0TFkac0XnR/Z6HHL1dFsFWaStfbGlHaNHHiqD+0aHpE3MjdDQpPOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuPvxo01oVHQmAvqMocxKGHGXCnCvTgc2LurSfHXnuk=;
 b=urqGZa8QBgg46V5sZlNkZCO2aiQxFMTPFSWS4uDB1Pt9hMOPiIoVcqPTKOvZYRpvVrRN6/qCij3yKCQEhoa0jQ2F43ugSRfSot9DFNVqkXJ78MHFdsyxTQ/hjf+6ZLJbyupC0NvGqJBwmLpd+sXjRRvBaTXBfaszcTAF8BTKQLo=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 04/11] x86emul: handle AVX512-FP16 move insns
Thread-Topic: [PATCH 04/11] x86emul: handle AVX512-FP16 move insns
Thread-Index: AQHYgKKvyIyZD1WQk0Gxz6uWvI7+iq2oxhKA
Date: Wed, 10 Aug 2022 18:04:45 +0000
Message-ID: <46162a8c-d670-d207-d48a-3505e40a9aec@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <3e7f95f0-fded-74e3-d4b5-da185a7ab8d8@suse.com>
In-Reply-To: <3e7f95f0-fded-74e3-d4b5-da185a7ab8d8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 327f5ff4-fbff-4679-8586-08da7afacef8
x-ms-traffictypediagnostic: DM4PR03MB5997:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VPgH+mNF7DJMpEBZUh9HRU9qybeQWJ2QCsC4wO11SZAimFo4v8q2UqGAGNB8J3quy1llvCQKcxAHiKiJb7Y5Fky+lZDqVVidYpb884149BPjHcTBOpSvyg38Il9K4ohwkZrSva8xPFgQbt5EQV4nqmNajq3CtgnQLtpqMWMaQKfkilJKaOF+rz7q8xssfn+6sok2Ycva9lCcguFouuslpW/5IFPWJEQQMqI/yMQAmEEGakaYI1XUslZFB6OBRfREZNf1kcIJI1F7jusqZwPfYcUY0zdNMBG0Ozjt0j55ggn8+HC5Ajzb+wkg2QI2vF1L6eiwCT/0o/Hgn4CHDPm3C4QcEHGfwhmbmR9Z3Ugal0eQmXstcacQg4vKuh/Lc5RDxXXXAcdyJggCwuCVhJ9R5xBVPuADGXih3X4wKsNMgZd21wViSvOPygsqL8kgZpRw6wvnQgt+4vi+zMiY/zpdv0tHIOeT08dTRKRpzbjpQX/ohwtWPm3yen8iXg8whzodHCN21XKZyAcjsoKcYKtA2fPZT+NrtU6qBmIjygSuepIYuIC2ellHFT7lHyD6sE6nvplGsDkLG7hQjqz29stbualmKn/M6cCc5ESPPed5OMQDjo6ig66t6ndS4MtxmsiQKel18m5YGd7mfXufJ5F6SkmngwO4mS5Y+nE15QStl/rJBHAYsxqzxp7RN/oXPN0zkJKYj2hDghzZJF/qMs4P7s+nZbcsGcUszoC6pLjPb2zA/yMncwO38EzxeyVcwsq0CP+k/fFp7BRUpnKZDX+u3eppd6fpTMIVB4D0aKvSmvNpNYIWp7UXZwMZ9UgjirmYOz9AShhd/jRQraooUMfOtJrjpSg2JVK+qBvn7R0rfeHJbMsERk+vjjyrr2ZmXxpt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(6486002)(71200400001)(478600001)(41300700001)(2906002)(31696002)(86362001)(31686004)(36756003)(91956017)(54906003)(110136005)(316002)(38070700005)(107886003)(186003)(26005)(38100700002)(2616005)(6506007)(53546011)(6512007)(4744005)(8936002)(66556008)(122000001)(64756008)(66446008)(66476007)(66946007)(5660300002)(4326008)(8676002)(76116006)(82960400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N0g1Y0VMOFBoc0tnZE0vc0NZVWx2bjJxNlBoWWN0UnUrYlJnYmlSbVpKcFhm?=
 =?utf-8?B?VjJ5cEg3aVp3dHJkYnhoUG11Ui9kVHg4YnNJMUhBTldrVzJTUDV6MU4zbUww?=
 =?utf-8?B?NlNRSVRzOXlTSEU2NjFnSGh4Ykl1YjZCVzRWeHd1bVhuRTJZUDZqMVQ4Zlk3?=
 =?utf-8?B?Tm9pcUVIWEY2ODVDMWg4ajJLSzRpUEJZb0YvMU9GL1d3aldHVWYremt3bGla?=
 =?utf-8?B?THgxUkx6NTliTUY0WHBLY0poRk1WaUtCSmNZRERzOUd1bHUybi9sbXhjanFE?=
 =?utf-8?B?dGhZZEFGTk1jQ1ZaQ3pSejU2UW1zS01ySnRvUU0rbGt0eFI3Y2NPY0FQUFJY?=
 =?utf-8?B?Y0Z2aE9MQUlDZnYwVmtWMHh1enR0cGwrRlpXcTREajZKcHF0NTllTVlvaFQx?=
 =?utf-8?B?b0V3cXR3RGhjKzA4VkdPTzJXQ1plT24wclpMMTloTXd2Wk9GNjdqTkl5KzI5?=
 =?utf-8?B?V01CSnVtcVpyQmFTMUVkSVpET2phazVGVHpka21heVROUmxXZzg2dW5QZ05N?=
 =?utf-8?B?cm1QUllwYzFDckNMWE5Ha1hkK2o5NUllcjhjQk01VzJGV3kxdk53cjIxNWhO?=
 =?utf-8?B?S1puRFp0SUV2UHdRUWZLdE0wd2Rqd3dPZHNsbWx0ZFhIakVONk5SQkF5djk2?=
 =?utf-8?B?RS9jT29kTXdUZzd4bk9SY1NQUmJheXoyZHFxY0NMc0YvYWMvUFpNdVJ2bFhs?=
 =?utf-8?B?OHcxT3d0ZEE3M1NjV1AwVWM4NWZ0V2duQ2UxL3Mwc0dWekhWMmtjcnhBRHBV?=
 =?utf-8?B?cjF2TmEvdVFSckw0eDRJNlZuanByWXI5NWx1RHNUSGNiVjAxdU5YN2pGK293?=
 =?utf-8?B?cDF3UHVXNytlWHhxd1A3MzFTMnBucUFPaVlXOTdBclExTFpzSFFYdHk3dUw0?=
 =?utf-8?B?dzRiL1dxVmFPWVlxL3NJNUgrVmJ2TEtrcERyK1BVb2VLRG9FQUFlRWlEOUpy?=
 =?utf-8?B?ZEU1NVNXMG05R1QxeFZ0SmlGZVBISmo1MUEvMnV1VVNiVG1VTDJqNGdlUmhW?=
 =?utf-8?B?aTZNMHlKb2djQnpGam52b29hZHlPTFI4N2tYcVhNc2l4TVZpaXFwTTBjY0xp?=
 =?utf-8?B?TXZSNThRZks3dGVZcC9ReVJ6VnRrTldQblJKb0ZDNCtWc1V5Q3dMZVFscmFY?=
 =?utf-8?B?WjRxdk9hejk1MGNURlpZMFBrMnRlUnZjZG5mZmkrUVgrSUg2VzJsa2IwM2dt?=
 =?utf-8?B?SnJWVytoRnNETVlJYVczSitoZWJrWlFOQkc5a2NTMi9YcWdOVXlCczJRVGRN?=
 =?utf-8?B?N1RlM3J0SXpEaGpyWS91MmlLYm11OVV5UkRpL1FSL1EwTCtZZmlKa3pGb2NQ?=
 =?utf-8?B?U2N6b3YxWkNRSUJSMnhXaGw0OXU4dVUwY012ejZMVXA2SXpKWXNRUk9GSm0y?=
 =?utf-8?B?aFZVOVVva3NQT3Z6bURRNDVYK2dha3krSEtQZG5FbGo2aW5lVlRObStPOWsz?=
 =?utf-8?B?TEJhSmpPZXBiSm1GZGtHaWpjYU1nTFBtcU5JbjlZaU00L1E5bmxOaXFqMUx5?=
 =?utf-8?B?UkVCelpsNFZmOTJ1T1FacVhsZTYwYVhJUEI1eEx5aFk4Y1NNN2QwN3hza0NK?=
 =?utf-8?B?eXlsSHZYUCsxR2Y2cnRyazlNdDgvWUNDendrRXBzQks5VzcxSk1Iam1rYVhZ?=
 =?utf-8?B?TzVhZzNGL3lQMlZDVitQU21DU1pBOGJaNmlydXhoWnFieFFEbDdFbFlIZmJx?=
 =?utf-8?B?ZjBsT2VUS05MUlI5T3VPZG5VMTJEejh1Wk9XMmFVOGxmSi9pUXR3WDFxUjhB?=
 =?utf-8?B?YVZnTjNjT3Y5KzNYcDFQa01xaWF6REpmQUtsazZxelE2YjU1bHUwN2ZkNkhq?=
 =?utf-8?B?OU9YQ0xQeVJTUTFOM3ZiaDlURDVObTFwWmVwdERHU05wMUs0bXlHVjhaRUFZ?=
 =?utf-8?B?TU4zUTdGUXBiNE05UTBraXV1Z3planBDTXZBbEFGbnZJbWEvT3NwTlVLRzl2?=
 =?utf-8?B?K1MwRG1oRnlvMXNFUFdlRGsyalJTU2wzcHdVMnlJdURTeS9FUkNMZTlQVnNL?=
 =?utf-8?B?RUs3Z3hjdldHVTFCSjhPTVVPYkZrRjRpNnZMRkZXSzRqb0Y3S1Z0bERYeWpr?=
 =?utf-8?B?Q1l5eXlaQzNGcTU2N2p1Z3pQeVU1WFFaK2VnZ0g0TTZDRjJWNVNsekRTZW12?=
 =?utf-8?Q?DbU3K9ac9azX5fi+BS+Bjwf2X?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FED65F684EAD040880968E0006C3EBD@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OLMeBYlI1lPn2KIZKcygqF2Q1/9vHLK8IzlU+jueDYhHR4/A8o8SYOxZ01oUKgSAN17X3L0x5qlwLkTxpt99DE73prm76wtnLW3IyrsbdJDlrsva3Q1fbiX8D4c+3fp2++HlwYt+9jRfaAc4ApcIMH5xxfX081S+zYgE3OxmOv0g6NW6mCRVqnH4Z9I6Vj3nS2MRPIaLge5bvyVgX0ce8YLka/fDB7d78ESZhNiSy8ZfvJcZnRDkqKqOC7HJq0a2kLap6/TzEctBnAFbeKqtPYVtQXW/RW++pDtJ9YshsRueUFYk1q478wunX4vQx3SwVBTI2mleJxqci7gapFPER/OCKymR/F6BwWhxIgfqkqwBpKu9F/eI0HEUynhaQ82yFxIOtVYO8wg1tL9eAFXYZ4u0No3swlR7OI10d5gzSRhYJKy69fyHJx4JMbNnXUEv9JsMR6NP5Zdfre6YjEf4SuYTylh+A9wd/N3l+UGJhDdyO21eDORxZ1xP0lNEgwyedRQkVqhE81RZmKYS4EPfg/5Ldcaf4Dc7k4rQrV41LSPX2ta3Jln335ea0gmcdGiKFG+1wjwMwmpLKVDHoQQJDn9GzZWwlqfAgYapDZUHgHpijTdSC09KO2NPNHFjYhyeEQ3m+YITb9ABC4MPdOi5VlE236rIa9NrasbM08OLGmCeMUNpKUGJn0xRIG6mm7pRw4/TBd+23+513UHntk09hmu8Oe4oK+Ll37CvUtRp0dKK7VGxDYMCICN8gDmBk+cMgFT4eiEDIlV5gkz39/Iu5LaJROVdG+TlMwZav5vv9JTgzb/agCCzmYlXg/NrQ4dB
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 327f5ff4-fbff-4679-8586-08da7afacef8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 18:04:45.8996
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mAcb7D4SqfrGGM6P93h+a961m3mNz9zpWg99XLBQ9FMYT+Mc8DJz+a5yZK0cuv3krhipolqQ13+Qb1oQKXu1yvnaCiK+rtbxVgYUIyAAqmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5997

T24gMTUvMDYvMjAyMiAxMToyOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni94ODZfZW11bGF0ZS9kZWNvZGUuYw0KPiArKysgYi94ZW4vYXJjaC94ODYveDg2X2VtdWxh
dGUvZGVjb2RlLmMNCj4gQEAgLTU4NSw3ICs1ODUsNyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGRl
Y29kZV9kaXNwOHNjYWxlKGVuDQo+ICAgICAgICAgIGJyZWFrOw0KPiAgDQo+ICAgICAgY2FzZSBk
OHNfZHE2NDoNCj4gLSAgICAgICAgcmV0dXJuIDIgKyAocy0+b3BfYnl0ZXMgPT0gOCk7DQo+ICsg
ICAgICAgIHJldHVybiAxICsgIXMtPmZwMTYgKyAocy0+b3BfYnl0ZXMgPT0gOCk7DQo+ICAgICAg
fQ0KDQpUaGlzIGh1bmsgbG9va3MgbGlrZSBpdCB3YW50cyB0byBiZSBpbiBhIHByZXZpb3VzIHBh
dGNoPw0KDQp+QW5kcmV3DQo=

